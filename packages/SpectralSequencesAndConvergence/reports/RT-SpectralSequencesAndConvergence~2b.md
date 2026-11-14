<!-- from CBirkbeck, https://github.com/TauCetiProject/TauCetiRoadmapJobs/pull/14997#issuecomment-6872303984 -->
Red team round 2 pass b (claude) of 4a46526

Verdict: needs_changes

**For the human reviewers:** this review raises 3 questions that a human decides (the scope of the roadmap, or a licence). They are in the section of that name at the end and do not change the verdict.

1. **F01** (P3) AlgebraicTopology is cited as owner of the module tower algebra, which its README assigns to Tau Ceti

   **Location.** `packages/SpectralSequencesAndConvergence/README.md:77–79` ("**AlgebraicTopology, Stage
   6, item 0**: countable towers of modules, lim, lim¹, the six-term sequence, Mittag–Leffler vanishing
   and the Milnor sequences.") and `README.md:360–363` (supplier contract, same list).

   **Claim.** AlgebraicTopology Stage 6 item 0 owns module towers with lim, lim¹, the six-term
   sequence, Mittag–Leffler vanishing and the Milnor sequences.

   **Witness.** `TauCetiRoadmap/AlgebraicTopology/README.md:879–880` on main: Stage 6 item 0 is §6.0,
   and "of item 0, the generic tower algebra other than the homotopy-square maps is Tau Ceti's
   `TauCeti.ModuleTower`". §6.0 (`:2145`) is "Restriction towers and homotopy-square maps".

   **Repair.** Replace `README.md:77–79` by:

   > - **AlgebraicTopology, §6.0** (Stage 6 item 0 in its former numbering): restriction towers and
   >   homotopy-square maps of towers of module complexes. The module tower algebra it consumes (lim,
   >   lim¹, the six-term sequence, Mittag–Leffler vanishing, the Milnor sequences) is Tau Ceti's
   >   `TauCeti.ModuleTower` and `TauCeti.ComplexTower`, listed above. Layer 7 here owns lim and lim¹
   >   only in an abelian category, and identifies them with Tau Ceti's on modules as a Check.

   and `README.md:362–363` by:

   > - §6.0 (Stage 6 item 0 in its former numbering): restriction towers and homotopy-square maps over
   >   Tau Ceti's `TauCeti.ModuleTower`. Compared with Layer 7 on `ModuleCat R` in Checks, not consumed
   >   by any proof.

   In `README.md:1597` write "which AlgebraicTopology §6.0 uses". Tested against the witness: the
   repaired text attributes the tower algebra to Tau Ceti (pin:
   `TauCeti/Algebra/Category/ModuleCat/Tower/Basic.lean:170, 174`, `Exact.lean`, `MittagLeffler.lean:191`,
   `Milnor/Basic.lean:106`) and to AlgebraicTopology only what its §6.0 heading states.

2. **F02** (P3) the "iff" of 7.2 is cited to a proposition that proves one direction

   **Location.** `README.md:1619–1623` ("`C` is replete if and only if it satisfies `CountableAB4Star`
   and every tower with epimorphic transitions has `lim¹ = 0` … (bhatt-scholze2015 line 755–770,
   Proposition 3.1.10, for abelian sheaves on a replete topos)") and `Suggested.lean:299–303`.

   **Claim.** Proposition 3.1.10 is the source of the equivalence.

   **Witness.** bhatt-scholze2015 line 755–756: Proposition 3.1.10 assumes a replete topos and
   concludes `lim ≃ R lim` for epimorphic towers. Exactness of countable products is Proposition 3.1.9
   (line 750). Neither states a converse.

   **Repair.** In `README.md:1622–1623` replace the parenthesis by: "(the implication from repleteness:
   bhatt-scholze2015 line 750–753, Proposition 3.1.9, for the exactness of countable products, and line
   755–770, Proposition 3.1.10, for `lim¹ = 0`, both for a replete topos; the converse is proved here,
   by the route below)". In `Suggested.lean:299–300` replace "(README 7.2; Bhatt–Scholze, Proposition
   3.1.10, for abelian sheaves on a replete topos)" by "(README 7.2; the forward implication is
   Bhatt–Scholze, Propositions 3.1.9 and 3.1.10, for abelian sheaves on a replete topos; the converse
   is README 7.2's)". Tested: the converse route (`K_n = ker(F_n → F_0)`, six-term sequence) was
   recomputed and holds; it uses `CountableAB4Star`, which the source does not derive from `lim¹ = 0`.

3. **F03** (P3) `Suggested.lean` imports a Tau Ceti module from which it uses nothing

   **Location.** `Suggested.lean:6`: `import TauCeti.Algebra.Homology.SpectralSequence.Filtered.Naturality`.

   **Claim.** The imports are the individual Tau Ceti modules actually used.

   **Witness.** `Filtered/Naturality.lean` declares `filtrationFunctorMap` and its lemmas and
   `spectralObjectMap_hom_app_spectralObjectHIsoCokernel_hom`; none occurs in `Suggested.lean`. The four
   names used (`CochainComplex.spectralObject`, `spectralObjectMap`, `filtrationFunctor`,
   `spectralSequence`) are at `Filtered/SpectralObject.lean:147, 191, 304, 409`.

   **Repair.** Replace line 6 by
   `import TauCeti.Algebra.Homology.SpectralSequence.Filtered.SpectralObject` (the module that
   `Naturality.lean:8` re-exports) and elaborate the file once; this pass ran no Lean.

4. **F04** (P3) Neeman's example is located at a tag that does not contain it

   **Location.** `Suggested.lean:322–323`: "this can fail (Neeman's example, recorded at Stacks, Tag
   02N0)".

   **Witness.** stacks-012K line 3715–3719 is Definition 31.2 (tag 02N0) and ends at "for all `k ≥ c`";
   the remark on Neeman is the paragraph after it, line 3720–3724, outside the tagged definition. The
   README (`:1661`) locates it correctly by line.

   **Repair.** Write "(Neeman's example, recorded in the Stacks project, Homological Algebra, Section
   31, in the paragraph after Definition 31.2)".

