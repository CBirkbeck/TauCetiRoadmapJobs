# Review of InformationTheoreticCryptography (pull request #2947 at 0886d8d)

**Verdict:** accepted

**Summary.** Accepted: no finding. Every statement, Check and proof route of the three layers was recomputed (degenerate cases, both directions of each equivalence, the Lean signatures against the prose) and none failed; the Beimel locators agree with the text. There are two small corrections (the entropy form can take subadditivity from a roadmap on main instead of an open one; one Check says "finiteness is needed" where countability suffices) and one format note, none blocking. For a human: the Boneh–Shoup locators of Layer 1 could not be checked against the text, and that source is an unpublished book draft.

## C01 — The route of 1.5 takes `H((Kv, Cv)) ≤ H(Kv) + H(Cv)` from an open roadmap although a roadmap on main already states it

The third step of the route of 1.5 (README lines 239–246) derives subadditivity from the submodularity theorem of EntropyAndSourceCoding §1.1, through a `Bool`-indexed family, `Fintype.equivFin` to bring the value types into one universe, and the entropy of the empty joint label. ProbabilisticAndMetricNumberTheory §5.2, on main, defines the finite mutual information as `H(X) + H(Y) − H((X, Y))` and lists "Mutual information is nonnegative" in its API, for measurable labels into finite nonempty alphabets: that is the inequality needed, directly. EntropyAndSourceCoding's own scope section says the same of §5.2.

Citing §5.2 for this step would shorten the route to one line, and this roadmap would then consume only Mathlib and a roadmap on main: the "Depends on" block of the description, the `*Needs:*` line of 1.5, the Layer 1 dependencies and the supplier contract for EntropyAndSourceCoding would reduce to the remark that the definition of `labelEntropy` agrees with the copy there. The present citation is valid as it stands; this is an offer.

## C02 — "Finiteness of the key type is needed" (first Check of 1.2) is shown by an uncountable key type; the statement holds for countable keys

The Check (README lines 135–140) uses `K = ℝ` with the uniform law on `[0, 1]`. That witness shows that some restriction on `K` is needed, not that finiteness is: for a countable `K` with measurable singletons the route of 1.2 goes through unchanged, since `κ {k | E.enc k m ∈ A}` is the sum of `κ {k | E.enc k m = c}` over the countably many `c ∈ A` that are values of `E.enc · m` or `E.enc · m'`, and perfect security equates the two sums term by term. The same holds for the events form in 1.1 ("when the key type is finite", line 92). A reader concludes that 1.2 cannot be stated at the generality of 1.4, which already assumes only `Countable K`.

Either reword the Check ("a restriction on the key type is needed; countability would suffice") or state the first theorem of 1.2 and the events form for a countable key type, as 1.4 is.

## N01 — Layers 2 and 3 of `Suggested.lean` fix parties, secrets, fields and row indices in `Type`, Layer 1 uses `Type*`

The README says only "a type". `Rand` and `Share` must live in a fixed universe, but `P` and `S` need not; either make them universe-polymorphic or add a line to the Conventions saying that schemes are stated in `Type`.

## Verified sound

