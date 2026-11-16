<!-- from CBirkbeck, https://github.com/TauCetiProject/TauCetiRoadmapJobs/pull/13054#issuecomment-6909984080 -->
Red team round 2 pass b (claude) of 1d736a3

Verdict: needs_changes

**For the human reviewers:** this review raises 4 questions that a human decides (the scope of the roadmap, or a licence). They are in the section of that name at the end and do not change the verdict.

1. **F01** (P2) §9.7 applies the residue-field theorem without its enormous-image hypothesis

   **Location.** `packages/ModularityAndLanglandsExtensionsPartII/README.md:3557–3558`: "`P_{(p′)} = E`
   because the adjoint Bloch–Kato Selmer group of `Π′_n` vanishes (ModularityAndLanglandsExtensions §4.1;
   PotentialAutomorphyInfrastructurePartII §9.7)"; `*Needs:*` at `:3571–3573`.

   **Claim.** PotentialAutomorphyInfrastructurePartII §9.7 applies to `Π′_n`, the base change to `K` of
   `Sym^{n−1} π′`.

   **Witness.** That section (sibling line 2048) assumes "`r_{Π′,ι}(G_{K(ζ_{p^∞})})` enormous", and the
   README's own contract says the theorem "retains … enormous cyclotomic image" (README:315–317).
   Layer 9 never verifies it: "enormous" does not occur between README:3284 and :3616. Layer 12 has a
   whole target for the same step (§12.5). nt21b line 613–614 cites three results here, the third being
   the enormity example.

   **Repair.** In the proof sketch of §9.7, after the sentence quoted above, insert:

   > The enormous-image hypothesis of that section holds. `π′` is non-CM and regular algebraic, so the
   > identity component of the Zariski closure of `r′(G_F)` is not a torus (otherwise `r′` would be
   > induced or reducible) and the closure contains `SL_2` (ArithmeticGaloisRepresentations §7.6).
   > `G_{K(ζ_{p^∞})}` is normal in `G_F` with abelian quotient, so the Zariski closure of its image
   > still contains the derived group `SL_2`. `Sym^{n−1}` of `SL_2` acts absolutely irreducibly and
   > contains `Sym^{n−1} diag(a, a^{−1})`, whose eigenvalues `a^{n−1−2j}`, `0 ≤ j ≤ n − 1`, are
   > distinct when `a` is not a root of unity. After enlarging `E` so that every characteristic
   > polynomial splits, the criterion of ArithmeticGaloisRepresentations §7.10 makes
   > `Sym^{n−1} r′(G_{K(ζ_{p^∞})})` enormous.

   Append "ArithmeticGaloisRepresentations §§7.6, 7.10" to the `*Needs:*` line of §9.7 and to the
   Layer 9 `### Dependencies`. Add the Check: "For `n = 2` the witness is `diag(a, a^{−1})` with
   `a² ≠ 1`, the first Check of ArithmeticGaloisRepresentations §7.10; for a CM form the closure is the
   normaliser of a torus, `Sym²` is reducible and the hypothesis fails." Tested on the instance: `n = 3`,
   `a = 2`: eigenvalues `4, 1, 1/4`, distinct; `a = −1`: `1, 1, 1`, not regular, so a root of unity must
   be excluded.

