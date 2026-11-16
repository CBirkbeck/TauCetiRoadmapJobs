<!-- from CBirkbeck, https://github.com/TauCetiProject/TauCetiRoadmapJobs/pull/13063#issuecomment-6906033557 -->
Red team round 1 pass a (claude) of deb125c

Verdict: needs_changes

1. **F01** (P2) The CS-auxiliary pair `(p, 𝔭)` does not record the place `u`, and the condition depends on it

   **Location.** `packages/IgusaVarietiesAndTorsionConcentrationPartII/README.md:335` (§8.7): "A pair
   `(p, 𝔭)` is a CS-auxiliary pair for `ρ̄` if … and for every prime `𝔭_i` of `F` above `u`
   (`p = uu^c`) the following holds." Also the Conventions (line 34), §8.5(4) (line 295), §8.7 API
   (lines 344–346), §11.6 (line 657).

   **Claim.** The predicate is a function of `(p, 𝔭, ρ̄)`.

   **Witness.** `u` is one of the two places of `𝒦` above `p` and is fixed nowhere (not by `𝔭`, not
   by `ι_p`). Replacing `u` by `u^c` replaces each `S_i` by `S_i ∘ c` (same number of `τ` with
   `p_τq_τ ≠ 0`) and "generic at `𝔭_i`" by "generic at `𝔭_i^c`". Take the datum of the README's
   Worked examples (`F⁺` real quadratic, `n = 3`, `(1, 2)` at `τ₀`, `(0, 3)` at `τ₁`), `p` split
   completely in `F`, `p ≡ 7` mod `ℓ = 11`, `ι_p⁻¹ ∘ τ₀` inducing `𝔭_1 | u`, and
   `ρ̄ = 1 ⊕ χ ⊕ χ²` with `χ` unramified above `p`, `χ(Frob_{𝔭_1}) = 2`, `χ(Frob_{𝔭_1^c}) = 1`
   (Grunwald–Wang, order 10). With `u`: eigenvalues `{1, 2, 4}` at `𝔭_1`, ordered ratios
   `{2, 6, 4, 3}`, none in `{1, 7}`: the pair is auxiliary. With `u^c`: `S_1 ∘ c = {τ₀c}` sits at
   `𝔭_1^c`, eigenvalues `{1, 1, 1}`, ratio `1`: it is not. §8.7 allows every continuous semisimple
   `ρ̄`, so both readings are admitted and give different truth values. [CS17] Theorem 6.3.1(2)
   (CS17 lines 4409–4413) takes "`p = uu^c`" inside the existential hypothesis.

   **Repair.** In §8.7 replace the sentence by:

   > A pair `(p, 𝔭)` is a CS-auxiliary pair for `ρ̄` if `p ∈ Spl_{𝒦/ℚ} ∖ (S ∪ {ℓ})`, `𝔭 | p` is a
   > prime of `E`, and there is a place `u` of `𝒦` above `p` such that, for a (equivalently every)
   > `ι_p` compatible with `𝔭` and every prime `𝔭_i` of `F` above `u`, the following holds. […]
   > We say the pair is auxiliary *through `u`*. The condition does not depend on the `ι_p`
   > compatible with `𝔭`: two of them differ on `ℚ̄` by an element `g ∈ Gal(ℚ̄/E)`, which replaces
   > `S_i` by `g⁻¹S_i` at the same `𝔭_i` and preserves signatures. It does depend on `u` for a
   > general `ρ̄`: passing to `u^c` replaces `S_i` by `S_i ∘ c` and `𝔭_i` by `𝔭_i^c`.

   In §8.5(4) and the last §8.7 API bullet add "through the same `u`". In the Conventions (line 34)
   write "At an auxiliary prime `p` split in `𝒦`, with a chosen place `u | p` of `𝒦` (`p = uu^c`)".
   In §11.6 step 1 write "Fix `u` through which `(p, 𝔭)` is auxiliary; `𝔪^∨` has the pair through
   the same `u` (§8.5(4))". Add the witness above as a §8.7 Check (negative control: a definition
   that fixes `u` silently gives two predicates). Tested on the witness: with the existential form
   the pair is auxiliary (through `u`), under either labelling of the two places.