Round 2. All nine round-1 findings are repaired at this head and no repair introduced an error.
The full pass was run again: no false statement, no missing hypothesis and no unowned prerequisite
was found (no P1, no P2). Four new P3 findings (S01–S04) follow: one stale ownership citation, one
citation that supports half of an "iff", one import of an unused module, one tag locator.

## Round-1 findings at this head

| Id | Status | Repaired passage (witness) |
| --- | --- | --- |
| 1a/F01 (P3) | repaired | `packages/SpectralSequencesAndConvergence/README.md:1274–1278`: "the family `t ↦ F^t` without negation is not monotone: `0 ≤ 1`, but `F^0 = K` is not contained in `F^1 = K^1` … A family that is both monotone and antitone in `t ∈ ℤ` is constant". `README.md:1033–1037`: "`abutmentFiltration p 1` is `0` at `p = −2` and `ℤ/2` at `p = −1` … For the zero spectral object both families are constantly `0`". Recomputed: `G_{−2} = 0`, `G_{−1} = K^1`, `H^1(G_{−1}) = ℤ → H^1(K) = ℤ/2` onto, image `ℤ/2`. |
| 1a/F02 (P2) | repaired | `Suggested.lean:139–153` states `sum_negOnePow_page_eq_sum_negOnePow_page_add_one`; `README.md:635–640` names it and sums over `s`; module docstring lines 23–25. Recomputed on `ℤ/4 ↠ ℤ/2`, degrees `1, 2`, length: `−2 + 1 = −1 = −1 + 0`. Truth re-derived for an arbitrary shape family (table below). |
| 1a/F03 (P3) | repaired | `Suggested.lean:71–77`: "Boardman's double-tower short exact sequence … (README 7.3): it needs the image system `Im^r A^s` … neither library has these in an abelian category". Pin check: the only cofinality file is `TauCeti/Algebra/Category/ModuleCat/Tower/Subsequence/LimOne.lean` (modules). |
| 1a/F04 (P3) | repaired | `README.md:482–487` (1.3: `ℤ/2` at `(0,1)`, `(2,0)`, `d_1 = 0`, `d_2 = id`: `(0,1) → (0+2, 1+1−2) = (2,0)`, `E_3 = 0`); `README.md:1150–1155` (4.4: `ℤ[0]`, `G ≡ 0`: bounds `0, 0` in degree `1`, none in degree `0`); `README.md:854–860` (3.5: `2h(1) = 0`, `gr^1(h) = 0`). |
| 1b/F01 (P2) | repaired | `Suggested.lean:230–237` states `hasConvergenceBounds_spectralObject_filtrationFunctor`; `README.md:1325–1336`; docstring lines 33–36. Dictionary `a = −p₀`, `b = −p₁` recomputed: `H^m(F^s K) = 0` for `s ≥ p₀` is `H^m(G_i) = 0` for `i = −s ≤ −p₀`. |
| 1b/F02 (P3) | repaired | `README.md:273–276`: "`EInftyIsoCokernel`, … (`SpectralObject/Abutment.lean`), and `EInfty`, `spectralSequencePageXIsoEInfty` and `coe_le_coe_add_one` (`SpectralObject/Stabilization.lean`)". Pin: `Stabilization.lean:45`, `Abutment.lean:92`. |
| 1b/F03 (P3) | repaired | `README.md:291–295` lists `CochainComplex.spectralObjectHIsoCokernel` and `CochainComplex.spectralObject_H_map_comp_spectralObjectHIsoCokernel_hom`. Pin: `Filtered/SpectralObject.lean:224, 241`. |
| 1b/F04 (P3) | repaired | `README.md:765–778`: `(f, 2)`, `(f, 2 + ℓ)` morphisms, `(f, 3)` not; zero sequence with constant filtration admits every `(0, u)`. Recomputed `ℓ = 2`: `gr(2) = 0 = gr(4)`, `gr(3) = 1`, `E_∞(f) = 0`. |
| 1b/F05 (P3) | repaired | `README.md:717–718` cites cartan-eilenberg1956 Ch. XV §2 as the attribution of helle-rognes2024 Definition 2.7 (helle-rognes2024 line 94); `README.md:1922–1925`; `sources.toml` has `locator = "Ch. XV §2"`, `cited_for = ["3.2"]` and mccleary2001 `locator = "Ch. 2"`, `cited_for = ["3.6"]`. |