2. **F02** (P3) the parahoric subgroups `𝔮_ṽ` and `𝔯_ṽ` are used and never defined

   **Location.** `packages/ModularityAndLanglandsExtensionsPartII/README.md:2163`, `:2196`, `:2257–2258`,
   `:2684`; and `:2167`: "`λ̃(ṽ, Θ_ṽ, n)` is the type of `GL_n(𝒪)` inflated from the Deligne–Lusztig
   cuspidal of `GL_{n_1}(k(ṽ))`".

   **Claim.** The level `U_v = ι_ṽ^{−1}𝔮_ṽ` and the conditions "restricted to `𝔯_ṽ`" are defined.

   **Witness.** Neither symbol has a definition anywhere in the README (five occurrences, listed
   above). A representation of the Levi quotient `GL_{n_1} × GL_{n_2}` inflates to the parahoric, not to
   `GL_n(𝒪)`: nt21 lines 875–880 (§1.17, p. 19).

   **Repair.** Replace the sentence at README:2167–2169 ("Here `λ̃(ṽ, Θ_ṽ, n)` is … on the complement.")
   by:

   > Here `𝔮_ṽ ⊂ GL_n(𝒪_{F_ṽ})` is the parahoric subgroup of block type `(n_1, n_2)`, the preimage of
   > the standard parabolic `P_{(n_1,n_2)}(k(ṽ))` under reduction, with `n_1 = 2` on `T_2` and
   > `n_1 = n − 2` on `T_3`; `λ̃(ṽ, Θ_ṽ, n)` is the representation of `𝔮_ṽ` inflated from
   > `λ̃(ṽ, Θ_ṽ) ⊗ (ω(ṽ) ∘ det)` on its Levi quotient `GL_{n_1}(k(ṽ)) × GL_{n_2}(k(ṽ))`; and
   > `𝔯_ṽ ⊂ 𝔮_ṽ` is the parahoric subgroup of block type `(n_1, 1, …, 1)` (nt21 §1.17, p. 19).

   Add the Check to §5.1: "For `n = 3`, `n_1 = 2`: `[GL_3(𝒪) : 𝔮_ṽ] = q² + q + 1`, the number of points
   of `ℙ²(k(ṽ))`, so `𝔮_ṽ ≠ GL_3(𝒪)`; for `n_1 = n`, `𝔮_ṽ = 𝔯_ṽ = GL_n(𝒪)`."

3. **F03** (P3) the consumer named for §4.9 states the classification itself at its head

   **Location.** `packages/ModularityAndLanglandsExtensionsPartII/README.md:5420–5422`:
   "SmoothRepresentationsOfLocalGroupsPartII consumes §4.9 for its Kazhdan–Lusztig parameters and
   classification"; and `:104–105`: "later roadmaps consume §4.9 instead of stating the classification
   again".

   **Claim.** §4.9 has one owner and the later roadmap cites it.

   **Witness.** At its open head SmoothRepresentationsOfLocalGroupsPartII states the classification as
   its own target (its README lines 1558–1563, "7.4 The Kazhdan–Lusztig classification of
   Iwahori-spherical representations") and names this roadmap nowhere (0 occurrences of
   `ModularityAndLanglands`).

   **Repair.** This roadmap is earlier in the merge order (line 284 against 294), so it stays the
   owner; the citation has to be added in the other roadmap, which this package cannot do. Here,
   replace the bullet at README:5420–5422 by:

   > - Later roadmaps that need the Kazhdan–Lusztig classification of Iwahori-spherical representations
   >   of split adjoint groups (Aubert involution, spherical complementary series) take it from §4.9.

   and at README:104–105 replace "and later roadmaps consume §4.9 instead of stating the classification
   again" by "and it is the owner of that statement". The duplicate statement is listed for the human
   reviewers below.

4. **F04** (P3) `wes04` and `ct15` are cited without a locator

   **Location.** `packages/ModularityAndLanglandsExtensionsPartII/README.md:399` (the contract of
   gap:unobstructed-auxiliary-prime): "for all but finitely many `p` (Weston, wes04)"; `:287–288`,
   `:2417`, `:3142`: "Clozel–Thorne II Proposition 3.10", "Clozel–Thorne II Lemma 4.3".

   **Claim.** Every cited result has an exact locator into a recorded source.

   **Witness.** `wes04` has no theorem or page anywhere in the README. The source step is nt21 line
   4534, which names two propositions of Weston. `ct15` occurs only in the reference list
   (README:5448); the three citations of its results carry no key and no page.

   **Repair.** In the contract at README:399 and in the same `needs` string of `design/plan.json`,
   replace "(Weston, wes04)" by "(Weston, wes04 Proposition 3.2 with Remark 3.3 for non-special
   components and Proposition 5.3 for special ones)". At README:287, :2417 and :3142 write "ct15
   Proposition 3.10" and "ct15 Lemma 4.3" with the page of the authors' manuscript recorded in
   `sources.toml`.

