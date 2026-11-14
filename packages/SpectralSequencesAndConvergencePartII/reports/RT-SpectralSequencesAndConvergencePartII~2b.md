<!-- from CBirkbeck, https://github.com/TauCetiProject/TauCetiRoadmapJobs/pull/15047#issuecomment-6873168781 -->
Red team round 2 pass b (claude) of d6baa19

Verdict: needs_changes

**For the human reviewers:** this review raises 3 questions that a human decides (the scope of the roadmap, or a licence). They are in the section of that name at the end and do not change the verdict.

1. **F01** (P2) 2.4, 2.5 and 3.2 assume the first functor left exact; the cited source and 3.1 do not

   **Location.** `packages/SpectralSequencesAndConvergencePartII/README.md:1172` "Let `F : 𝒜 → ℬ` be
   left exact, `𝒜` with enough injectives"; `:1211` "With `F`, `K` and `I` as in 2.4"; `:1354` "Let `F`,
   `G` be left exact and satisfy the equivalent conditions of 3.1".

   **Claim.** The two hypercohomology sequences of `F` and the composite-functor sequence of `(F, G)`
   are stated for left exact `F` only.

   **Witness.** grothendieck1957 line 1236 ((2.4.2), cited at README 1175 and 1213) takes a covariant
   functor with no exactness; grothendieck1957 line 1332–1333 (Théorème 2.4.1, cited at README 1358)
   asks left exactness of `G` only. README 3.1 (line 1316–1317) says of `F`'s left exactness that
   "neither direction of the proof uses it", and its fourth Check (line 1348–1350) exhibits
   `F = − ⊗ ℤ/2`, `G = 𝟙`, a pair satisfying 3.1 for which 3.2 then defines nothing. Nothing in the
   definitions or in the first three items of 2.4, 2.5 or the first three of 3.2 uses left exactness
   of `F`: `′E_1^{p,q} = H^q(F(I^{p,•})) = R^qF(K^p)` is 2.2(i)–(ii), which the README states for
   additive `F`; the split rows of 2.3 commute with every additive functor; `Tot F(I) = F(Tot I)`.

   **Repair.**

   1. Line 1172: replace "Let `F : 𝒜 → ℬ` be left exact" by "Let `F : 𝒜 → ℬ` be additive (left
      exactness of `F` is used only where an item says so)". In 2.4's third Check (line 1206) replace
      "If every `K^p` is `F`-acyclic" by "If `F` is left exact and every `K^p` is `F`-acyclic".
   2. 2.5: begin the item *F-acyclic Cartan–Eilenberg resolutions* (line 1225) and the last item (line
      1232) with "For `F` left exact:" (both use Leray's lemma 2.2(v)).
   3. Line 1354: replace "Let `F`, `G` be left exact and satisfy the equivalent conditions of 3.1" by
      "Let `F` be additive and `G` left exact, satisfying the equivalent conditions of 3.1". Begin the
      item *computation by F-acyclic resolutions* (line 1364) and the item on ArithmeticGaloisDuality
      §D7.1 (line 1368) with "For `F` left exact:". In the locator (line 1358) add after "tag 015N":
      "for left exact `F`".
   4. Line 1395: replace "For an object `A` of `𝒜`, prove" by "For `F`, `G` left exact and an object
      `A` of `𝒜`, prove", and add at the end of 3.3's first item: "For `F` merely additive the same
      sequences hold with `R⁰F(A)` in place of `F(A)`."

   Tested on the witness `F = − ⊗ ℤ/2`, `G = 𝟙` on abelian groups, `A = ℤ`, `J = (ℚ → ℚ/ℤ)`:
   `F(J) = 0`, so `E(F, G; ℤ[0]) = ″E(𝟙, 0)` is zero, `E₂^{p,q} = R^pG(R^qF(ℤ)) = 0` (2.2's Checks:
   `R⁰F(ℤ) = R¹F(ℤ) = 0`) and the abutment `Rⁿ(G ∘ F)(ℤ) = RⁿF(ℤ) = 0`: items one to three of 3.2
   hold. The unamended 3.3 would fail there: `R⁰G(F(ℤ)) = ℤ/2` against `R⁰(G ∘ F)(ℤ) = 0`, which is
   why step 4 keeps left exactness in 3.3.

2. **F02** (P3) two pinned Tau Ceti comparison theorems, special cases of 1.4, are not named

   **Location.** `packages/SpectralSequencesAndConvergencePartII/README.md:87–100` (Scope, *Tau Ceti (at
   the pin)*), `:307–374` (*From Tau Ceti*), `:869–877` (Checks of 1.4).

   **Claim.** The Scope paragraph and the supplier list say what Tau Ceti has at the pin that is an
   instance of Layer 1; 1.4's route cites only `CategoryTheory.SpectralSequence.Hom.isIso_hom_f_of_le`.

   **Witness.** `TauCeti/Algebra/Homology/SpectralSequence/Filtered/Comparison.lean` line 70,
   `CochainComplex.isIso_homologyMap_of_isIso_spectralSequence_page` (finite filtrations, any abelian
   category), and `Filtered/Exhaustive.lean` line 200,
   `CochainComplex.isIso_homologyMap_of_isIso_spectralSequence_page_of_exhaustive` (modules). Neither
   name occurs in the README.

   **Repair.** Add to *From Tau Ceti*, after the item on `isIso_hom_f_of_le`:

   > - `CochainComplex.isIso_homologyMap_of_isIso_spectralSequence_page`
   >   (`TauCeti/Algebra/Homology/SpectralSequence/Filtered/Comparison.lean`): for increasing
   >   filtrations of two cochain complexes in an abelian category that are finite as filtrations of
   >   complexes (`F_a = G_a = ⊥`, `F_b = G_b = ⊤`), a morphism of filtered complexes that is an
   >   isomorphism at every position of some native page `r ≥ 2` induces isomorphisms on cohomology;
   >   and `CochainComplex.isIso_homologyMap_of_isIso_spectralSequence_page_of_exhaustive`
   >   (`Filtered/Exhaustive.lean`): the same conclusion in one degree `n`, for complexes of modules
   >   whose filtrations are exhaustive in degrees `n − 1`, `n`, with stages of index `≤ a` without
   >   cohomology in degrees `n`, `n + 1` and graded pieces of index `≥ b` without cohomology in
   >   degrees `n − 1`, `n`. Compared in a Check of 1.4; the general comparison theorem is base §3.5.

   and replace 1.4's third Check (line 877, see S03) by:

   > - *The pinned finite case.* If `K` and `L` have only finitely many nonzero columns, the column
   >   filtrations are finite as filtrations of complexes and the first case is Tau Ceti's
   >   `CochainComplex.isIso_homologyMap_of_isIso_spectralSequence_page`, applied to the page-`1`
   >   isomorphism of 1.2 (native page `2`). Finite antidiagonals ask less: `K^{p,p} = ℤ` for every
   >   `p ∈ ℤ` has one term on each even antidiagonal and infinitely many columns, so no `F_a` is `⊥`
   >   and that declaration does not apply, while the first case does.

   Tested: for `K^{p,p} = ℤ` the antidiagonal `2p` is `{K^{p,p}}` and the odd ones are empty (finite),
   and `F_I^p Tot(K) ≠ 0` for every `p`.

3. **F03** (P3) four Checks hold for any construction

   **Location.** `packages/SpectralSequencesAndConvergencePartII/README.md:816` "The zero double complex
   converges to zero in every case."; `:877` "The identity of `K` gives the identity of `Tot(K)`.";
   `:1161` "The zero double complex is a Cartan–Eilenberg resolution of the zero complex."; `:1425` "The
   identity transformations induce identity morphisms."

   **Claim.** Each is a Check of its section.

   **Witness.** Each holds for every additive candidate: the zero object and the identity do not
   separate `Tot^⊕` from `Tot^Π`, `′E` from `″E`, a Cartan–Eilenberg resolution from a column
   resolution (2.3's third Check does), or `R^pG(R^qα)` from any other functorial assignment.

   **Repair.** Delete lines 816, 1161 and 1425 (1.3 keeps six Checks, 2.3 three discriminating ones,
   3.3 two). Replace line 877 by the Check of S02.

4. **F04** (P3) two lines of the module docstring begin with `theorem` and `lemma`

   **Location.** `packages/SpectralSequencesAndConvergencePartII/Suggested.lean:37` "  theorem 1.3(c),
   the comparison of totals and the acyclic assembly lemma for it (1.4, 1.5). Neither"; `:39` "  lemma
   for it also need the class of abelian categories".

   **Claim.** The file has thirteen declarations and no `lemma`.

   **Witness.** The elaborated-signature listing of this head reports fifteen declarations, among them
   "`1.3` (theorem, line 37)" with type `1.3 : Float` and "`for` (lemma, line 39)": a line-anchored
   scan reads the two docstring lines as a `theorem` and a `lemma`.

   **Repair.** Replace lines 36–40 by:

   ```lean
   * the product totalisation of a double complex and every statement about it: its convergence
     (1.3(c)), and the comparison of totals and acyclic assembly for it (1.4, 1.5). Neither library
     has a product total complex of a bicomplex; the comparison and acyclic assembly for it also
     need the class of abelian categories with lim-acyclic epimorphic towers of
     SpectralSequencesAndConvergence §7.2;
   ```

   Tested: no line of the replacement begins with `theorem`, `lemma`, `def` or `instance`; the content
   (which headline, which carrier is missing) is unchanged.

One P2 and three P3 findings, numbered S01–S04 (second pass). No statement of `Suggested.lean` or of
the README was found false. The whole README (2017 lines) and the whole `Suggested.lean` (292 lines)
were read.

## Round 1 findings at this head

| Earlier finding | Status | Witness at d6baa19 |
| --- | --- | --- |
| 1a/F01 (P2) complex and relative horseshoe had no acceptance signatures | repaired | `packages/SpectralSequencesAndConvergencePartII/Suggested.lean:159` `theorem exists_quasiIso_injective_horseshoe` and `:183` `theorem exists_horseshoe_lift`; README 2.1(a′), (b) name both (line 978, 989); module docstring line 20–24 lists them |
| 1a/F02 (P3) no Check separating `(−1)^{p+q}` from `+1` over `ℤ` | repaired | README line 1794–1801: "`d₁(u)·u − u·d₁(u) = vu − uv = 0`, while the rule without the sign `(−1)^{p+q}` would give `vu + uv = 2uv`"; README line 1755–1759 reads `μ_0` on the same couple |
| 1b/F01 (P2) 3.3 took edge maps through a comparison no target stated | repaired | README line 750–767, new target 1.3(a′): "isomorphic to the spectral sequence of DerivedModuleAlgebra §S.1 of the anticommuting pair `d′ = d₁`, `d″ = (−1)^p d₂`, by an isomorphism compatible with the two identifications of the second page"; 3.2, 3.3 and both contracts cite it |
| 1b/F02 (P3) three Tau Ceti statements unnamed or misdescribed | repaired | README line 91–99 and 354–374: `HomologicalComplex.homologyKunnethShortComplex_shortExact` with "cycles `Z_q(L)` and the quotients `L_q/Z_q(L)` be projective, and none on `K` or on the ring"; `torOneIsoKernel`, `isZero_Tor_add_two`, `TauCeti.cyclicBockstein` named |
| 1b/F03 (P3) 4.2(a) claimed naturality in `M` from page 1 | repaired | README line 1538–1539: "natural in `K`; from page `2` on it does not depend on `P` and is natural in `M`" |

The repairs were recomputed (rows 6–9 and 21 of the table below). No repair introduced a false
statement. One new defect sits in text a repair touched: the module docstring of `Suggested.lean`
(S04).

## The adversarial pass: computed values

| # | Statement | Instances tried | Values computed | Result |
| --- | --- | --- | --- | --- |
| 1 | `acyclic_total_of_finite_antidiagonals` | `ℤ →(id) ℤ` horizontal; zero | total `ℤ →(1) ℤ`, `H = 0`; `K.X p` is column `p`, `K.flip.X q` row `q` | true |
| 2 | `acyclic_total_of_bounded` | staircase; dual staircase | staircase: rows exact, `q ≤ 0`, `x ↦ (x_p − (−1)^p x_{p+1})` bijective on `⊕`, kernel `(1, 1, −1, −1, …)` on `∏`; dual: columns exact, `p ≥ 0`, `y = (1, 0, …)` missed on `⊕` by functional `1, −1, −1, 1, 1, …`, so `H^1(Tot^⊕) = ℤ` | true; direction `b < p` is the right one, the dual staircase refutes `p < b` |
| 3 | `quasiIso_total_map_of_finite_antidiagonals`, `…_of_bounded` | staircase → its column `0`; `L = 0` | `H^0(Tot^⊕) = 0` against `ℤ`: the map is a column quasi-isomorphism and not a total one, and the hypothesis `b < p` fails (`p ≥ 0` unbounded); cone terms `K^{p,n+1−p} ⊕ L^{p,n−p}` | true; the `L = 0` case is rows 1–2 and needs the zero total and the vanishing data, so not one tactic |
| 4 | `exists_injectiveResolution_horseshoe` | `0 → ℤ →(2) ℤ → ℤ/2 → 0`, `I₁ = (ℚ → ℚ/ℤ)`, `I₃ = (ℚ/ℤ →(2) ℚ/ℤ)` | middle `ℚ ⊕ ℚ/ℤ → (ℚ/ℤ)²`, `H^0 = ℤ`; untwisted sum gives `ℤ ⊕ ℤ/2` | true, no enough-injectives needed (`I₂^n = I₁^n ⊕ I₃^n`) |
| 5 | `exists_quasiIso_injective_horseshoe` | route: pushout `E = (I₁ ⊕ B)/A`; `I₁` with `ℚ/ℤ →(id) ℚ/ℤ` in degrees `−1, 0` | `0 → I₁ → E → C → 0` exact, degreewise split, `B → E` quasi-iso (five lemma); `E`, `I₃`, hence `I₂ = I₁ ⊕ I₃` vanish below `n`; padded `I₁` violates `[I₁.IsStrictlyGE 0]` | true; bound on `I₁` needed |
| 6 | `exists_horseshoe_lift` | route recomputed | `pν − βr₂ = dh + hd`; `ν′ = ν − (dh̃ + h̃d)`, degree-0 correction `h̃¹d⁰ε₂ = 0`; `ν′r₁ = iγ`, `γε₁ = I₁.ι τ₁`, `γ − α = dg + gd`, `g` extends along mono `r₁` into injective `I₁`; `μ = ν′ − i(dg̃ + g̃d)` gives `r₁μ = αi`, `μp = r₂β` | true; `hS`, `hS'`, `[QuasiIso ε₃]` unused by the route (P3 note, already recorded in the repair report) |
| 7 | 1.3(a′), Check *needs the dictionary* | `x, y, z, w` complex | `x ↦ z`, `y ↦ w − z`, `H¹ = H² = 0`, `d(x + y) = w`; pair `(d₁, d₂)`: `y ↦ w + z`, `d(x − y) = −w` | consistent |
| 8 | 4.2(a) two-column and naturality | `K = ℤ/2[0]`, `M = ℤ/2`; `K = ⊕ℤ/2[n]` | `E₂^{0,0} = E₂^{−1,0} = ℤ/2`; `Hⁿ = (ℤ/2)²`; rows of `K ⊠ P` vanish for `q > 0`, so 1.3(b) for `″E` applies | consistent |
| 9 | 4.3, Tau Ceti Künneth Check | `C = D = (ℤ →(2) ℤ)` in degrees `−1, 0` | `e⊗e ↦ (−2, 2)`, `(a, b) ↦ 2a + 2b`, `H^{−2} = 0`, `H^{−1} = H^0 = ℤ/2`; Tor term at `i + j = n + 1 = 0` is `ℤ/2` | consistent |
| 10 | `IsRightAcyclic` | `F = Hom(ℤ/2, −)`: `ℚ/ℤ`, `ℤ`; `F = − ⊗ ℤ/2`: `ℤ` | `R¹F(ℤ) = ℤ/2` (not acyclic), `ℚ/ℤ` acyclic with `R⁰F = ℤ/2 ≠ 0`; tensor: `R⁰ = R¹ = 0`, acyclic, unit `ℤ/2[0] → 0` not iso | definition separates; wrong model "vanishing in degree `0` too" excluded |
| 11 | `exists_rightDerivedFunctorPlus_homology_iso_rightDerived` | `n = 0`, `F = − ⊗ ℤ/2`, `A = ℤ`; `τ = 2·𝟙` on `Hom(ℤ/2, −)`, `n = 1` | both sides `H^0(0 → 0) = 0`, `F(ℤ) = ℤ/2`; both sides of compatibility `×2 = 0` on `ℤ/2` | true without exactness |
| 12 | `isIso_rightDerivedFunctorPlusUnit_app_of_isRightAcyclic` | `F = − ⊗ ℤ/2`, `L = ℤ[0]` | hypothesis holds, unit `ℤ/2[0] → 0` not iso | `[PreservesFiniteLimits F]` needed and present |
| 13 | `compositionTrans`, `isIso_compositionTrans_iff` | `F = G = Hom(ℤ/2, −)` at `ℚ/ℤ`; `F = − ⊗ ℤ/2`, `G = 𝟙` | `R¹(G∘F)(ℚ/ℤ) = 0`, `H¹(RG(RF(ℚ/ℤ))) = Ext¹(ℤ/2, ℤ/2) = ℤ/2`; second pair: both sides `RF`, iso | iff true for additive `F`: (⇐) Leray at `F(J)`, (⇒) evaluate at `I[0]`; direction `R(F ⋙ G) ⟶ RF ⋙ RG` as Stacks line 3702 |
| 14 | `nonempty_tor_iso_tor'` | `Tor_1(ℤ/4, ℤ/6)`; the `⋆`-structure on `𝔽₂[x, y]/(x², y²)`-modules | kernels `{0, 2} ⊂ ℤ/4`, `{0, 3} ⊂ ℤ/6`; `Tor_0(X, k) = Tor'_0(X, k) = k`, `X ⋆ k = soc(X)` of dimension `2` | true; Mathlib `Tor` derives the second variable, `Tor'` the first (`Mathlib/CategoryTheory/Monoidal/Tor.lean`), so the statement is balance; `Tor_0 = ⊗` is not claimed |
| 15 | 1.1, 1.2 signs | unit square; column-sign complex | total `1 ↦ (1, 1)`, then `−1`, `+1`; `ℤ →(−2) ℤ`; `″d_1 = +2` on the flip, Stacks `(−1)^q H^q(d₂) = −2`, `σ(1, 1) = −1` intertwines | consistent with stacks-012K line 3260–3263 |
| 16 | 1.2 last Check | `k y_0 ⊕ V` complex | `x_m ↦ y_{m−1} + (−1)^m y_m`; on `∏`: `a_{j+1} = b_j − (−1)^j a_j`, `y_0 = d(1, 1, −1, −1, …)`, `H^0 = V`; on `⊕`: functional `1, 1, −1, −1, …` kills the image, `H^0 = k y_0 ⊕ V`; `F_I` not exhaustive on `∏` | consistent; 1.3(c) does not apply |
| 17 | 1.3(a) bound and weak Serre forms | `ℚ → ℚ/ℤ`, `P` = ℚ-vector spaces | `′E_1^{0,0} = ℚ`, `′E_1^{1,0} = ℚ/ℤ`, `′E_2^{0,0} = ℤ = H^0`; a nonzero `d_r` from `(p, q)` needs columns `p, …, p + r − 1` on antidiagonal `n`, so `r ≤` the stated bound | consistent |
| 18 | 1.3(b), (c), 1.5 half-planes | Weibel's four cases under `C_{p,q} = K^{−p,−q}`; augmented forms | `⊕`: left/upper for `′E`, lower/right for `″E`; `∏`: right/lower for `′E`, upper/left for `″E`; augmented `0 → M → A_•`: `p ≥ −1`, rows exact, `q ≤ n + 1` | consistent |
| 19 | 2.4, 2.5, 2.6 | `Hom(ℤ/2, −)` on `ℤ →(2) ℤ`; column resolution; `− ⊗ ℤ/2` on `ℤ →(2) ℤ` in degrees `−1, 0` | `′E_1^{0,1} = ′E_1^{1,1} = ℤ/2`, `′d_1 = 0`; `″E_2^{0,1} = ″E_2^{1,1} = ℤ/2`; column resolution puts `ℤ/2` at `(1, 0)`; `E^1_{0,0} = E^1_{1,0} = ℤ/2` | consistent; additive `F` suffices for the first three items (S01) |
| 20 | 3.2–3.4, 4.4 | `ℤ/4 → ℤ/2` coextension; `ℤ → ℤ/2` extension; `ℤ → ℤ/4`, `M = N = ℤ/2` | five-term `0 → 0 → ℤ/2 → ℤ/2 → 0 → ℤ/2`; `E₂^{0,q} = ℤ/2`, `q = 0, 1`; `E²_{p,q} = ℤ/2` for `p ≥ 0`, `q ∈ {0, 1}`, abutment `ℤ/2` in degrees `0, 1`, so `d² : E²_{p,0} → E²_{p−2,1}` iso for `p ≥ 2` | consistent |
| 21 | 5.1 `μ_n`, shift, sign | `ℤ →(4) ℤ` couple; `ℤ[v] ⊗ Λ(u)` | `k(1) = 2`, `d₁ = 0`, `c` odd so `j(c) = 1 ≠ 0`: `μ_1` fails and `μ_0` fails for `φ′`; `d(u²) = 0 = vu − uv`, unsigned `2uv ≠ 0`; converse step uses `iⁿk = 0`, `n ≥ 1` | consistent |
| 22 | 5.3 rules | `D = d₁ + (−1)^p d₂` on `xy` | components: `d₁(xy) = d₁x·y + (−1)^{p+q} x·d₁y`; `(−1)^{p+p′} d₂(xy) = (−1)^p d₂x·y + (−1)^{p+q+p′} x·d₂y`; flip sign `(−1)^{pq+p′q′+(p+p′)(q+q′)} = (−1)^{pq′+p′q}` | iff and uniqueness true |
| 23 | 6.1, 6.2 | `ℤ →(p^r) ℤ`; `⊕_k (ℤ →(p^k) ℤ)`; `ℤ → ℤ[1/p]` | `E_s^0 = E_s^1 = ℤ/p` for `s ≤ r`, `0` after; `E_r^0 = ⊕_{k ≥ r} ℤ/p`, `E_∞^0 = 0`; `E_r^0 = ℤ/p` for all `r` against `H^0[1/p] = 0`; `ker k/B_r ≅ f^{r−1}Hⁿ/f^rHⁿ`; `f^rH^{n+1} ∩ H^{n+1}[f] = 0` for `r ≥ b` | consistent |

## Dependency check

```text
depcheck: 242 roadmaps, 2195 edges, 0 problem(s)
```

No UPWARD, CYCLE or `moved:` line. ArithmeticStatisticsPartVIII (later in the merge order) is named
only under "It leaves to named owners" and is consumed nowhere; its head does not cite this roadmap.

## Verified sound

- **Declarations read: 13** (11 theorems, 2 definitions with real bodies). Each compared with its
  README statement and with the elaborated types supplied for this head: binders, instance
  arguments and generality agree (1.4, 1.5, 2.1(a), (a′), (b), 2.2(i), (v), Conventions, 3.1, 4.1).
  No Lean was run in this pass. Single `import Mathlib`, no `set_option`, no sorry'd data, no
  `lemma` declaration.
- **Targets read: 24** (1.1–1.5, 2.1–2.6, 3.1–3.4, 4.1–4.4, 5.1–5.3, 6.1–6.2), with the
  Conventions, the supplier contracts and the 19 gap statements.
- **Headline theorems.** Stated: acyclic assembly and comparison of totals (direct sum), the three
  horseshoe statements, the comparison of the two right derived functors, Leray's lemma,
  Grothendieck's criterion, balancing of Tor. Named as not statable with the missing carrier:
  product totalisation, the spectral sequences of 1.2–1.3, 2.4–2.6, 3.2–3.4, 4.2–4.4,
  Cartan–Eilenberg resolutions, pairings, the Bockstein sequence. Checked at the pins: no
  `ExactCouple`, no product total complex, no Cartan–Eilenberg resolution, no `Tor ≅ Tor'`
  (`Mathlib/CategoryTheory/Monoidal/Tor.lean` line 21 records it as missing), no column filtration
  of a `ℤ × ℤ` total complex. One-tactic probe: no declaration follows from one library lemma.
- **Locators verified: 66** citation occurrences against the cached texts (stacks-012K 13,
  stacks-05QI 17, stacks-more-algebra 7, may-primer 11, hatcher-at 2, grothendieck1957 15,
  douady1959 1), every cited line range opened; all support the claims they are cited for, with
  the generality remarks the README already makes (and S01 for the hypothesis on `F`).
- **Checks tested: 102** read, and every one that states a numerical value recomputed (the rows
  above give the values); none false, four vacuous (S03). Every definition has at least three
  discriminating Checks.
- **Pinned declarations: 82** backticked library names resolved at the pinned Mathlib and Tau
  Ceti; the statements of `quasiIso_totalAugmentation_of_rows`, `isZero_Tor'_succ_of_projective`,
  `leftDerivedZeroIsoSelf`, `coextendScalars`/`extendScalars` (rings against commutative rings),
  `rightDerivedFunctorPlus` (additive `F`, enough injectives) were opened.
- **Sibling citations checked: 14**: DerivedModuleAlgebra §§0.2, S.1 (main), StableHomotopyKTheory
  §7.22 (main; "Page r≥1 is E of the (r−1)-derived couple; d_r has degree c+b−(r−1)a"),
  ArithmeticGaloisDuality §D7.1 *Derived composite spectral sequence* (open head; both functors
  left exact, *Needs* §S.1), KhovanovHomology K5, AlgebraicTopology §5.1, DGFloer Layer 1,
  SchemeAndStackFoundations §§2.2, 2.7, 2.15 with the four names, TopologicalSheafCohomology §1.4
  (main), SchemeKTheoryOperations, ArithmeticLocallySymmetricSpaces ALS.1.7,
  ArithmeticStatisticsPartVIII (open heads). The 19 gap slugs agree between `design/plan.json` and
  the README; every cited base section exists in the base design.
- **Ownership.** `roadmaps grep` over main and all open heads for Cartan–Eilenberg resolutions,
  acyclic assembly, the Bockstein spectral sequence, horseshoe lemmas, balancing of Tor, product
  totals, Massey pairings, Künneth and hypercohomology spectral sequences and the 13 Lean names: no
  other owner and no shared fully qualified name.
- **Policy.** The pull request changes only `packages/SpectralSequencesAndConvergencePartII/`. No
  pull-request number or process narrative in the README or in docstrings; every target has a
  locator; no computational algorithm.

## Not verifiable

- weibel1994, mccleary2001, cartan-eilenberg1956, massey1954 are settled as uncertified; their 24
  locators were not read. Two targets rest on them alone: 5.3 (cartan-eilenberg1956 Ch. XV) and
  the lifting item of 2.3 (weibel1994 Lemma 5.7.2, cartan-eilenberg1956 Ch. XVII §1). Whether
  Lemma 5.7.2 is the lifting statement or the existence statement could not be checked.
- SpectralSequencesAndConvergence has no README on main or at an open head; the gaps were compared
  with `packages/SpectralSequencesAndConvergence/design/README.md` only, and their proofs are not
  certified here.
- CohomologyOfGroups, EtaleDualityAndPerverseSheaves and TorsionCohomologyInfrastructure, named
  under *Downstream consumers*, were not opened.
- Ownership against open pull requests was checked through `roadmaps grep` by object, not by
  reading all 236 heads.
- grothendieck1957 and douady1959 are OCR extractions; formulas there were read for their position
  and hypotheses, not glyph by glyph.

## Source issues

- **Misprint** in may-primer at Example 2.3, printed page 4: the source says the Bockstein pages of the complex of a free cyclic summand are the integers; it should be the integers modulo `p` on every page; affects nothing.
- **Misprint** in may-primer at Proposition 4.1, printed page 7: the source says the condition of index `n` for a pairing is equivalent to that of index `n − 1` for the derived pairing, with no restriction; it should require `n ≥ 1`; affects a stated result.
- **Misprint** in stacks-05QI at the proof of Lemma 21.3, printed page 74: the source says the second-page differential comes from the horizontal cohomology complex of index `p` resolving the cohomology of index `p`; it should be index `q` in both places; affects nothing.
- **Misprint** in stacks-05QI at the proof of Lemma 22.1, printed page 74: the source says the transformation is evaluated at the derived image of an injective; it should be evaluated at the injective placed in degree zero; affects nothing.

Source independence: 26 passages compared with 7 sources, none shared beyond formulas and the definition of the conditions `μ_n` (may-primer line 252–256, forced by the mathematics); largest share stacks-05QI, 17 of 90 locators; contents compared with stacks-05QI (§§16, 18, 19, 21, 22 against 2.2, 2.1, 2.6, 2.3–2.5, Layer 3: different order, and Layers 1, 4, 5, 6 have no counterpart there): independent. The four uncertified works could not be read.

## For the human reviewers

- **Scope.** The base roadmap SpectralSequencesAndConvergence is not on main and has no open roadmap pull request; this Part II reaches it through 19 declared gaps (`packages/SpectralSequencesAndConvergencePartII/design/plan.json`).
- **Licence.** `packages/SpectralSequencesAndConvergencePartII/sources.toml` records grothendieck1957 with `licence_class = "operator-local"`.
- **Not tested.** weibel1994, mccleary2001, cartan-eilenberg1956 and massey1954 (24 of 90 locators) are uncertified: wording and arrangement were not compared with them.

<!-- tauceti-roadmap-review {"agent": "claude", "head": "d6baa193d1bfc5a46870e937aac2b897e5243a68", "job": "RT-SpectralSequencesAndConvergencePartII~2b", "model": "fable", "worker": "chris-x26"} -->