No finding of the repair report was marked `not actionable in this package`; nothing is re-raised.

## Adversarial pass: record

Lean declarations (13: 1 structure, 2 definitions, 10 theorems; no `variable` block, every binder
explicit; `scratch/signatures.md` lists a 14th entry `that`, an artefact of the word "theorem that"
at docstring line 66, not a declaration).

| Statement | Instances tried | Values computed | Result | Change |
| --- | --- | --- | --- | --- |
| `BidegreeAssignment` (2.1) | cohomological `(p, p+q)`, `e = 0`; classical `(−q−1, p+q)`, `e = 1`; homological `(−p, −p−q)` on `(p,q) → (p−r, q+r−1)`; wrong `(q, p+q)`; `(p, p)` | fil rises `r`; `−(q+1−r)−1 = fil + r − 1`; deg `−p−q+1`, fil `−p+r`; fil changes `1 − r` (no fixed `e`); not injective | defining laws exclude both wrong models | none |
| `dFrom_eq_zero_of_boundedBelow` | target of `d_r` from `pq`: fil `f + r − e`, deg `n + 1`; first quadrant `(1,0)`, `r = 2`; no relation at `pq` | zero when `β(n+1) ≤ f + r − e`; lands at `q = −1`; `dFrom = 0` by definition | holds | none |
| `dTo_eq_zero_of_boundedAbove` | source fil `f − r + e`, deg `n − 1`; `(1,0)`, `r = 2` | zero when `f − r + e ≤ α(n−1)`; starts at `p = −1` | holds | none |
| `sum_negOnePow_page_eq_sum_negOnePow_page_add_one` | `s = ∅`; `ℤ/4 ↠ ℤ/2`; sign `(−1)^{fil}`; a nonzero `d : pq → pq′` | `0 = 0`; `−1 = −1`; `3 ≠ 1`; both ends nonzero hence in `s`, `deg pq′ = deg pq + 1`, so `v(im d)` cancels in pairs; `v(0) = 0` and iso-invariance from `hv` | holds; injectivity of `(fil, deg)` unused (note) | none |
| `HasConvergenceBounds` (4.4) | `ℤ →(×2) ℤ`, `n = 1`: `(−2, 0)`, `(−1, 0)`, `(−2, −1)`; `ℤ[0]`, `G ≡ 0`; zero object `(5, 0)` | holds; `H^1(G_{−1}) = ℤ ≠ 0`; `ℤ → ℤ/2` not iso; degree `0` fails, degree `1` holds; holds, forces `H^n = 0` | determines the intended object; monomorphism model rejected by `ℤ[0]` | none |
| `convergence_of_hasConvergenceBounds` | general: `x` with `δx = 0` in `H^{n+1}(q−r+2 ≤ q)`; kernel of `H^n(q ≤ j) → H^n(q ≤ ⊤)`; `ℤ →(×2) ℤ` at `(3, −2)` and `q = 0` | `δ_⊥ x` comes from `H^{n+1}(⊥ ≤ q−r+2) = 0`, so `Z_r = Zᵗ`; kernel is `δ(H^{n−1}(j ≤ ⊤))`, factoring through `ker(H^n(⊥≤j) → H^n(⊥≤⊤)) = 0`, so `B_r = Bᵗ` for `q + r − 1 ≥ b`; pages `max(2, 2, 3) = 3` and `max(2, 4, 1) = 4`, `EInfty 0 1 = 0` | holds; index order `(⊥, q−r+2, q, q+1, q+r−1)` and `(⊥, q, q+1, q+r−1, ⊤)` matches `EpiMono.lean:142, 148` | none |
| `isIso_hom_app_abutment_of_hasConvergenceBounds` | `a ≥ b`; `a < b`; `K′ = ℤ[0] → K = (ℤ →(id) ℤ)` non-exhaustive | both abutments `0`; five lemma on `EInfty q n`, `a ≤ q < b`, pages stable from `b − a + 1`; page maps iso, `ℤ → 0` not iso, `K` fails the top bound (`ℤ → 0` for `j ≥ 0`) | holds; contains Tau Ceti's theorem (`Comparison.lean:121`), without `a ≤ b` | none |
| `hasConvergenceBounds_spectralObject_filtrationFunctor` | `ℤ →(×2) ℤ`; `K = 0`; `b = −1` | `(−2, 0)` holds; holds; `htop` fails | holds; first conjunct is `isZero_spectralObject_H_bot` (`Filtered/Stabilization.lean:44`) twice, second needs the naturality lemma, so not a one-lemma statement | none |
| `sum_negOnePow_homology_eq_sum_negOnePow_page` | `ℚ →(×2) ℚ`; over `𝔽₂`; `K = 0`, `s = ∅`; `s` with a zero position | `1 − 1 = 0 = 0`; `0 = 1 − 1`; `0 = 0`; extra `n` in the image contributes `v(0) = 0` | holds; `hfin` gives bounds in every degree (`G_a^n = G_a^{n+1} = 0`; `G_b = K` in degrees `n − 1, n` gives `Z^n(G_b) = Z^n(K)`) | none |
| `isIso_homologyMap_of_isIso_page_of_exhaustive_of_boundedBelow` | `ℤ → ℤ_ℓ`, `ℓ`-adic; `ℤ[0] →` non-exhaustive `K`; identity of `ℤ →(×2) ℤ`, `a = −2` | `hFa` fails (no stage vanishes); `hGex` fails at `m = −1`; all hypotheses hold | holds: cycle side from `G_a^{n+1} = 0`; `colim_j G_j^m → K^m` mono by exactness, epi since its image bounds every stage; filtration of `H^n` zero below `a`, hence complete | none |
| `isReplete_iff_countableAB4Star_and_epi_towerDifference` | `P_n = F_n ⊕ ∏F_k`, transitions `(a,t) ↦ (f_n a + π_n t, t)`; `ℤ/ℓ^{n+1} ↠ ℤ/ℓ^n`; discrete `Gal(ℚ̄/ℚ)`-modules | compatible families are `(x, (1−s)x)`; projection `(π_0, 1−s)` epi; `x_{n+1}` lifts `x_n − y_n`; `lim μ_{ℓ^n} = 0`, not replete | both directions hold; pin definition quantifies over every limit cone (`Replete.lean:91–94`) | S02 (citation) |
| `IsMittagLeffler` (7.2) | epi tower (`m = n`); `ℤ/ℓ`, zero maps (`m = n+1`); `×ℓ` on `ℤ`; model "eventually epi" | holds; holds; images `ℓ^{k−n}ℤ` strictly decrease; rejects the zero tower | real body, images in `Subobject (F n)`; no clash with `CategoryTheory.Functor.IsMittagLeffler` (type-valued, other namespace) | none |
| `epi_towerDifference_of_isMittagLeffler` | stable images `F′`; `F/F′`; non-replete category | `im(F′_{n+1} → F_n) = F′_n`; `F_{m(n)}/F′ → F_n/F′_n` zero, pro-zero in the sense of `ProZero.lean:67`; Neeman | holds with `CountableAB4Star` from the pinned instance | S04 (locator) |