5. **F05** (P3) Layers 0 and 1 and the scope paragraph still describe layers by source sections

   **Location.** `packages/ModularityAndLanglandsExtensionsPartII/README.md:577–578`: "This layer
   supplies the rigid-analytic carriers of Newton–Thorne I §2 (nt21 §§2.1, 2.11.1, pp. 24, 30–31)";
   `:769–770`: "This layer proves nt21 Theorems 2.24 and 2.27, Lemma 2.29 and Corollary 2.28";
   `:116–118`: "which is exactly the logical structure of Newton–Thorne I §8 and Newton–Thorne II §3".

   **Claim.** After the round-1 repair no layer is introduced as a source's section.

   **Witness.** The repair of 1a/F04 reworded Layers 4–13 only (its report: "the introductions of Layers
   4–13 no longer open with a source section"); the three passages above were left.

   **Repair.** README:577–581, replace the first sentence by: "This layer supplies the rigid-analytic
   carriers of the continuation argument: an analytic continuation lemma … at absolutely irreducible
   points." (the locators stay at §§0.1–0.4, where they already are). README:769–770, replace the last
   sentence by: "This layer proves continuation of symmetric power functoriality along components in
   the non-critical and the ordinary case, the passage of non-criticality to symmetric powers, and
   their combination (§§1.1–1.4)." README:116–118, replace the last sentence by: "The theorems of
   Layers 8 and 10 are stated relative to a level-one seed, because their proofs use one automorphic
   level-one form as input and nothing else from Layer 7."

6. **F06** (P3) two quoted supplier titles are shortened

   **Location.** `packages/ModularityAndLanglandsExtensionsPartII/README.md:4000–4001` and `:4191–4192`:
   Layer 5 ("Finiteness of ordinary polarized deformation rings"; "Ordinary automorphy lifting"; …).

   **Claim.** README:265–266: "the titles are those of the supplier's sections".

   **Witness.** PotentialAutomorphyInfrastructurePartII at its head, lines 1265 and 1293: "5.5 Ordinary
   automorphy lifting with relaxed-adequate image", "5.7 Finiteness of ordinary polarized deformation
   rings with relaxed-adequate image".

   **Repair.** Write the two titles in full at README:4000–4001 and :4191–4192, and in §11.2 add after
   "ordinary automorphy lifting after soluble base change (Layer 5)": "whose image hypothesis holds
   because `r̄_{π,ι}(G_F)` contains a conjugate of `SL_2(𝔽_{p^a})` with `a > a₀(p)` (§11.1(4))".

7. **F07** (P3) a Check of §6.2 is instantiated outside the hypotheses it cites

   **Location.** `packages/ModularityAndLanglandsExtensionsPartII/README.md:2619–2623`: "as for the
   unipotent ring (nt21 §6, p. 79) … For `n = 3`, `p = 5`, `q_v = 11` and residual Frobenius `1`".

   **Claim.** The instance lies in the nt21 setting to which the sentence refers.

   **Witness.** README:2575 and :2680: in nt21 §6, `p > 2n`, so `n = 3` needs `p ≥ 7`; `p = 5` is not
   allowed. (The same numbers in the Check of §6.3 are in the ct17 setting, `l > 3`, `l ∤ n_1n_2n = 6`,
   and are fine.)

   **Repair.** In the Check at README:2621–2623 replace "`p = 5`, `q_v = 11`" by "`p = 7`, `q_v = 29`"
   and "ratios `1 ≠ 11`" by "ratios `1 ≠ 29`", and drop "as in the Check of §6.3". Tested:
   `29 = 4·7 + 1 ≡ 1` modulo `7`, `7 > 6`, and the unramified lift with Frobenius `1` has eigenvalue
   ratios `1`, none equal to `29`.

Round 2. Read in full: `packages/ModularityAndLanglandsExtensionsPartII/README.md` (5477 lines, 110
numbered targets in Layers 0–14) and `packages/ModularityAndLanglandsExtensionsPartII/Suggested.lean`
(127 lines: 2 definitions, 1 proved `example`, 2 theorems). One P2 and six P3 findings, numbered
S01–S07. No P1. No Lean was run (the brief allows none); the Lean statements were compared with
`scratch/signatures.md`.

## Round 1 findings at this head

| Id | Status | Witness at 1d736a3 |
|---|---|---|
| 1a/F01 (P1) §4.9 unowned K-theory | repaired | README:1878–1882: "…the irreducibility of tempered standard modules are supplied by SpringerResolutionAndCharacteristicCycles (gap:steinberg-equivariant-k-theory)". Slug in `design/plan.json`. Pins: `TauCeti/Algebra/Lie/Sl2/JacobsonMorozov.lean` lines 87, 199. NilpotentOrbits N2 item 1 on main. |
| 1a/F02 (P2) vague gap | repaired | README:4129–4131: "Finiteness is PotentialAutomorphyInfrastructurePartII §8.16 as stated, applied twice … Its added hypothesis … holds." The slug is gone from README and `plan.json` (15 slugs each). |
| 1a/F03 (P2) missing lifting theorem | repaired | README:4159–4161: "The auxiliary-place lifting theorem (gap:auxiliary-place-reducible-lifting, with `Π_2` as input) makes this point `r_{Π′_2,ι}`". Matches th24 line 1965 (Theorem 7.5). |
| 1a/F04 (P2) arrangement | partly repaired | Introductions of Layers 4–13 reworded; merges declined with reasons, which I checked and accept (see `Source independence`). Residue in Layers 0–1 and the scope paragraph: S05. |
| 1a/F05 (P3) ordinarity | repaired | README:5169: "in which `p` splits completely"; README:5175–5179 uses §R07.5.11 over `ℚ_p` (sibling heading at its line 8093) and PotentialAutomorphyInfrastructurePartII §0.5 (its line 435). |
| 1b/F01 (P1) §10.10 misapplied | repaired | README:4813–4816: "ModularityAndLanglandsExtensions §2.25 gives a lift of `r̄_{σ,ι_t}|_{G_E}` … connecting, above `t`, to `r_{σ,ι_t}` itself". §2.25 exists (its line 1227). |
| 1b/F02 (P1) §2.4 misapplied | repaired | README:4144–4148: "(1) Run the Khare–Wintenberger argument of §11.2 over `F_2`, prescribing in addition the unramified Steinberg component at `v_2`". §2.4 left the Layer 11 Dependencies. |
| 1b/F03 (P2) half-plane | repaired | README:5285–5287 cites AL.2.4.1, AL.3.6.1, AL.3.3.8. AL.3.6.1 (its line 1746) states the Cauchy–Schwarz step to the standard Euler product for `n ≥ 2`. |
| 1b/F04 (P2) compound gap | repaired | README:399 and :401 carry two gaps; both `needs` equal `plan.json` (script check, 15 of 15 equal). |
| 1b/F05 (P3) unconsumed items | repaired | The six items are absent from README:428–431, 491–500, 376–381, 362–372; §2.15 is named at README:2336–2337. |

New errors introduced by the repairs: none found. Checked on the repaired passages: the weight-zero
argument for adapted `φ` (README:1887–1893: `Ad(d)h_1 − h_1 = Σ(χ(d) − 1)h_χ`, each summand in the
`D`-stable space, so `h_χ` lies in it for `χ ≠ 1`); `p ∤ n` for both uses of the lifting gap
(`n = 2r`, `1 < r < p`, `p ≥ 5`; `n = p + r`, `0 < r < p`); `t ≥ 2(d + 1) = 6` for §2.16 in §13.3.

## Verified sound

Counts: 4 declarations and 1 `example` read; 110 targets read; 39 source locators opened in the
cached texts this round (nt21 19, nt21b 5, nt26 7, th24 5, bk05 1, wes04 2), all on the stated
pages; about 120 numerical Checks recomputed; about 245 cross-roadmap section headings resolved at the
suppliers' heads or on main (all found, including the §8.17 alias, which is a table row at
PotentialAutomorphyInfrastructurePartII line 106); 11 Mathlib and 8 Tau Ceti declarations opened at
the pins.