| Statement | Instances tried | Values computed | Result | Change |
|---|---|---|---|---|
| 1.1 `IsPerfectlySecure` | `ZMod 3`, `enc = m + k`, key mass `1/2` on `0, 1`; key-ignoring cipher; zero measure | `κ{enc k m = 0}` = `1/2, 0, 1/2` for `m = 0, 1, 2`; `1` vs `0`; all equalities `0 = 0` | Checks true; wrong model (equal maps) rejects one-time pad | none |
| 1.2 `indepFun_enc_of_isPerfectlySecure` | arbitrary σ-algebra on `C`, `Kv` only a.e. measurable; `K = ℝ` control; `Kv = Mv` on `ZMod 3` | `μ(Mv=m, Cv∈A) = μ(Mv=m)·κ{enc k m ∈ A}`, last factor constant in `m`; control: `Cv ≤ 1 ⇔ Mv = false`; `1/3 ≠ 1/9` | true as signed; holds also for countable `K` | C02 |
| 1.2 `isPerfectlySecure_of_indepFun` | constant `Mv` with `enc = (k, m)`; `Kv = W − Mv` on `ZMod 2`; `M` empty | `1/2` vs `0`; `P(Kv = 0) = 9/16 + 1/16 = 5/8`; vacuous | true; both hypotheses needed | none |
| 1.3 `isPerfectlySecure_oneTimePad_iff` | `{k | m + k = c} = {−m + c}`; trivial group; `ZMod 2` law `(3/4, 1/4)`; non-abelian (order of `m + k` kept); zero measure | all singleton masses equal ⇔ uniform; Dirac = uniform; `3/4 ≠ 1/4` | both directions true; probability hypothesis in scope | none |
| 1.4 `exists_injective_of_isPerfectlySecure` | no measurable singletons on `K` (outer measure); `M` empty; `K = ℝ` control; one-time pad `ZMod n` | some `κ{k₀} > 0` by countable subadditivity; `m = dec (f m) c`; empty map; `n = n` | true as signed | none |
| 1.5 `labelEntropy_le_labelEntropy_of_indepFun` | `ZMod 4` fair-bit message; `Kv = Mv` on `ZMod 2`; trivial σ-algebra on `C`; `negMulLog (x+y) ≤ negMulLog x + negMulLog y` | `log 2 < log 4`; `log 2 = log 2`; control `log 2 ≤ 0` false; `H(∅-label) = negMulLog 1 = 0` | true; route sound | C01 |
| 2.1 definitions | one secret; `S` empty; shares `(r, s + r)` on `ZMod 2`; correct and private set | every family realized; each share uniform; forces `|S| ≤ 1` | Checks true; equal-shares model rejected | N01 |
| 2.2 `card_le_card_share` | `S` empty; `j ∉ B`; redundant third party over `ZMod 3` | `0 ≤ n`; `B.erase j = B` contradicts hypotheses; `1` share for `3` secrets when `B.erase j ∈ 𝒜` | true; hypothesis needed | none |
| 2.3 `realizes_orScheme`, `realizes_andScheme` | `T ∉ 𝒜₁`, `T ∉ 𝒜₂` separately; trivial group; `u ≡ 0` control; non-abelian order | law `= p₁(v₁) · avg_w p₂(w, v₂)` resp. `p₂(v₂) · avg_u p₁(u, v₁)`; `u + (−u + s) = s` | true | none |
| 2.4 `exists_realizes_iff` | `P` empty; `𝒜` empty; two parties; `P = ℕ` threshold 2; `|S| = 1` | only `𝒜 = ∅` both sides; constant shares; 5 upper families of nonempty subsets; pigeonhole on partitions of `S × Rand` | both directions true | none |
| 3.1 `realizes_shamirScheme` | `t = 0`; `ZMod 5`, `α = 1, 2, 3`, `s = 4`, `a₀ = 2`; `α i = 0`; repeated point | shares `1, 3, 0`; `2·1 + 4·3 = 14 = 4`; `|F|^(t−|T|)` strings per share vector; share `= s` | true; threshold `t + 1` matches source's `t` | none |
| 3.2 `realizes_mspScheme` | `B = ∅`; `b = 0`; rows `(1,1), (0,1), (1,2)`; rows `(1,1), (2,2)` over `ZMod 3`; count | `e₁ ∉ {0}`; determinants `1, 1, −1`, `(1,2) ∥ e₁` iff `2 = 0`; span `= F·(1,1)`; `5036 + 166866 = 171902` | true | none |