2. **F02** (P3) §11.4 uses `S′` in Case 1 without defining it

   **Location.** `packages/IgusaVarietiesAndTorsionConcentrationPartII/README.md:630–635`: "In Case 2
   put `S′ = S ∪ {∞, p} ∪ Ram(ϖ)` …"; then (3) "`[H_c(I^b_Mant, ℚ̄_ℓ)]^{S′-ur}`" and (4) "In Case 1,
   it is `π_f^{S′}` for a `π_f` in the formula of §10.3."

   **Claim.** (3) and (4) are stated for both cases.

   **Witness.** `S′` is defined only "In Case 2" (line 630, and Conventions line 38 "In the trace
   layers of Case 2"); Layer 10 never introduces an `S′`. In Case 1 the symbols `S′-ur`, `S′_fin`,
   `𝕋^{S′_fin}` and `π_f^{S′}` have no referent.

   **Repair.** After the Case 2 sentence of §11.4 add: "In Case 1 put `S′ = S ∪ {∞, p}`, so
   `S′_fin = S ∪ {p}`, `𝕋^{S′_fin} = 𝕋^{S∪{p}}`, and the `S′`-unramified part is the part with
   `K^{S∪{p}}`-invariants." (Consistent with §11.5 step 3, "In Case 1, use §10.4 with bad set
   `S ∪ {p}`".)

3. **F03** (P3) Locator "Theorem 1.1(1)" / "Theorem 1.1(2)" into a theorem that has no numbered parts

   **Location.** `packages/IgusaVarietiesAndTorsionConcentrationPartII/README.md:643` ("Theorem 1.1(1)
   and Remark 1.2, p. 651"), `README.md:728` (three times "the hypothesis of Theorem 1.1(2)"),
   `packages/IgusaVarietiesAndTorsionConcentrationPartII/Suggested.lean:62` ("the hypothesis of CS17
   Theorem 1.1(2)").

   **Witness.** CS17 lines 89–95: Theorem 1.1 is one unnumbered statement (existence of `ρ_𝔪`, then
   the completely decomposed hypothesis). Parts (1)–(2) exist only in Theorem 6.3.1 and in the
   README's own §11.7.

   **Repair.** README line 643: "Theorem 1.1, first assertion, and Remark 1.2, p. 651, CS17 lines
   89–100". README line 728: replace each "Theorem 1.1(2)" by "§11.7(2) ([CS17] Theorem 1.1, CS17
   lines 92–95)". `Suggested.lean` line 62: "(the hypothesis of the second assertion of CS17
   Theorem 1.1, README §11.7(2))".

4. **F04** (P3) `AL.3 «Strong multiplicity one»` is a layer, not the target used

   **Location.** `packages/IgusaVarietiesAndTorsionConcentrationPartII/README.md:142, 448, 450, 497`:
   "AutomorphicLFunctionsAndLocalFactors AL.3 «Strong multiplicity one»: an isobaric representation
   of `GL_m(𝔸_F)` is determined by its components outside a finite set."

   **Witness.** At the supplier's head AL.3 is "Layer AL.3: Rankin–Selberg theory and function-field
   factors"; the statement used is `#### AL.3.7.2 Strong multiplicity one for isobaric sums`
   (AL.3.7.1 is the cuspidal case).

   **Repair.** Replace "AL.3 «Strong multiplicity one»" by "AL.3.7.2 «Strong multiplicity one for
   isobaric sums»" at lines 142, 448 and 450, and "AL.3" by "AL.3.7.2" in the Layer 9 Dependencies
   (line 497).

5. **F05** (P3) `*Needs:*` edges to EndoscopicTransferAndUnitaryTraceComparison §6.23, which the routes do not use and whose hypotheses exclude Case 1

   **Location.** `packages/IgusaVarietiesAndTorsionConcentrationPartII/README.md:509` (§10.1 *Needs*
   "§§1.8, 1.16, 6.7, 6.23, …"), `README.md:550` (§10.4 *Needs* "§§6.8, 6.23, 6.25"), `README.md:590`.

   **Witness.** Supplier §6.23 hypotheses at its head: signature `(1, n−1)` at one place and `(0, n)`
   elsewhere, `[F₀:ℚ]` even, `D` split away from one pair of places. §10.1's route uses only §§8.21,
   1.8, 1.16, 6.7 (its own local-index argument replaces §6.23); §10.4's route uses §6.8 and the gap.
   §6.23 is mentioned only in the Layer 10 Examples as the classical special case.

   **Repair.** Delete "6.23" from the *Needs* lines of §10.1 and §10.4 (and "6.25" from §10.4, which
   its route does not use either); in the Layer 10 Dependencies keep "§6.23 (Examples only)".

One P2 (a definition that does not determine its object) and four P3 findings. No P1. No finding is
re-raised from a repair report (none was marked `not actionable in this package`).

## Verified sound

Counts: 4 Lean declarations read (whole file, 97 lines); 35 README targets read (§§8.1–8.9,
9.1–9.6, 10.1–10.6, 11.1–11.8, with every API bullet), README read in full (738 lines); 38 source
locators verified against the cached texts (30 in CS17, 8 in the four Shin texts); about 40 Checks
and worked values recomputed (the values are in the table below); 136 cited sibling sections and
named targets resolved by heading at the suppliers' heads or on main, of which the statements of
about 45 were read against the README's description (all exist; one imprecise, R04; one unused,
R05); 10 pinned declarations grepped with their files (`NumberField.IsCMField`,
`NumberField.maximalRealSubfield`, `HeckeRing`, `IsArithFrobAt`, `Ideal.inertia`,
`Ideal.primesOver`, `Ideal.LiesOver`, `HeckeCosetModule.instRingHeckeRing`,
`HeckeAntiInvolution.ofAmbient`, `HeckeAntiInvolution.onHeckeCoset`).

**Dependency check** (command of the brief, run on the head):

    depcheck: 241 roadmaps, 2269 edges, 0 problem(s)

No UPWARD or CYCLE line. `scratch/citations.md` lead `LocallySymmetric.FrankeInput`: it is the
hypothesis named in ArithmeticLocallySymmetricSpaces ALS.5b.4 on main (README lines 4387, 4435
there), cited as that roadmap's name, not a pinned declaration: no finding.

**Declared gaps.** The three slugs are in `design/plan.json` `gaps` with the same suppliers and
sections as the README (`AG2.2`, `§6.3`, `AG2.7`). Each `needs` is one statement with its
hypotheses. Minimality checked: supplier §6.3 states only finiteness of `Ram_ℚ(ϖ)`; AG2.7 «Unitary
discrete-parameter export» keeps the comparison only for a supercuspidal summand with the parameter
supplied as input; AG2.2's assembly is the two-block transfer for `B = F`. Not raised.

**Suggested.lean.** Single `import Mathlib`; namespace correct; no `set_option`, `lemma`, `#eval`,
sorry'd data. The elaborated types of `scratch/signatures.md` were compared with README §§8.7–8.8:
all four carry every binder in their own signature; nothing changed. One-tactic probe, by reading:
both theorems need Chebotarev (absent from the pinned Mathlib: no `theorem … chebotarev` under
`Mathlib/`), neither follows from the sibling's `infinitelyManyDecomposedGenericPrimes` (weaker
predicate, ratio `1` allowed); no padding. Headlines of Layers 9–11 need carriers absent at the pins
and are named in the module docstring. No fully qualified name coincides with a readable sibling's
(`IsStrongGenericAt`: no match on main or in any open roadmap).

**Ownership.** Searched by object (`simple Shimura varieties`, `Theorem 6.3.1`, `Theorem 5.5.7`,
`wholly definite`, strong genericity). AG2.1a «The compact unitary PEL instance» and
EndoscopicTransferAndUnitaryTraceComparison Layer 9 own Shin's Harris–Taylor datum only; the parent
owns the rank-`2n` quasi-split forms; AG2.7 owns the local predicate and the weak existence theorem,
both cited. This roadmap is the owner of the Case 1/Case 2 data and of the strong global predicate.

### Adversarial pass (values computed)

| Statement | Instances | Values on each side | Result |
|---|---|---|---|
| `IsStrongGenericAt` (Lean) | `n = 0`; `n = 1`; `v ∣ ℓ`; `Q` ramified with `r` trivial on inertia | `n = 0`: empty product `1 = charpoly`, holds at every maximal `v ∌ ℓ`; `n = 1`: no pairs, reduces to `v ∤ ℓ` + inertia; `v ∣ ℓ`: `(ℓ : 𝓞 F) ∈ v`, false | agrees with README §8.7 |
| `IsCompletelySplitStrongGenericPrime` | `F = ℚ`; `p = ℓ` | `ncard = 1 = finrank`; `p = ℓ` fails at any `v ∣ p` | implies AG2.7's `FiniteModelDecomposedGenericPrime` (`p ≠ ringChar k`, ratio `≠ p`), not conversely (`{3, 3}`, `q = 7`, `ℓ = 11`: `21 ≡ 10 ≠ 3`) |
| `infinite_setOf_isCompletelySplitStrongGenericPrime` | `p₀` ramified in `L` but not in `L_r`; `n = 0`; `F` not Galois | Frobenius classes above `p` in `Gal(L_r/F)` are `{gσg⁻¹|_{L_r}}`, same set as for `p₀`; `p ≡ p₀` mod `ℓ`; discard the finitely many `p` ramified in `L` | true |
| `infinite_setOf_isStrongGenericAt_degree_one` | `v₀` of degree 2; `v₀` ramified in `L` | class of `Frob_{v₀}` in `Gal(L_r(ζ_ℓ)/F)` fixes `q_v` mod `ℓ`; degree-one primes have density 1 | true |
| §8.1 dimension, SV3 | `[F⁺:ℚ] = 2`, `n = 3`, `(1,2),(0,3)`; `n = 1`; `(2,0)/(0,2)`; quaternion datum at 5 | `d = 2` (all embeddings: 4); SV3 vacuous at `n = 1`; `h` scalar, `dim G^ad = 3`; invariants `1/2 + 1/2 ≡ 0` | sound |
| §8.3(5) central translation | `S_i = {τ, τ′}`, `(1,1)`, `(2,0)` | bound `diag(t², t)`, `κ = −3` vs `−1`; `det` valuation of `p` is `2`; Newton `((−1/2,−1),(−1/2,−1))`, `⟨2ρ,·⟩ = 1 = d` | sound |
| §8.4 Satake image of `P_v` | `n = 2`; general `i` | `q^{i(i−1)/2} q^{i(n−i)/2} = q^{i(n−1)/2}`; `e_2 = q x_1x_2` | sound |
| §8.5(1)–(2) | `n = 1`; `n = 2`, `q = 7`, `ℓ = 11`, roots `{1,2}`, `{3,6}`; `deg` at `q = 5`, `ℓ = 3`; `𝔽_9` | exponent `i(i−1)/2 + n(n−1)/2 − (n−i)(n−i−1)/2 = i(n−1)`; `T_1 ≡ 3`, `T_2 ≡ 5`; dual `X² − 5X + 8`, roots `{7, 9}`; `{3,6} ↦ {6,3}`; `X² − 6X + 5`, mod 5 roots `{0,1}`, mod 3 roots `{1,2} ↦ {2,1}`; `a⁻¹ = −a` | sound |
| §8.5(3), Examples | geometric vs arithmetic | `ε̄^{−1}(Frob) = 7`; arithmetic would give `{8, 4}` | sound |
| §8.6 | `d = 0`; `𝔪 ∌ ℓ` | pairing on functions on a finite set; both localizations zero | sound |
| §8.7 CS-auxiliary pair | `u` versus `u^c` | `{1,2,4}` generic at `𝔭_1`; `{1,1,1}` not at `𝔭_1^c` | **R01** |
| §8.8(b) | definite at all but one place | `τ₀` and `τ₀c` both nontrivial, one in `⋃S_i`; degree one + `p ∉ S` gives `p` split in `𝒦` | sound |
| §8.9 | `ℤ[T]/(T⁴−1)`, `ℓ = 5`; `𝔪_2`, `ℓ = 3`; inert `p`, `(2,0),(0,2)` | `i ≡ 2`; `2 − i ≡ 0` mod 5 on the `−i`-line, ordinary localization `ℤ_5 ⊕ ℚ_5`; `ℤ_3 ⊗ ℤ_(2) = ℚ_3`; Newton average `(−1/2,−1/2)`, class of `p⁻¹` over `F_𝔭` | sound |
| §9.4, §10.5 normalization | trivial rep of `GL_2`, `q = 7` | eigenvalues `7, 1`; `X² − 8X + 7`; `S(T_1) = 8` | sound |
| §9.6 | characters with ratio `|·|^{±1}` excluded in both orders | (ii) is over ordered pairs `a ≠ b` | sound |
| Layer 9 Example | `GL_2`, `D^×` | `LJ(Ind) = 0`, `LJ(St) = 1`, `LJ(1) = −1` (agrees with supplier §10.32) | sound |
| §10.1 local-index argument | central `γ`; `d_v ∤ n₁` | index of `K_i ⊗ D_v` is `d_v/gcd(d_v, e_i)`; `m_ie_i` multiple of `lcm(d_v, e_i)`; non-split `B_v` only at places split over `F⁺` | sound |
| §10.3 `ep`, `q(G)` | `n = 1`; `GU(1,1)`; Harris–Taylor | `ep(1) = 1` (full pair: `0`); `ep(1) = 2` (`K_max`: `1`); `dim = 2(n−1)+1`; `∏ binom(n, p_τ) = n` | sound |
| §11.1 | `S′ = S` | trivial; image of `𝕋^{S′}` in a finite field is a field | sound |
| §11.2(a) | hyperspecial `K_p` | `H^{j₀}(S_K)_𝔪 = H^0(K_p, H^{j₀}(𝒮_{K^p})_𝔪)` may vanish; only "some `j ≤ i`" follows | sound (see Source issues) |
| §11.4 | `κ(𝔪^∨) ≠ 𝔽_ℓ`; `m ≥ 1` | pro-`p` kernels, `ℓ ≠ p`; perfect complex with reduction in one degree is free there | sound; **R02** |
| §11.6 step 4 | minimal `b` ordinary | `d_{b′} ≥ d_b = d` and `d_{b′} ≤ d` | sound |
| §11.8(1) | `𝔪 ∌ ℓ` | excluded by the Conventions; universal coefficients + Nakayama on finite modules | sound |
| gap example | `𝒦 = ℚ(i)`, `F⁺ = ℚ(√5)` | 2 inert in `F⁺`, `ℚ_4(i)/ℚ_4` ramified, `2 ∉ Spl_{F/F⁺}` | sound |

**Sources (part 1–3).** Passages put beside the source: Definition 1.9 and 6.2.1 vs §8.7; Theorem
6.3.1(1)–(2) vs §§8.4, 8.7; Remarks 6.3.2–6.3.3 vs §8.8 and both theorem docstrings; Lemma 5.4.3 vs
§9.2; Theorem 5.5.7 and Lemma 5.5.8 vs §§9.5–9.6; Corollary 5.6.2 vs §10.3; the paragraph CS17
lines 4091–4099 vs §§10.4–10.5; [Shin-BCU] Theorem 1.1 vs §10.4; [Shin11] Lemma 7.1 vs the gap
contract; [Shin09] Definition 5.2 and Lemma 6.4 vs §§8.9, 10.2; [Shin12] (B2) vs §10.1. Longest
shared run: about eight words in the hypothesis "a direct sum of characters … not the cyclotomic
character", forced by the mathematics. No table, figure or list taken over. Arrangement: [CS17] has
72 of 86 bracketed locators. Layer 8 draws on CS17 §§1, 5.1, 5.4, 6.2, 6.3 and adds §8.9, which
[CS17] does not contain; Layer 9 covers §§5.2–5.5, Layer 10 §5.6, Layer 11 §6.3 with the Remarks of
§1. The order 9 → 10 → 11 is forced by the *Needs* lines (§10.6 needs §§9.2, 9.5; §11.6 needs
§§9.6, 10.6; §11.4 needs §§9.3, 10.3), and the split 9/10 is the Case 2/Case 1 split of the
mathematics. No one-to-one run of layers onto sections.

Source independence: 14 passages compared with 5 sources, none shared; largest share CS17, 72 of 86 locators; contents compared with CS17: independent (order of Layers 9–11 forced by the dependency lines named above).

## Not verifiable

- The truth of the three gap statements (the suppliers do not state them yet; declared contracts).
- AutomorphicSpectralTheory §§6.19–6.20 and ALS.5b.4 at the generality of the `(𝔪_G, K_∞)`
  reindexing of the Conventions for `e = 2`: the argument is the README's own; I checked it on
  `GU(1,1)` only (`ep(1) = 2` versus `1`).
- Journal pagination of [Shin09], [Shin12] and [Shin-BCU]: only the author copies are cached; the
  README cites author pages and says so.
- Ownership against the open pull requests whose files the brief does not give was checked only
  through `roadmaps grep`/`roadmaps show` at the indexed heads (2026-11-16T02:42:50Z).
- No Lean was elaborated in this pass; the signatures are those of `scratch/signatures.md`.

## Source issues

- **Misprint** in CS17 at Theorem 5.5.7 and Corollary 5.6.3, pp. 747 and 750: the source says the sets `S_i` are defined through the composite of `ι_p` with `τ`, which is not defined; it should be the composite of `ι_p⁻¹` with `τ`; affects nothing.
- **Misprint** in CS17 at Theorem 5.5.7 and the paragraph before it, pp. 746–747: the source says the vanishing class is a base change at `p`; it should be the base change outside `S`, as its proof uses; affects nothing.
- **Misprint** in CS17 at Theorem 6.3.1(1), p. 757: the source says the similitude factor at the prime `q` is the `p`-adic unit group inside the `p`-adic numbers; it should be the `q`-adic ones; affects nothing.
- **Misprint** in CS17 at Lemma 5.4.3, p. 741: the source says the reduction of `π_p` vanishes; it should be the reduction of the endoscopic representation `π^n⃗_p` of the hypothesis; affects nothing.
- **Misprint** in CS17 at §5.6, p. 749: the source says the extension from acceptable functions is Lemma 6.4 of Shin's 2011 Annals paper; it should be Lemma 6.4 of Shin's "Counting points on Igusa varieties", as cited in its Lemma 5.5.1; affects nothing.
- **Error** in CS17 at §5.1, p. 730: the source says the pair of the group and the class of `h` is a Shimura datum in the sense of its §2.1; it should exclude data definite at every place of rank at least two, where the adjoint group has compact real points; affects the proof.
- **Gap** in CS17 at the proof of Theorem 6.3.1, p. 758: the source says the least degree with nonzero localized cohomology at level `K` is also nonzero at infinite level at `p`; it should give only some degree not above it, since hyperspecial `K_p` has higher continuous cohomology; affects the proof.
- **Gap** in CS17 at the proof of Theorem 5.5.7, p. 748: the source says the Kottwitz set of a restriction-of-scalars factor equals that of `GL_n` with the single nontrivial cocharacter; it should include translation by a central power of `p` for the embeddings of signature `(n, 0)`; affects the proof.
- **Misprint** in CS17 at Remark 6.3.3, p. 758: the source says there is just one embedding with `p_τq_τ` nonzero; it should be two, conjugate to each other, exactly one of which lies in the sets `S_i`; affects nothing.
- **Gap** in CS17 at §5.6, p. 749: the source says base change for the division-algebra groups is established in Shin's appendix; it should note that the appendix treats hermitian spaces over `F` only, so the division-algebra case needs a further argument; affects a stated result.

## For the human reviewers

- none

<!-- tauceti-roadmap-review {"agent": "claude", "head": "deb125ce96885659d93a60d82092cc3eae1cf8a7", "job": "RT-IgusaVarietiesAndTorsionConcentrationPartII~1a", "model": "fable", "worker": "chris-x79"} -->