README targets (31 numbered targets; values for those not covered above).

| Target | Instances tried | Values computed | Result | Change |
| --- | --- | --- | --- | --- |
| 1.1 | `ℤ ⊇ 2ℤ ⊇ 4ℤ`; `X = 0`; `ℤ/4` two presentations; swap marking on `ℤ²` | preimages `4ℤ ≤ 2ℤ ≤ ℤ`; `B = Z`; both present `ℤ/2`; axis goes to the other axis | holds | none |
| 1.2 | `×2` example | `Z_3(0,1) = B_3(0,1) = 0`; `Z_3(2,0) = ℤ`, `B_3(2,0) = 2ℤ` | holds | none |
| 1.3 | `×2` example; new Check | `(2,0)` stable from `3`; `(0,1)` coregular from `2`, regular from `3`; degenerate at `3` only | holds | none |
| 1.4 | `K^0 = ℤ →(id) ℤ` with `ℓ`-adic steps | `gr^0 = ℤ[0]`, `gr^p = ℤ/ℓ[1]`; `Z_r(0,0) = ℓ^{r−1}ℤ`, `Z_∞ = 0`, every `E_r^{0,0} ≅ ℤ`; `H^0(K) = 0` | holds | none |
| 2.2 | bound formulas; finiteness bullet on the 1.4 example | `r ≥ β(n+1) − f + e`, `r ≥ f − α(n−1) + e`; degree `0` finite, degree `1` infinite, `(0,0)` unstable | holds | none |
| 3.1 | `ℓ`-adic `ℤ`, `ℤ_ℓ`; constant; zero filtration | exhaustive, separated, not complete; complete; not separated; not exhaustive | holds | none |
| 3.2 | three Checks; dictionary | strong; convergent not strong; weak only. helle-rognes2024 line 94–98 includes exhaustiveness in "weakly", stacks-012K line 3135–3140 as stated | holds | none |
| 3.3 | see round-1 table | — | holds | none |
| 3.4 | Euler route: `R = max(r, f₊ − f₋ + e + 1)`; both negative Checks | targets at `f + r′ − e > f₊`; sums `0` vs `−1`; `0` vs `1` | holds | none |
| 3.5 | third bullet | `colim_p F^p/F^{p′} ≅ X/F^{p′}` (exhaustive, exact colimits), then `X = lim_{p′}`; `ℤ → ℤ_ℓ` negative | holds | none |
| 3.6 | two rows `S^1 → S^3 → S^2`; two columns; `m = 0`; vanishing | `H^0 = H^3 = ℤ`, `H^1 = H^2 = 0`; `ℤ/4` vs `ℤ/2²`; composite of two identities nonzero; all `gr = 0` with exhaustive and separated gives `H = 0` | holds | none |
| 4.1 | recipes at the pin; `l = 2`, `r = 3`; class Check | `HasSpectralSequence.lean:143–273` indices as stated; `(0,0,1,2)`, `(0,1,2,2)`; class demands `H^0(1 ≤ 2) = 0`, which is `ℤ` | holds | none |
| 4.2 | `ℤ →(×2) ℤ`; first quadrant | `F^3 = ℤ/2`, `F^4 = 0`; `F^0 = H^n`, `F^{n+1} = 0` from `isZero₁`, `isZero₂` | holds | none |
| 4.3 | cycle side with one `i`; continuity example; non-exhaustive Check | map `H^{n+1}(⊥ ≤ q−r+2) → H^{n+1}(⊥ ≤ q)` factors through `H^{n+1}(⊥ ≤ i) = 0`; `ℤ → 0` onto; `Bᵗ = ℤ ≠ 0 = B_∞` | holds | none |
| 4.5 | first quadrant; third quadrant `m = −2`, `m ≥ 1` | `a = min(0, n+1)`, `b = n+1`, `H^n = 0` for `n < 0` via `j = 0`; `a = min(m, 1)` from `isZero₂` (`i ≤ m`, `i ≤ m+1`), `b = 1` from `isZero₁`; `H^m = 0` for `m ≥ 1` | holds | none |
| 4.6 | see Lean table | — | holds | none |
| 5.1, 5.2 | dictionary `(2p+q+1, −p−1)`; (24.6.1), (24.6.2) sides; `ℤ^(ℕ) ⊕ ℤ` Check | `(1,−1)`, `(3,−2)`, `d = +2`; stacks-012K line 3093–3102: (24.6.1) cycles, (24.6.2) boundaries, as used; `B_∞ = 0 ≠ 0 ⊕ ℤ` | holds; agrees with DGFloer Layer 1 item 3 (`README.md:645–646` on main) | none |
| 5.3 | `K^m = ℤ`, `d = 0`, `p ≤ m`; degree `n+1` Check | `p₁ = n`, `p₀ = n + 2`; `H^1(F^s K) = ℓ^{s−1}ℤ ≠ 0` | holds; uses injectivity in degree `n`, the correct form of the source's step (Source issues) | none |
| 5.4 | route | see Lean table | holds | none |
| 6.1 | degrees; `ℤ²` couple; shift offset | `(r, 1−r)`; `ker(jk)/im(jk) = 0`; `e − k = 0`. `ℤ²` couple is StableHomotopyKTheory §7.22's (`README.md:2620` on main) | holds | none |
| 6.2 | `r = 0`; Bockstein; `ℤ/ℓ²` | `Z_1 = E`, `B_1 = 0`; `E_∞ = ℤ/ℓ`; `Z_2 = E`, wrong model `ℤ/ℓ ⊕ 0`. Agrees with stacks-012K line 2690 | holds | none |
| 6.3 | degrees; exactness; tower in degree `1` | `i : D(p,q) → D(p−1,q+1)`, `k : E(p,q) → D(p+2,q−1)`, `d_r` of degree `(r+1, −r)`; `0, ℤ, ℤ/2` | holds | none |
| 7.1 | completeness through `lim¹` | `(1−s)(Δc − σ) = y`; six-term sequence for the converse; constant filtration negative | holds | none |
| 7.3 | constant; `×ℓ` | `0, 0, 0`; `0 → 0 → ℤ_ℓ/ℤ → ℤ_ℓ/ℤ → 0`, `×ℓ` bijective on `ℤ_ℓ/ℤ` | holds on instances | none |
| 7.4 | both theorems against helle-rognes2024 line 163–168 and proofs line 215–247; degree shift; Example 8.1 | first theorem uses towers `n`, `n+1`; second uses `RE_∞ = 0` only at total degree `n` (six-term sequence of line 204 in the tower `A_{n+1}`); `d_{2m−1} : (−m, m−1) → (m−1, 1−m)`, `Z_r` full exactly for `r ≤ 2m−1`; `W^0 = ∏k/⨁k` | holds; agrees with StableHomotopyKTheory §7.26 | none |
| 7.5 | route; first-quadrant Check | `1 − s` iso on `∏_s F^s K`, so on `H^n` by `CountableAB4Star`; `β(n) = n+1`, `α(n) = −1` | holds | none |