- Source locators checked against the text: 12 of 12 for Beimel (Definitions 1, 2, 4, Claims 1, 2, Lemma 2, §§3.1, 3.3, 3.4, with pages); 0 of 10 for Boneh–Shoup.
- Library declarations opened at the pin: 30 (among them `MeasureTheory.measure_iUnion_null_iff`, `Mathlib/MeasureTheory/OuterMeasure/Basic.lean` line 116; `MeasureTheory.Measure.ext_of_singleton`, `Measure/Dirac/Basic.lean` line 59; `ProbabilityTheory.HasLaw`, `Probability/HasLaw.lean` line 39; `Real.negMulLog_mul`, line 177; `Lagrange.eq_interpolate`, line 361; `Matrix.det_vandermonde_ne_zero_iff`, line 234); every file and name of the Mathlib contract exists as cited.
- Library search by object (cipher, secret, Shamir, span program, entropy) in the pinned Mathlib and Tau Ceti: no cipher, secret-sharing or span-program declaration; no label entropy.
- Cross-roadmap citations resolved: 2 (ProbabilisticAndMetricNumberTheory §5.1a on main, README line 6681; EntropyAndSourceCoding §1.1 at its open head, where `labelEntropy` is character for character the copy here and `labelEntropy_subLabel_union_add_inter_le` is declared).
- Dependency check: `depcheck: 170 roadmaps, 1984 edges, 0 problem(s)`; no UPWARD or CYCLE line.
- Elaboration of `TauCetiRoadmap/InformationTheoreticCryptography/Suggested.lean`: 11 `sorry` warnings and nothing else; the 26 elaborated types compared with the README, no binder lost; single `import Mathlib`, no `set_option`, no sorried data.
- Headlines: all 11 README headline statements are stated; one-tactic probes (`simp`, `rfl`, `infer_instance`, `aesop`, `simp` with the definitions unfolded) close none.
- Pull request text: the counts (11 theorems, 13 definitions, 2 structures), the supplier list and the "adds a roadmap" statement agree with the head; no change outside the folder.

Overlap check: read ChannelCoding, EntropyAndSourceCoding, RateDistortionTheory; nothing shared (none mentions ciphers, secrecy or secret sharing; the entropy definition is owned by ProbabilisticAndMetricNumberTheory §5.1a and copied, with citation, here and in EntropyAndSourceCoding under distinct namespaces). A search of all open heads and main for perfect secrecy, one-time pad, secret sharing, Shamir and span programs found only this roadmap.

Source independence: 14 passages compared with 1 source (Beimel), none shared; largest share Beimel, 12 of 22 locators; contents compared with Beimel: independent (Layer 2 draws on its §2, §5.1, §3.4, §3.3 in that order, Layer 3 on §3.1 and §3.5). Boneh–Shoup's text and contents could not be read.

Research link: Layer 2–3 are the definitions and constructions (Shamir 1979; Ito–Saito–Nishizeki 1987; Benaloh–Leichter; Karchmer–Wigderson 1993) on which the open share-size problem rests, stated as Conjecture 1 of Beimel's survey (Beimel p. 2); Layer 1 is Shannon's theory of perfect secrecy, as the README's references attribute it.

## Not verifiable

- Boneh–Shoup, version 0.6: Definition 2.1 (p. 8), Theorems 2.1–2.5 (pp. 8–12), Examples 2.1, 2.4, 2.7, cited in 1.1–1.4. The sources service found no copy it accepts (the address the README gives does not name an author, and a search by citation found nothing), so numbers, pages and hypotheses were not checked. The statements themselves were verified by computation.

## Source issues

- **Misprint** in Beimel at §3.1, p. 7 (the definition of the polynomial): the source says the sum of the random terms runs up to index `t`, with only `t − 1` coefficients chosen; it should be up to `t − 1`, as the degree bound two paragraphs later confirms; affects nothing.

## For the human reviewers

- **Licence / not tested.** Boneh–Shoup v0.6 (all ten locators of Layer 1) is an unpublished book draft on a page the sources service could not classify as an author's; wording and arrangement of Layer 1 were not compared with it.
- **Scope.** Layer 1's only cited source is that draft; the results are Shannon's (1949), which the README names without a locator. Beimel's survey is a published survey read from the author's page.
- **Topic.** `metadata.toml` files the roadmap under `math.PR`; the subject is cryptography and information theory.
