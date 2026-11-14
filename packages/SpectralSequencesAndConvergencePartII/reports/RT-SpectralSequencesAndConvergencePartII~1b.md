<!-- from CBirkbeck, https://github.com/TauCetiProject/TauCetiRoadmapJobs/pull/15047#issuecomment-6872348746 -->
Red team round 1 pass b (claude) of 9566021

Verdict: needs_changes

**For the human reviewers:** this review raises 4 questions that a human decides (the scope of the roadmap, or a licence). They are in the section of that name at the end and do not change the verdict.

1. **F01** (P2) 3.3 identifies its edge maps through a comparison that no target states

   **Location.** `packages/SpectralSequencesAndConvergencePartII/README.md`:

   - line 542–544 (supplier contract): "Assumed: its construction is the one of 3.2 (…), so that 3.2 and
     3.3 apply to it."
   - line 1291–1292 (3.3): "whose first, second and fourth maps are the edge maps of
     ArithmeticGaloisDuality §D7.1".
   - line 1300–1301 (3.3, Route): "with ArithmeticGaloisDuality §D7.1's identification of the edge maps".
   - line 668–670 (1.2, a Check): "`′E_2 ≅ H_I H_II(K)` is then §S.1's identification".
   - line 868 (Layer 1, Dependencies): "DerivedModuleAlgebra §S.1 enters Checks only."

   **Claim.** The five-term sequence of 3.3 is obtained from base §3.6 applied to `″E(G, F(J))` of 3.2, and
   three of its maps are the canonical maps that ArithmeticGaloisDuality §D7.1 identifies.

   **Witness.** ArithmeticGaloisDuality §D7.1 (README at its open head, *Derived composite spectral
   sequence*, `*Needs:*` line) builds its sequence and edge maps on DerivedModuleAlgebra §S.1's carrier
   (`DoubleComplex.edgeBottom`, `DoubleComplex.edgeLeft`, main, `DerivedModuleAlgebra/README.md` line 65).
   The sequence of 3.2 lives in the base's convergence structure, with base §3.6's edge morphisms. No target
   of this roadmap, no gap and no supplier section identifies the two sequences or their edge morphisms:
   the only comparison is the Check at line 662–670, and line 868 says §S.1 enters Checks only. The
   "Assumed" sentence asks of §D7.1 something §D7.1 does not state.

   **Repair.**

   1. In 1.3, add after item (a):

      > - (a′) *First-quadrant comparison.* If `K^{p,q} = 0` for `p < 0` or `q < 0`, then `′E(K)`, in the
      >   classical indexing and with the convergence of (a), is isomorphic to the spectral sequence of
      >   DerivedModuleAlgebra §S.1 for the anticommuting pair `d′ = d₁`, `d″ = (−1)^p d₂` (both are Tau
      >   Ceti's `CochainComplex.spectralSequence` of the column filtration of the same total complex), the
      >   isomorphism being the identity on `H_I^p H_II^q(K)` on page `2` and on `Hⁿ(Tot K)` with its column
      >   filtration; under it the edge morphisms and the five-term and extended sequences of base §3.6
      >   are §S.1's. Through the flip the same holds for `″E(K)`.

      Add to the `*Needs:*` of 1.3: "base §3.6 (gap:base-first-quadrant-sequences); DerivedModuleAlgebra
      §S.1". Add "1.3(a′)" to the "Used in" sentence of gap:base-first-quadrant-sequences.
   2. In 3.3, replace "with ArithmeticGaloisDuality §D7.1's identification of the edge maps" by: "the double
      complex `G(I)` of 3.2 for `X = A[0]` is first-quadrant, so 1.3(a′) identifies the edge morphisms of
      base §3.6 with those of DerivedModuleAlgebra §S.1, which ArithmeticGaloisDuality §D7.1 identifies with
      the canonical maps". Add "1.3(a′)" to the `*Needs:*` of 3.3.
   3. In the supplier contract (line 542–544), replace the "Assumed" sentence by: "Assumed: nothing beyond
      the statement. §D7.1 states it on DerivedModuleAlgebra §S.1's first-quadrant sequence; 1.3(a′)
      identifies that sequence and its edge morphisms with `E(F, G; A[0])` of 3.2 and base §3.6's."
   4. Line 868: replace "DerivedModuleAlgebra §S.1 enters Checks only." by "DerivedModuleAlgebra §S.1 is
      compared in 1.3(a′) and in Checks." In the Check at line 668, replace "is then §S.1's
      identification" by "is then §S.1's identification (1.3(a′))".

   Tested on 3.3's first Check (`ℤ/4 → ℤ/2`, `A = ℤ/2`): the sequence `0 → 0 → ℤ/2 → ℤ/2 → 0 → ℤ/2` is
   unchanged; its second map `R¹(G ∘ F)(A) → G(R¹F(A))` is base §3.6's `H¹ → E_2^{0,1}`, which (a′) makes
   §S.1's left edge map and §D7.1 makes the canonical map, an isomorphism here because `G` is exact.

2. **F02** (P3) three statements about the pinned Tau Ceti name no declaration or misdescribe its hypothesis

   **Location.** `packages/SpectralSequencesAndConvergencePartII/README.md` line 89–92: "the Künneth short
   exact sequence over rings whose modules have projective dimension at most one, … `Tor` from
   presentations of length one, and the first-order Bockstein maps of continuous cohomology"; line 1817;
   line 1521–1523.

   **Claim.** Tau Ceti has these three things at the pin, and they are instances of Layers 4 and 6.

   **Witness.** The supplier list *From Tau Ceti* (line 297–340) names no declaration for the second and
   third. At the pin they are `CategoryTheory.ShortComplex.ShortExact.torOneIsoKernel` and
   `CategoryTheory.ShortComplex.ShortExact.isZero_Tor_add_two`
   (`TauCeti/CategoryTheory/Monoidal/Tor.lean` line 66, 81) and `TauCeti.cyclicBockstein`
   (`TauCeti/RepresentationTheory/Homological/ContCohomology/Bockstein/AllDegrees.lean` line 114).
   `HomologicalComplex.homologyKunnethShortComplex_shortExact` (`Kunneth/Sequence.lean` line 729) has no
   hypothesis on the ring: it asks that `Z_q(L)` and `L_q/Z_q(L)` be projective, for `K` arbitrary.

   **Repair.**

   1. Add to *From Tau Ceti*:

      > - `CategoryTheory.ShortComplex.ShortExact.torOneIsoKernel` and
      >   `CategoryTheory.ShortComplex.ShortExact.isZero_Tor_add_two`
      >   (`TauCeti/CategoryTheory/Monoidal/Tor.lean`): for a short exact sequence `0 → P₁ → P₀ → M → 0`
      >   with `P₁`, `P₀` projective, `Tor_1(X, M) ≅ ker(X ⊗ P₁ → X ⊗ P₀)` and `Tor_n(X, M) = 0` for
      >   `n ≥ 2`, in the second variable. Compared in the Check *Resolutions of length one* of 4.1, which
      >   presents the first variable.
      > - `TauCeti.cyclicBockstein`
      >   (`TauCeti/RepresentationTheory/Homological/ContCohomology/Bockstein/AllDegrees.lean`): for a
      >   compact group `G` and `n ≠ 0`, the connecting map of `0 → ℤ/n → ℤ/n² → ℤ/n → 0` on continuous
      >   cohomology with trivial coefficients. Compared in the Examples of Layer 6.

   2. Line 89–90: replace "the Künneth short exact sequence over rings whose modules have projective
      dimension at most one" by "the Künneth short exact sequence for `ℕ`-indexed chain complexes `K`, `L`
      of modules over a commutative ring such that the cycles `Z_q(L)` and the quotients `L_q/Z_q(L)` are
      projective".
   3. Line 1521–1523: replace the Check by "For `ℕ`-indexed chain complexes placed in non-positive degrees
      with `Z_q(L)` and `L_q/Z_q(L)` projective (every complex `L` of projectives over a ring of global
      dimension at most one), `L` is a complex of projectives, `K ⊗ L` computes `K ⊗^L L`, and the
      two-column sequence is Tau Ceti's `HomologicalComplex.homologyKunnethShortComplex_shortExact`."
   4. Line 1817: replace the sentence by "Tau Ceti's `TauCeti.cyclicBockstein` is `d_1` of 6.1 for `A = ℤ`,
      `f = n` and `M` the continuous cochains of a compact group with values in `ℤ`, whose reduction modulo
      `n` is the continuous cochains with values in `ℤ/n`."

   Tested: for `G` trivial and `n = 2`, `M = ℤ[0]`, `d_1 = 0` (6.1's second Check) and `cyclicBockstein`
   from degree `0` is the connecting map `ℤ/2 → H¹ = 0`, also `0`.

3. **F03** (P3) 4.2(a) asserts naturality in `M` for a sequence whose first page depends on the resolution

   **Location.** `packages/SpectralSequencesAndConvergencePartII/README.md` line 1421–1423: "converging
   strongly, with `E₂^{p,q} = 0` for `p > 0`, natural in `K` and `M`. It is `″E` of the double complex
   `K ⊠ P`".

   **Claim.** The sequence, defined from a chosen projective resolution `P` of `M`, is natural in `M`.

   **Witness.** `″E_1^{p,q} = H^q(K) ⊗ P^p` (line 1424) depends on `P`: for `M = ℤ/2` over `ℤ`, `K = ℤ[0]`,
   the resolutions `ℤ →(×2) ℤ` and `ℤ² → ℤ²`, `(x, y) ↦ (2x, y)`, give `″E_1^{−1,0} = ℤ` and `ℤ²`. 4.3
   (line 1485) says "from page `2`" for the same construction.

   **Repair.** Replace "natural in `K` and `M`" by: "natural in `K`; from page `2` on it does not depend
   on `P` and is natural in `M` (a map of resolutions over a map of `M` induces a map of double complexes,
   and homotopic maps of resolutions induce the same map on `″E_2^{p,q} = H^p(H^q(K) ⊗ P^•)`)".

   Tested on the witness: both resolutions give `″E_2^{−1,0} = Tor_1(ℤ, ℤ/2) = 0` and
   `″E_2^{0,0} = ℤ/2`, and the comparison map is the identity on page `2`.

Three findings: one P2 and two P3. No statement of `Suggested.lean` or of the README was found false.
The whole README (1871 lines) and the whole `Suggested.lean` (234 lines) were read.

## The adversarial pass: computed values

`Suggested.lean` (13 elaborated signatures in the brief's `signatures.md`, 11 declarations; all binders
explicit, no section variable, none lost; nothing changed, so no new `#check` run was needed).

| Statement | Instances tried | Values computed | Result | Change |
| --- | --- | --- | --- | --- |
| `acyclic_total_of_finite_antidiagonals` | `ℤ →(id) ℤ` horizontal; zero complex; column-sign complex `K^{1,0} →(×2) K^{1,1}` (columns not exact) | total `ℤ →(1) ℤ`: `H = 0`; `0`; total `ℤ →(−2) ℤ`, `H² = ℤ/2 ≠ 0`, hypothesis fails | true | none |
| `acyclic_total_of_bounded`, column disjunct | dual staircase (columns exact, `p ≥ 0`, not bounded above in `p`) | `Tot^⊕`: `y_p = (−1)^p x_p + x_{p−1}`, functional `(1, −1, −1, 1, …)` kills the image, `H¹ = ℤ`; hypothesis `∃ b, ∀ p > b` fails, as it must | true; direction of the bound is the right one | none |
| `acyclic_total_of_bounded`, row disjunct | staircase (rows exact, `q ≤ 0`) | `x ↦ (x_p − (−1)^p x_{p+1})` is triangular on `⊕`: bijective, `H⁰ = H¹ = 0` | true | none |
| same, general argument | cycle with components in columns `p₀ ≤ p ≤ b(n)` | lowest component is `d₂`-closed, subtract `d y`; finitely many steps since `p ≤ b(n)`; colimit over the lower cut-off needs exact `ℕ`-colimits | true as typed | none |
| `quasiIso_total_map_of_finite_antidiagonals` | identity; projection of the staircase to its column `0` | cone columns exact, cone antidiagonal `n` is `K`'s `n + 1` with `L`'s `n`: finite; staircase projection: `H⁰` is `0 → ℤ` on `Tot^⊕`, and antidiagonal `0` of the staircase holds every `D_p`, so `hK` fails | true | none |
| `quasiIso_total_map_of_bounded` | staircase projection, column disjunct | `K^{p,−p} ≠ 0` for all `p ≥ 0`: no `b`; conclusion false (`0` against `ℤ`), hypothesis fails | true | none |
| `exists_injectiveResolution_horseshoe` | `0 → ℤ →(2) ℤ → ℤ/2 → 0`, `I₁ = (ℚ → ℚ/ℤ)`, `I₃ = (ℚ/ℤ →(2) ℚ/ℤ)`; split sequence | middle `ℚ ⊕ ℚ/ℤ → ℚ/ℤ ⊕ ℚ/ℤ` with twisting, `H⁰ = ℤ`; untwisted sum has `H⁰ = ℤ ⊕ ℤ/2`, so the existential is not met by the direct sum alone | true; no injectives needed beyond `I₁`, `I₃` | none |
| `IsRightAcyclic` | `F = Hom(ℤ/2, −)`: `ℚ/ℤ`, `ℤ`; `F = − ⊗ ℤ/2`: `ℤ` | `R¹F(ℚ/ℤ) = 0`; `R¹F(ℤ) = ℤ/2`; `H¹(0 → 0) = 0` so `ℤ` is acyclic for `⊗ ℤ/2` although `R⁰F(ℤ) = 0 ≠ ℤ/2` | definition is the `i > 0` vanishing; README restricts its use to left exact functors | none |
| `exists_rightDerivedFunctorPlus_homology_iso_rightDerived` | `F = − ⊗ ℤ/2`, `A = ℤ`, `n = 0`; `τ = 2` on `Hom(ℤ/2, −)`, `n = 1` | both sides `H⁰(0 → 0) = 0`; both sides `×2 = 0` on `ℤ/2` | true without exactness | none |
| `isIso_rightDerivedFunctorPlusUnit_app_of_isRightAcyclic` | `F = − ⊗ ℤ/2`, `L = ℤ[0]` (not left exact) | unit `ℤ/2[0] → RF(ℤ[0])`, `H⁰ = 0`: not iso; `[PreservesFiniteLimits F]` is in the signature | hypothesis needed and present | none |
| `compositionTrans`, `isIso_compositionTrans_iff` | `F = G = Hom(ℤ/2, −)` at `ℚ/ℤ`; `F = id`; `F = − ⊗ ℤ/2`, `G = id` | `R¹(GF)(ℚ/ℤ) = 0` against `H¹(RG(ℤ/2)) = ℤ/2`, and `F(ℚ/ℤ) = ℤ/2` not acyclic: false ⟺ false; both sides true; both sides true (`RF` on both) | iff holds in both directions; `F` additive suffices | none |
| `nonempty_tor_iso_tor'` | `ℤ/4`, `ℤ/6` over `ℤ`, `n = 0, 1`; the twisted product on `𝔽₂[x,y]/(x²,y²)`-modules | `ker(×6 | ℤ/4) = {0,2}`, `ker(×4 | ℤ/6) = {0,3}`; `Tor_0 = Tor'_0 = k` while `X ⋆ k = soc(X)` has dimension `2` | balance holds; the statement claims no `Tor_0 = ⊗` | none |

README conventions, targets and Checks (values recomputed).

| Statement | Instances tried | Values computed | Result | Change |
| --- | --- | --- | --- | --- |
| Total sign `d₁ + (−1)^p d₂` | unit square | `1 ↦ (1, 1)`; `K^{1,0} → K^{1,1}` by `−1`, `K^{0,1} → K^{1,1}` by `+1`; `d² = 0`; pin: `ε₁ = 1`, `ε₂(p, q) = (−1)^p` (`ComplexShapeSigns.lean` line 158–159) | agrees | none |
| Classical indexing `(p, q) ↦ (2p + q + 1, −p − 1)`, page `r + 1` | `(0,0)`, `(1,0)` | `(1, −1)`, `(3, −2)`; `fil = −b − 1 = p`, `deg = a + b = p + q`; same as DGFloer Layer 1 item 3 on main | agrees | none |
| `d_1 = +2` for the stupid filtration | `ℤ →(2) ℤ` | lift `1`, `d = 2` in `gr¹` | agrees with the base design's witness | none |
| Opposite complexes | `ℤ →(2) ℤ` in degrees `−1, 0` | `H⁰(K°) = op ℤ/2`, `H¹(K°) = 0` | agrees | none |
| 1.1 staircase | — | kernel on `∏`: `x_{p+1} = (−1)^p x_p`: `(1,1,−1,−1,1,1,…)`; `H⁰(Tot^Π) = ℤ`, `H⁰(Tot^⊕) = 0` | agrees | none |
| 1.2 `″d_1` sign | column-sign complex | flip: `+2`; Stacks Lemma 25.1(4): `(−1)^1 · 2 = −2`; `σ(1,0) = 1`, `σ(1,1) = −1` intertwine | agrees | none |
| 1.2 last Check | the `x_m, y_m, V` complex | `a_{j+1} = b_j − (−1)^j a_j`; `y_0 = d(1,1,−1,−1,…)`; `H⁰(Tot^Π) = V`, `E_∞^{0,0} = k y_0 ⊕ V`; on `⊕` the functional `(1,1,−1,−1,…)` gives cokernel `k y_0` | agrees; 1.3(c) does not apply (`p` unbounded below) | none |
| 1.3(a) stabilisation bound | a `d_r` leaving `(p, n − p)` | nonzero only if columns `p, …, p + r − 1` meet antidiagonal `n`: `r ≤` number of such columns | bound holds | none |
| 1.3(a) weak Serre Check | `ℚ → ℚ/ℤ`, class of `ℚ`-vector spaces | `′E_1^{0,0} = ℚ`, `′E_1^{1,0} = ℚ/ℤ`, `′E_2^{0,0} = ℤ = H⁰` | agrees | none |
| 1.3(b), (c) half-planes | upper, left, lower, right | `q ≥ a ⇒ p ≤ n − a`; `q ≤ b ⇒ p ≥ n − b`; flips | the four cases named are instances | none |
| 1.5 dictionary with Weibel | his four cases | `Tot^Π`/upper/columns ↦ lower, `p ≥ n − b`; `Tot^Π`/right/rows ↦ left, `q ≥ n − b`; `Tot^⊕`/upper/rows ↦ lower, `q ≤ b`; `Tot^⊕`/right/columns ↦ left, `p ≤ b` | all four among the eight | none |
| 1.5 augmented forms | `0 → M → A_0 → ⋯` on `Tot^⊕`; `⋯ → A_0 → M → 0` on `Tot^Π` | rows exact, `q ≤ n + 1`; rows exact, `q ≥ n − 1` | match Stacks Lemmas 26.1, 26.4 | none |
| 2.1(b) third Check | `φ(u, v) = (u + h v, v)`, `h = id` in degree `0` only | `φ d φ^{−1}(u, v) = (2u − 2v, 2v)` | agrees | none |
| 2.3 third Check | columns `ℚ → ℚ/ℤ`, `d₁ = 2` | `H_I¹ = 0` in both rows, does not resolve `ℤ/2` | agrees | none |
| 2.4, 2.5 Checks | `Hom(ℤ/2, −)`, `K = (ℤ →(2) ℤ)` | `′E_1^{0,1} = ′E_1^{1,1} = ℤ/2`, `′d_1 = 0`; `″E_2^{0,1} = ″E_2^{1,1} = ℤ/2`; abutment `ℤ/2` in degrees `1, 2` | agree | none |
| 2.5 F-acyclic variant | rows `0 → Z → L → B → 0`, `0 → B → Z → H → 0` of `F`-acyclics | `R¹F(Z) = R¹F(B) = 0` keeps both exact under `F` | `F` commutes with cycles, boundaries, cohomology | none |
| 2.6 index witness | `K = (ℤ →(2) ℤ)`, degrees `−1, 0`, `− ⊗ ℤ/2` | `E¹_{0,0} = E¹_{1,0} = ℤ/2`, `d¹ = 0`, `L_0 = L_1 = ℤ/2` | agrees | none |
| 3.3 five-term | coextension example | `0 → 0 → ℤ/2 → ℤ/2 → 0 → ℤ/2` | exact | R01 (edge maps) |
| 3.4 Checks | `ℤ → ℤ/2`; `− ⊗ ℤ/2` then `Hom(−, ℤ)` | `E₂^{0,q} = ℤ/2`, `q = 0, 1`; `Hom(− ⊗ ℤ/2, ℤ) = 0` against `Ext¹(ℤ/2, ℤ) = ℤ/2` | agree | none |
| 4.2(a) two columns | `C = (ℤ →(2) ℤ)`, `M = ℤ/2`, `n = −1` | `0 → 0 → ℤ/2 → Tor_1(ℤ/2, ℤ/2) → 0` | `H^{n+1}` in the Tor term is right | none |
| 4.2(c) two columns | same `C`, `M = ℤ`, `n = 1` | `Ext¹(ℤ/2, ℤ) = ℤ/2 = H¹(Hom(C, ℤ))` | agrees with Hatcher Theorem 3.2 after `K^{−n} = C_n` | none |
| 4.3 finiteness | `H^i(K) = 0` for `i > a`, `H^j(L) = 0` for `j > b` | `n ≤ q ≤ a + b`, `q − b ≤ i ≤ a`: finitely many terms | "finite filtrations" holds | none |
| 4.3 Check | `C ⊗ C`, `C = (ℤ →(2) ℤ)` | `e⊗e ↦ (−2, 2)`, `(a, b) ↦ 2a + 2b`; `H^{−2} = 0`, `H^{−1} = H⁰ = ℤ/2` | agrees | none |
| 4.4(a) Check | `ℤ → ℤ/4`, `M = N = ℤ/2` | total degree `1`: `E²_{1,0}` survives, so `d² : E²_{2,0} → E²_{0,1}` is an isomorphism; degree `n ≥ 2`: both terms die | agrees | none |
| 5.1 `μ_n` | Bockstein couple of `ℤ`; the `ℤ →(4) ℤ` couple | `c = 0`; `k(1) = 2`, `c` odd, `j(c) = 1 ≠ 0`: `μ_1` fails, `d₂(1·1) = 1 ≠ 0`: `μ_0` fails for `φ′` | equivalence at `m = 0` reads false ⟺ false | none |
| 5.2 Check | `𝔽₂[x, y]/(x²)`, `dx = y` | `d₁(x y) = y² = d₁(x) y` | agrees | none |
| 5.3 Leibniz rules | `x ∈ K^{p,q}`, `y ∈ L^{p′,q′}` | from `d(xy) = d(x)y + (−1)^{p+q} x d(y)`: `d₂(xy) = (−1)^{p′} d₂(x)y + (−1)^q x d₂(y)`; flip sign `(−1)^{pq′+p′q}` | agree | none |
| 6.2 higher sequences | `ℤ →(p^r) ℤ`; `⊕_k (ℤ →(p^k) ℤ)`; `ℤ → ℤ[1/p]` | `E_s⁰ = E_s¹ = ℤ/p` for `s ≤ r`, `0` after; `E_r⁰ = ⊕_{k ≥ r} ℤ/p`, `E_∞⁰ = 0`; `E_r⁰ = ℤ/p` for all `r`, `H⁰[1/p] = 0` | agree | none |
| 6.2 criterion | `H^{n+1}[f^∞] = H^{n+1}[f^b]` | `f^r y ∈ [f] ⇒ y ∈ [f^{r+1}] = [f^b] ⇒ f^r y = 0` for `r ≥ b` | criterion holds under bounded torsion | none |

## Dependency check

```text
depcheck: 242 roadmaps, 2195 edges, 0 problem(s)
```

No UPWARD, CYCLE or `moved:` line. The merge order has SpectralSequencesAndConvergencePartII at line 63,
after SpectralSequencesAndConvergence (18), StableHomotopyKTheory (17) and ArithmeticGaloisDuality (62).

## Verified sound

- **Declarations read:** 11 of 11 in `Suggested.lean` (9 theorems, 2 definitions), each against its
  README statement; binders, instances and universes agree with `signatures.md`. Form: one module
  docstring, a single `import Mathlib`, the namespace, layer comments in README order, `theorem` only,
  no `set_option`, no sorry'd data, no `#eval`.
- **Headline theorems.** Statable and stated: 1.4 and 1.5 for `Tot^⊕`, 2.1(a), 2.2(i), 2.2(v), 3.1, 4.1.
  Not statable and named in the module docstring with what each lacks: the product totalisation, the two
  spectral sequences and everything built on them (1.2, 1.3, 2.4–2.6, 3.2–3.4, 4.2–4.4), Cartan–Eilenberg
  resolutions (2.3), Layers 5 and 6. No statable headline was found absent.
- **Padding probe:** none of the 9 theorems follows from one pinned lemma. `rightDerivedFunctorPlus`
  occurs in two Mathlib files and no Tau Ceti file; the unit is an isomorphism at the pin only for
  complexes of injectives (`RightDerivedFunctorPlus.lean` line 109); `Tor ≅ Tor'` is recorded as open in
  `Mathlib/CategoryTheory/Monoidal/Tor.lean` line 18–21 and is not in
  `TauCeti/CategoryTheory/Monoidal/Tor.lean` or `TauCeti/Algebra/Category/ModuleCat/Monoidal/Tor.lean`;
  the pinned total-complex comparison is for `ℕ × ℕ` only (`TauCeti/Algebra/Homology/TotalComplex.lean`
  line 580, 596).
- **Targets read:** all 24 (1.1–1.5, 2.1–2.6, 3.1–3.4, 4.1–4.4, 5.1–5.3, 6.1–6.2), every item and route.
- **Pinned declarations:** every backticked library name of the README (96 qualified names and the
  unqualified class names) resolved at the pins by grep, with the files the README gives; the ambiguous ones opened (`CochainComplex.IsKInjective.Qh_map_bijective` in
  `DerivedCategory/KInjective.lean` line 42, `CochainComplex.Plus.exists_quasiIso_injective` in
  `DerivabilityStructureInjectives.lean` line 61, `InjectiveResolution.extEquivCohomologyClass` in
  `Abelian/Injective/Ext.lean` line 40, `descHomotopy` in `Abelian/Injective/Resolution.lean` line 170,
  `Adjunction.map_injective` in `Preadditive/Injective/Basic.lean` line 280, the `AB5` and `AB4Star`
  instances of `ModuleCat.{u} R`).
- **Locators verified against the text:** 48 — stacks-012K 11 (Definitions 18.3, 24.9; §25 opening;
  Lemmas 25.1, 25.3, its item (4), 25.4; §26 opening; Lemmas 26.1, 26.4; the product total complex in
  the proof of 26.3), stacks-05QI 14 (Lemmas 16.1, 16.4, 16.6, 16.7; Definition 16.2; Lemmas 18.6, 18.9
  and the second step of its proof; Definition 21.1; Lemmas 21.2, 21.3 and its split-rows step;
  Lemmas 22.1, 22.2; of Lemma 16.3 only the opening and the end of the proof were read),
  stacks-more-algebra 7 (Examples 63.1, 63.2; Lemma 65.4; Example 65.5; §69; §97; footnote 18),
  grothendieck1957 10 ((2.4.1), (2.4.2), the footnote on the total differential, the F-acyclic variant,
  the left-derived and contravariant remark, Théorème 2.4.1, Remarques 1–3, the opening of
  Proposition 2.5.4, §3.7 and the opening of §3.8), may-primer 3 (Example 2.3, the conditions `μ_n` with Proposition 4.1 and Corollary 4.2,
  Example 4.3 with the filtered pairings), hatcher-at 2, douady1959 1.
- **Checks tested:** all 97 Checks read, and every one that states a value recomputed (the table
  above shows the discriminating ones); none false or vacuous. Every subsection has at least three.
- **Sibling citations checked (14):** DerivedModuleAlgebra §S.1 and §0.2 (main; the `F_p ⊗^L F_p` Check
  is there), KhovanovHomology §K5 (main), AlgebraicTopology §5.1 (main, states the Künneth spectral
  sequence), DGFloer Layer 1 item 2 (main, the multiplicative Serre sequence at line 567–619),
  SchemeAndStackFoundations §§2.2, 2.7, 2.15 with the four names (main), TopologicalSheafCohomology §1.4
  (main), StableHomotopyKTheory §7.22 (main; pages and degrees as cited), ArithmeticGaloisDuality §D7.1
  (open head; hypotheses as cited), SchemeKTheoryOperations §6.7, ArithmeticLocallySymmetricSpaces
  ALS.1.7, ArithmeticStatisticsPartVIII §5.16 (open heads). The base's Checks that the README names
  (§3.2, §5.1 witness, §6.2) are in `packages/SpectralSequencesAndConvergence/design/README.md`.
- **Ownership by object:** `roadmaps grep` for Cartan–Eilenberg resolutions, Bockstein spectral
  sequence, acyclic assembly, Leray's acyclicity lemma, balancing of Tor, product totalisation, Massey's
  conditions and the 11 Lean names: no second owner on main or at an open head; the instances found
  (ArithmeticGaloisDuality §D7.1, ALS.1.7, AlgebraicTopology §5.1, SchemeKTheoryOperations §6.7) are
  named in the README as instances. No Lean name of `Suggested.lean` is declared by another roadmap.
- **Gaps:** the 19 slugs of `design/plan.json` and the 19 contracts of the README agree, each with
  supplier and section; the sections exist with those numbers in the base's design; none asks for what
  Mathlib, Tau Ceti or a roadmap on main provides (StableHomotopyKTheory §7.22 gives pages, not the
  carrier; DGFloer Layer 1 item 3 gives the module case of §§5.4, 7.5 only).
- **Policy:** the pull request changes only files of the package folder (6 files); no pull-request
  number or process narrative in the README or docstrings; every target has a locator.
- **Wording:** 14 passages set beside their sources (the 9 below and 5 further: the definition of 2.3
  against stacks-05QI line 3621–3629, `μ_n` of 5.1 against may-primer line 249–256, the route of 5.1
  against line 269–279, the docstring of `isIso_compositionTrans_iff` against stacks-05QI line
  3705–3711, 6.1 against stacks-more-algebra line 12960–12975); the longest shared run is a formula
  with its quantified letters, which the mathematics forces.

Source independence: 14 passages compared with 5 sources, none shared; largest share stacks-05QI, 16 of 88 locators; contents compared with stacks-05QI (§§16, 18, 19, 21, 22 against Layers 2–3: 2.1 ↔ §18, 2.2 ↔ §16, 2.3–2.5 ↔ §21, 3.1–3.2 ↔ §22, not in the source's order, and Layers 1, 4, 5, 6 have no counterpart there): independent.

## Not verifiable

- weibel1994, mccleary2001, cartan-eilenberg1956, massey1954 are settled as uncertified: their 24
  locators were not read. Two of them rest on the uncertified text alone: 5.3 (cartan-eilenberg1956
  Ch. XV for pairings of double complexes) and the lifting item of 2.3 (weibel1994 Lemma 5.7.2,
  cartan-eilenberg1956 Ch. XVII §1); whether Lemma 5.7.2 is the lifting statement or the existence
  statement could not be checked.
- SpectralSequencesAndConvergence has no README on main or in an open roadmap pull request; the 19
  gaps were compared with its design in `packages/SpectralSequencesAndConvergence/design/README.md` only.
- CohomologyOfGroups, named under *Downstream consumers*, has no README on main or at an open head.
- Ownership against the open pull requests whose files the brief does not give (230 of 466) was checked
  only through `roadmaps grep`, not by reading them.
- No Lean was run: the elaborated signatures are those of the brief's `signatures.md`.

## Source issues

- none

## For the human reviewers

- **Scope.** The base roadmap SpectralSequencesAndConvergence is not on main and has no open roadmap
  pull request; this Part II reaches it only through 19 declared gaps
  (`packages/SpectralSequencesAndConvergencePartII/design/plan.json`).
- **Scope.** Layer 4 states Tor forms over commutative rings only (README line 108–111, 193–195);
  weibel1994 §5.6 and cartan-eilenberg1956 Ch. XVI, cited for 4.4, treat arbitrary rings.
- **Licence.** `sources.toml` records grothendieck1957 as `licence_class = "operator-local"` with a
  `resolution` field holding an issue link.
- **Not tested.** Four sources (weibel1994, mccleary2001, cartan-eilenberg1956, massey1954), 24 of 88
  locators, are uncertified; wording and arrangement were not compared with them.

<!-- tauceti-roadmap-review {"agent": "claude", "head": "956602184f82d51a03c50d3bb91d52a26198bf20", "job": "RT-SpectralSequencesAndConvergencePartII~1b", "model": "fable", "worker": "chris-x29"} -->