Conventions with a witness: classical-to-native dictionary (`(1,−1)`, `(3,−2)`, `+2`), E₂ index
shift `n + 1`, exact-couple degrees and the colimit/limit degree shift (two step couples) were each
recomputed in every layer that uses them (Conventions, 4.2, 4.4, 5.1, 5.2, 6.3, 7.4) with the same
values.

## Dependency check

```text
depcheck: 242 roadmaps, 2194 edges, 0 problem(s)
```

No UPWARD, CYCLE or `moved:` line. Merge order: StableHomotopyKTheory (line 17) precedes this
roadmap (line 18); every other roadmap cited as an owner (DGFloer, AlgebraicTopology,
DerivedModuleAlgebra, SchemeAndStackFoundations, ComplexKahlerGeometry, HeegaardFloer, MorseTheory,
EnhancedDerivedSheaves) is on main. The declared gap `gap:exact-couple-morphisms` has the same slug
and sentence in `design/plan.json` and at `README.md:345–350`; StableHomotopyKTheory §7.22 on main
defines no morphisms of exact couples, so the gap asks for nothing already provided. `git diff --stat`
against main touches only the package folder.

## Verified sound

- **Declarations read:** 13 of 13, with the elaborated signatures of `scratch/signatures.md`
  compared with the README statements; no binder lost, no `set_option`, no `lemma`, no sorry'd data,
  no `#eval`/`#print`; 329 lines; names of the 13 declarations all appear in the README and every
  backticked name of this roadmap in the README is declared.