**Dependency check** (command of the brief): `depcheck: 249 roadmaps, 2402 edges, 0 problem(s)`. No
UPWARD, CYCLE or `moved:` line. No never-cite roadmap is named.

**Gaps.** 15 slugs in the README, the same 15 in `design/plan.json`, each `needs` equal to its
contract sentence, every supplier named. None raised.

**Policy.** `git diff --stat origin/main...HEAD` touches only the package folder. No pull-request
number or process word in README or docstrings; no `lemma`, `set_option`, `#eval`, `True`
placeholder or sorry'd data; one `import Mathlib` and one existing Tau Ceti module
(`TauCeti/NumberTheory/ModularForms/Newforms/Satake.lean`). The `module` / `public import` form is
that of 61 roadmaps on main.

**Suggested.lean, signature against README.**

| Declaration | Context | README | Values checked | Result |
|---|---|---|---|---|
| `symPowerEulerFactor` | no variables; `ℕ → ℂ → ℂ → ℂ → ℂ` | §14.4 | `n = 0`: `1 − x`; `n = 1`: `(1 − βx)(1 − αx)`; `ℕ`-subtraction `n − j` safe for `j ≤ n` | agrees |
| `example` (symmetry) | proved | §14.4 API | reindex `j ↦ n − j` | kept: tests the definition, one in the file |
| `HasQuadraticSelfTwist` | `{N} [NeZero N] {k : ℤ}` explicit | §14.5 | `M = 0`: excluded by `0 < M`; `M = 1, 2`: only trivial character; `χ_{−4}`, level 32: holds; `Δ`: `252·(−1) ≠ 252` | agrees |
| `symPowerEulerProduct_levelOne_entire` | `Newform 1 k`, `1 ≤ n` | §14.4 | `n = 0` gives `ζ(s)`, excluded; `Δ`, `n = 2`: bound `Re s > 12`; nebentypus trivial for `N = 1` | agrees, true |
| `symPowerEulerProduct_entire_of_not_hasQuadraticSelfTwist` | `[NeZero N]`, `2 ≤ k`, `1 ≤ n`, primes `p ∤ N` | §14.5 | CM level 32, `n = 4`: factor `ζ(s − 2)(1 − 2^{2−s})`, pole at `3 = 4·1/2 + 1`; weight one icosahedral: pole at `1`; both excluded | agrees, true |

Neither theorem follows from the other or from a pinned lemma in one step (level one from the
general statement needs the absence of self-twists and of small weights). The headline theorems not
stated are named in the module docstring with the missing carrier; none is statable at the pins.

**Adversarial pass (values computed).**

| Statement | Instances | Values | Result |
|---|---|---|---|
| §0.2 character space | `p = 3` | `Hom(ℤ_3^× × ℤ̂, C_5)`: 5; `Hom(ℤ_3^× × ℤ_3, C_5)`: 1; pro-3 rank 2 | ok |
| §0.4 | `n = 2`, `ℚ_p` | `1 + 0 + 4 = 5` | ok |
| §1.3 derivative matrix | `I = {0, 2}` | `[[1,1],[0,2]]`, det 2 | ok |
| §2.1 slopes, weights | `Δ`, `p = 2`, `3` | `{3, 8}`, `{2, 9}`, sums 11; `v(ζ − 1) ≤ 1 < v(q)` | ok |
| §2.1 `τ² = 1` | ramified `χ_{0,1}` | composite twist `χ_{0,1}^{−1}` on units | ok |
| §2.2 Chevalley | `⟨2⟩ ⊃ ⟨4⟩`, mod 3 | `2^a ≡ (−1)^a` | ok |
| §2.5 `Sym^6` criterion | `S_4`, `A_5`, binary icosahedral | max irreducible degrees 3, 5 (6 for `2I`, odd powers only); `dim Sym^6 = 7` | ok |
| §3.2 | `k = 3, 4, 6`, `m = 0`; `k = 2`, `m = 1` | `v_2(w) = 2, 3, 4, 1` | ok |
| §3.4 | mod 5, mod 7 | orders of `2`: 4 and 3; `X² − X + 3 = (X − 2)(X − 4)` in `𝔽_5` | ok |
| §3.7 | `i = 1` | `m_π = 2`, `k′ = 9`, twin on `X_3`, slope 6 | ok |
| §4.3 signs | `n = 1, 2, 3` | `χ(z/z^c)` trivial on `F^×`; `St_2(χ) ⊞ 1`: `(−1)(−1) = +1` | ok |
| §4.4 degrees | `q = 3` | `6`, `32`, `−1 + 6 + 27 = 32` | ok |
| §4.8 parameters | ramified `U_{2k+1}` | Coxeter diagram of `C̃_k`, all `q_s = q`; `ζ ↦ −1`, `[B : I] = 2` | ok |
| §4.9(d) | `PGL_2`, `s = diag(i, −i)` | `−s` conjugate to `s`; pullback `1 + 1` | ok |
| §4.10 | `n = 7, 9, 11` | `8 = 1 + 7`; `14 = 1 + 11 + 2`; `22 = 1 + 16 + 5`; `[K : B] = 58240` | ok |
| §4.12 | `m = 3, 5` | shuffle sums `2·3` and `2·6 = 11 − 1 + 2` | ok |
| §5.6 | `l = 5`: `(3,…,−3) − ρ` | `(1,1,1,0,−1,−1,−1)` | ok |
| §5.10 | localisations at `q ≡ −1` | `dim Y(χ̄) = 1 + 2 = 3` (`n = 7` and `n = 9`), `Z(χ̄) = 0`; `2(a + b) ≤ a + 3b ⇔ a ≤ b` | ok |
| §6.9 | `q = 2`, `p = 5`; `k = 𝔽_7` | `4`, then `3·2 = 1`; ratios `3, 5 ∉ {2, 4}` | ok |
| §7.1 | `a_2`, `a_5` | `(1 + i)⁴ = −4`; `−14` | ok |
| §7.2 | `n = 3` | `288`, `577` prime; `ε^{3(n−1) − 4(n−1)} = ε^{1−n}` | ok |
| §7.4 defect | nt21 lines 4222, 4253, 4290 | `ρ_2^c ≅ ρ_2^∨ ε^{1−n} δ_{K/ℚ}`, `δ ≠ 1` on `G_{F_0}` | README's claim confirmed |
| §9.3 | `n = 2, 3, 4` | exponents `(1, −1)`, `(1, 0, −1)`; cube root fails `n = 4` | ok |
| §9.5 | dimensions | `1 + q + 4\|S ∪ S_∞\| − 1`, as nt21b lines 574–604 | ok |
| §10.3 | `n = 3` | `t = 53`, `q = 211` | ok |
| §11.3 | polarisation | `ε^{1−2r} ω_p^{r−1}(y y^c)^{1−r} = ε^{1−2r}` | ok |
| §11.6 | `𝔽_7`, `q = 3`, `Φ = diag(1, 2)` | `3, 3, 6, 5`; abelianisation order divides `(\|k\| − 1)²` | ok |
| §12.4 | `r = 1` | `η = (10, 15)`, `U^{(2)} − q^{−1}·150`; quotient `C_2 × C_2` | ok |
| §13.1 | char 2, `M = 6` | `q ± 1 ∈ {1, 3, 5}` | ok |
| §13.4 | `r = 4`, `q = 17`; `q = 43` | forbidden set of 8; eigenvalues `7, 6, 10, 11, 14, 12, 3, 5`; `y³ = y^{−3}` | ok |
| §13.8 | `p = 7`, `a` odd | `7^a ≡ 3 (4)`, scalars `±1`; `n = 11` forces `p = 7` | ok |
| §13.9 | th24 line 1869–1876 | `11 = 7 + 4` needs `TP_4` | ok |
| §14.4 | `Δ`, `n = 2` | `576 − 2048 = −1472` | ok |