- **Targets read:** 31 of 31, with their 31 Checks blocks; every definition has at least three
  discriminating Checks.
- **Checks tested:** 115 Check items read and evaluated against the theorems of their section;
  none false, none vacuous after the round-1 repairs. Three rest on a pinned Tau Ceti statement that
  was read, not recomputed (4.6 second Check; 7.2 third and light-condensed Checks).
- **Pinned declarations:** 56 Mathlib and 56 Tau Ceti names of the supplier contracts resolved at
  the pins with their files; the statements relied on were read (`coreE₂*` recipes,
  `HasSpectralSequence` and its instances, `IsFirstQuadrant`, `IsThirdQuadrant`,
  `HasFirstPageComputation`, `mapFourδ₁Toδ₀'`, `mapFourδ₄Toδ₃'`, `abutmentFiltration`, `EInfty`,
  `isIso_hom_app_abutment_of_isIso_page`, `IsReplete`, `countableAB4Star`, `IsProZero`,
  `filtrationFunctor`, `spectralObjectHIsoCokernel`, the Euler–Poincaré engine, the `ModuleCat`
  `AB5`/`AB4Star`/`EnoughProjectives` instances). No target of `Suggested.lean` is proved at the pins.
- **Locators verified:** 43 distinct line locators (stacks-012K 23, helle-rognes2024 16,
  bhatt-scholze2015 2, browning-sawin2020 2), every one in the README, all at the cited lines; the
  tags in the docstrings of `Suggested.lean` were checked against the same lines (one off: S04).
- **Sibling citations checked:** 15 on main (StableHomotopyKTheory §§7.21–7.26; DGFloer Layer 1
  items 2, 3 (`DGFloer/README.md:439`, `:621`); AlgebraicTopology §6.0; DerivedModuleAlgebra §S.1 with `DoubleComplex.edgeBottom`,
  `DoubleComplex.edgeLeft` and `r > max(p, q+1)`; SchemeAndStackFoundations §§2.2, 2.17 with
  *IsReplete.derived_limits* and the `Spec ℚ` tower; ComplexKahlerGeometry K8;
  EnhancedDerivedSheaves E2:towers.1, E2.1, E2.2; HeegaardFloer and MorseTheory by name); one stale
  (S01).
- **Ownership against open work:** `roadmaps grep` over the open heads for the limit page,
  convergence structures, the whole-plane obstruction, `IsMittagLeffler` in an abelian category,
  exact couples and `towerDifference` found no second owner; the two board packages of
  `scratch/board-packages-index.txt` are unrelated. `scratch/overlaps.md` lists no overlap.
- **Headlines:** every headline of the Summary is either stated (2.2, 2.3, 4.3–4.4, 4.6, 5.3 twice,
  5.4 comparison, 7.2 twice) or named in the module docstring with the missing carrier (3.2–3.6,
  4.5, 5.4, 6.1–6.3, 7.3, 7.4, 7.5). No declaration is padding by the one-tactic probe.