**Ownership.** Checked with `roadmaps grep` at the open heads and on main: the twin involution,
seasoned representations, `symPowerEulerFactor` and `HasQuadraticSelfTwist` have no second owner.
The Kazhdan–Lusztig classification has one (S03). No fully qualified name of `Suggested.lean` is
declared by another roadmap.

**1a/F04, not re-raised.** The order 9 < 10 and 11, 12 < 13 is forced by §10.6 → §9.8,
§13.3 → §11.10 and §13.4 → §12.7. The scope of each of Layers 9–13 is one statement of the parent
roadmap (its §§4.11, 4.29, 4.23, 4.30) with its proof; Layer 13 joins two sections of nt26 with th24
§7. The repair's reasons hold.

## Not verifiable

- kl87, bbm82, kw09: uncertified; their locators were not opened.
- ct17, at20, con99, chen14, moe07, kv12, dm18, ls20: locators not reopened this round; round 1
  pass a reports them checked.
- The corrections the README makes to printed statements that I did not recompute: ct17 Proposition
  2.6(2) (the `(10, 10)` entry), ct17 Theorem 3.3 (exponent of `X` for `m = 3`), ct17 after (3.9)
  (unique submodule), nt26 Lemma 3.4 and the generator of `𝔪_{G,Q}` (nt26 pp. 31–32).