Source independence: 48 passages compared with 4 sources (43 locators and 5 further prose passages:
1.1's definition, 2.3's route, 4.3's continuity item, 7.2's route, the docstring of
`IsMittagLeffler`), none shared beyond what the mathematics forces (longest run 7 words, "to a
complex whose ith cohomology is", browning-sawin2020 line 64); largest share stacks-012K, 43 of 97
keyed citations; contents compared with stacks-012K (§§10, 19–24, 31): independent — exact couples
(§21) come after filtered complexes (§24) here, Layer 4 has no counterpart, Layers 2 and 3 each draw
on §24 and §10 or §19. The six uncertified texts could not be read.

## Not verifiable

- weibel1994, boardman1999, eilenberg-moore1962, mccleary2001, massey1952, cartan-eilenberg1956:
  uncertified, texts not available; locators taken as given, the mathematics checked directly.
- 7.3 in an arbitrary abelian category with `CountableAB4Star` (the source works with graded
  modules): two instances computed; the cofinality step for the bi-indexed system not reproved.
- 7.1, invariance of `lim¹` under cofinal subsequences and pro-isomorphisms "in any additive
  category": the shift is chain-homotopic to the identity on the two-term complex (`s − 1 = −d`);
  the subsequence comparison itself not reproved.
- 7.4 and 7.5 outside graded modules: each step of the source's proofs (helle-rognes2024 line
  185–247) was matched to a hypothesis on `C` (six-term sequence, `epi_π_app`, exact sequential
  colimits); the whole argument was not reproved.
- No Lean was run: S03's replacement import is to be elaborated by the repair worker.

## Source issues

- **Error** in stacks-012K at Lemma 24.13, proof, printed page 67 (line 3229–3232): the source says an isomorphism on cohomology in degree `n − 1`, for indices below `p₁(n − 1)`, gives the boundary equality in degree `n`; it should be injectivity in degree `n`, with threshold `p₁(n)`; affects the proof.
- **Misprint** in stacks-012K at Lemma 24.11, proof, printed page 65 (line 3162): the source says the vanishing of the step of `K^n` simplifies the right side of (24.6.1); it should be the vanishing of the step of `K^{n+1}`; affects the proof.
- **Misprint** in bhatt-scholze2015 at Proposition 3.1.10, proof (line 766): the source says the auxiliary object is the product over `i ≤ n` of `F_n`; it should be the product of `F_i`; affects nothing.
- **Misprint** in helle-rognes2024 at Lemma 3.13, proof, printed page 4 (line 186): the source says the map from the limit is the colimit structure map; it should be the limit structure map; affects nothing.

## For the human reviewers

- **Not tested.** weibel1994 (12 citations, second largest share) is uncertified and could not be
  read; wording and arrangement were compared with stacks-012K, the largest share, only.
- **Licence.** helle-rognes2024 is read from an author-page draft dated 2 February 2018
  (`sources.toml`, `licence_class = "author-page"`); agreement of its numbering with the published
  version is asserted at `README.md:1910–1911` and was not checked against the publisher's text.
- **Scope.** 5.4, 7.4 and 7.5 state in abelian categories what DGFloer Layer 1 item 3 and
  StableHomotopyKTheory §7.26 own for modules and spectra (`README.md:72–87`); whether those owners
  later cite this roadmap is an ownership decision.

<!-- tauceti-roadmap-review {"agent": "claude", "head": "4a46526ce0ca049ff91c6bdb18adeca7fe0f72f8", "job": "RT-SpectralSequencesAndConvergence~2b", "model": "fable", "worker": "chris-x26"} -->