- Truth of the two Lean theorems rests on the roadmap's own endpoints (§§14.2, 14.3); it was checked
  on instances and against the sources, not by elaboration.

## Source issues

- **Error** in nt21 at proof of Proposition 7.4, pp. 86–88: the rank-two block is taken to be a twist of the base change of a non-CM form by a character built from one with conjugate norm `ε³δ_{K/ℚ}`; it should be conjugate self-dual, but it differs from its polarized dual by the non-trivial character `δ_{K/ℚ}` on `G_{F_0}`; affects the proof.
- **Misprint** in nt21 at Lemma 3.3, p. 54: the source says the original point lies on the second annulus component; it should be its twin, as the proof says; affects nothing.
- **Misprint** in th24 at proof of Corollary 7.2, p. 42: the source says Bertrand's postulate gives a prime between `n` and `2n` and then writes `n` as that prime plus `r`; it should be a prime between `n/2` and `n`; affects nothing.
- **Error** in th24 at proof of Lemma 7.3, pp. 42–43: the source says a group with projective image `PSL_2` or `PGL_2` of `𝔽_{p^b}` lies in scalars times `SL_2(𝔽_{p^b})`; it should be scalars times `GL_2(𝔽_{p^b})` in the `PGL_2` case; affects nothing.
- **Misprint** in nt26 at Corollary 6.2(2), p. 49: the source says the Steinberg condition holds at the `p`-adic places of the base field; it should be at the `p`-adic places of the extension `E` over which the form lives; affects nothing.
- **Misprint** in nt26 at Theorem 5.5, p. 40, and Corollary 6.2, p. 49: the source says the hypotheses include `SP_{r−1}` for every `0 < r < p`; it should be only for `r > 1`, since `SP_0` is not a statement; affects nothing.

Source independence: 12 passages compared with 5 sources (nt21 Lemmas 2.2, 3.3, 3.4, Theorems 2.33, 6.1, 7.1, Proposition 8.3; nt21b Propositions 2.6, 2.8; nt26 Corollary 6.2; th24 Theorems 7.5, 7.6; bk05 Corollary of Theorem B), none shared beyond hypothesis lists that the mathematics forces (longest run about 8 words, nt21 line 2453); largest share nt21, about 67 of 205 locators; contents compared with nt21 (§§1–8): independent (its §1 is Layer 4, its §2 is Layers 0–2, its §5 is a supplier, Layers 4–7 join it with ct17 and th24); Layers 9–13 against nt21b §§2–3 and nt26 §§3–6: order forced by the dependency lines named above, settled in round 1.

## For the human reviewers

- **Two owners.** The Kazhdan–Lusztig classification is stated twice: `packages/ModularityAndLanglandsExtensionsPartII/README.md:1835` (§4.9) and SmoothRepresentationsOfLocalGroupsPartII at its open head, README lines 1558–1563, which does not cite this roadmap.
- **Scope.** §7.4 states the odd step of nt21 Proposition 7.4 with an added hypothesis because the printed rank-two block is not conjugate self-dual (README:110–118); recomputed here, same result; no published correction found.
- **Licence.** kl87, bbm82 and kw09 are cited by locator only (`sources.toml`, status `uncertified`); gap:steinberg-equivariant-k-theory, gap:artinian-crystalline-quotients and gap:formal-torus-patching rest on them.
- **Not tested.** ct17 (about 42 locators, authors' manuscript pagination) was not reopened this round; wording and arrangement were compared with nt21, nt21b, nt26, th24 and bk05 only.

<!-- tauceti-roadmap-review {"agent": "claude", "head": "1d736a375bece161cdf45464235952336d5f5a77", "job": "RT-ModularityAndLanglandsExtensionsPartII~2b", "model": "fable", "worker": "chris-x89"} -->
