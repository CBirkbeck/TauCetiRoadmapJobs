# Review of BallQuotientsAndComplexHyperbolicLattices (pull request #2425 at eeb54a8)

**Verdict:** needs changes

## R01 (P2) — ShimuraVarieties §P.6 is credited with two statements it does not make

**Location:** `TauCetiRoadmap/BallQuotientsAndComplexHyperbolicLattices/README.md:140`, "§P.6 (`TauCeti.Shimura.finite_analytic_quotient`: … normality of the quotient of a normal space, and compatibility with finite algebraic quotients)"; consumed at `README.md:727` (§9.5): "the analytification of S*_Γ′/F is the analytic quotient by ShimuraVarieties §P.6".

**Claim:** At its head, ShimuraVarieties §P.6 states neither fact. So the identification `(S*_Γ′/F)^an = (S*_Γ′)^an/F` used in §9.5 (and through it in §§10.4(b) and 10.6) has no supplier.

**Witness:** ShimuraVarieties §P.6 at its open head, whole section: `finite_analytic_quotient` builds `Z → Z/H` with `O = (q_*O_Z)^H`, local invariant presentations, the universal property, open restriction and gluing, and has three Checks. It says nothing about normality or algebraic quotients.

**Repair:** (a) At line 140, replace the parenthesis with "(`TauCeti.Shimura.finite_analytic_quotient`: the quotient of a Hausdorff complex analytic space by a finite holomorphic group action, with invariant structure sheaf, local invariant presentations and the invariant-map universal property)".
(b) Add to §7.3: "For a quasi-projective variety Z over ℂ with an algebraic action of a finite group F and quotient q: Z → Z/F (ShimuraVarieties §3.4a), (Z/F)^an is the analytic quotient Z^an/F of ShimuraVarieties §P.6, compatibly with q^an. The map q^an is finite and its fibres are the F-orbits. `(q_*O_Z)^an = q^an_*O_(Z^an)` (ComplexComparisonPartII §C1.9 `properSchemeGagaPushforward`, q being finite). F-invariants, a finite limit, commute with the flat `O_(Z/F) → O_((Z/F)^an)` (§C-1.2 `completedAnalyticStalkComparison`)."
(c) In §7.1, add "normality of U_x/Γ_x: invariants of a normal domain under a finite group are normal" to the route.
(d) In §9.5, cite (b) in place of §P.6.

## R02 (P3) — the description claims the torsion-free and neat theorems for every lattice

**Location:** pull-request description, summary block, "Approach and generality": "Everything holds for every n ≥ 1 and every lattice, arithmetic or not, cocompact or not, with or without torsion."

**Claim:** At the head, Layer 8 and §§9.1–9.4 are for neat lattices only, and §§10.1–10.3 and 10.4(a) for torsion-free lattices only. The extension theorem is false when Γ has torsion.

**Witness:** `README.md:613`: "Throughout Layer 8, Γ is a neat lattice". `README.md:772` (§10.2 Check): z ↦ exp(1/z) into PSL(2,ℤ)\ℍ ≅ ℂ does not extend to Δ → ℙ¹ = S*_Γ.

**Repair:** Replace the sentence with: "The lattice theory, the analytic quotient, the minimal compactification S*_Γ, the uniqueness theorems of §§10.4(b)–10.5 and the theory of Γ-special subvarieties hold for every n ≥ 1 and every lattice, arithmetic or not, cocompact or not, with or without torsion. The toroidal compactification is built for neat lattices. The extension theorem and Borel algebraicity are proved for torsion-free lattices, the only ones for which they hold."

## R03 (P3) — the description's dependency paragraph announces a list it never gives

**Location:** pull-request description: "Dependencies (the roadmaps the README cites by name and section, and what they in turn need; the Lean imports none of them). … everything else named in the README is a consumer, not a prerequisite."

**Claim:** No list follows the announcement. ShimuraCompactifications is named in the README but is neither a supplier nor a consumer, which contradicts the paragraph's last sentence.

**Witness:** `README.md:965`: "ShimuraCompactifications itself does not consume this roadmap"; `README.md:19`: "this roadmap states no comparison of the two".

**Repair:** Replace the paragraph with: "Suppliers on main: RepresentationTheory/LieGroups, FuchsianOrbifolds, RiemannianGeometry (with HopfRinow), ConformalMapping, ComplexKahlerGeometry, ComplexManifolds, ComplexTori, AbelianSchemesAndArithmeticModuli, VonNeumannAlgebras, ComplexComparisonPartII, ReductiveGroups, AdelicAlgebraicGroups, AlgebraicModuliForArithmeticGeometry, SchemeAndStackFoundations. Suppliers in open pull requests: RealSemisimpleLieGroups, ShimuraVarieties, PELModuli, ShimuraData. GeometricTopology, ArithmeticLocallySymmetricSpaces and ShimuraCompactifications are named only to delimit scope. The roadmaps under Downstream consumers are consumers."

## Verified sound

| Statement | Instance | Roadmap side | Computed / source side | Result |
|---|---|---|---|---|
| §1.5 N ≅ real Heisenberg group (n = 2) | (p+iq, t) ↦ (p, q, −t/4 + pq/2) | homomorphism | image of the product has z-coordinate z + z′ + pq′, which is Tau Ceti's law `z + z' + x*y'` (Heisenberg.lean:55) | holds |
| §1.6 PU(1,1) ≅ PSL(2,ℝ); Mok2012 l.21–23 | [diag(1,−1)], w ↦ −w | C(−w) = −1/C(w); order 2 | i(1−w)/(1+w) = −1/C(w); [[0,−1],[1,0]] has order 4 in SL₂, 2 in PSL₂; Mok: n = 1 classical | holds |
| §2.5 Schwarz–Pick between balls; Kiernan1972 l.64–65 | (ζ,ζ)/√2 and (ζ/2,ζ/2) | \|Df(0)·1\| = 1 and 1/√2 | \|(1,1)/√2\| = 1, \|(½,½)\| ≈ 0.707; Kiernan (3): holomorphic maps decrease Kobayashi distance | holds |
| §3.3 totally geodesic subvarieties; BaldiUllmo2023 l.496–506 | {w₁=0}∪{w₂=0} ⊂ B²; n = 1 | reducible case excluded; only B | BU: stabiliser of W ≅ PU(1,m)×C, every X_H comes from some W; classification is Goldman's (uncertified) | holds |
| §4.4 Margulis, covering argument | ε = 1/m, products of ≤ m elements of F | each lies in B₁, meeting ≤ m cosets of Λ₀ | strict chain C₀⊊…⊊C_m needs m+1 cosets; S₃ ⊂ U(2): A₃ of index 2 | holds; m₂ ≥ 2 |
| §5.2 discrete ⇔ properly discontinuous; WitteMorris2015 l.18549–18561 | Γ = {1, [diag(1,−1)]}, n = 1 | Γ₀ has 2 elements | `finite_stabilizer'` needs no T2 (ConstMulAction.lean:566); WM B1.3, printed pp. 447–448 | holds |
| §6.3 Selberg route | g = diag(2,−½), R = ℤ[½], 𝔞 = 15R | Λ′ = ⟨g⁴⟩ ⊂ ⟨g²⟩ | g ≡ diag(2,1) mod 3, ≡ diag(2,2) mod 5; 2·(−½) = −1 excludes odd powers | holds |
| §6.3 locators; WitteMorris2015 Thm 4.8.4 l.2972, Rem 4.8.5(2) l.3002–3005 | SL(ℓ,ℤ) proof l.2974–2988 | general field, normal Λ′ claimed as own | WM: SL(ℓ,ℤ) only; l.3445 cites Borel Cor 17.7, Raghunathan 6.11 | holds as stated |
| §8.1–8.2 semi-character, ampleness; Mok2012 Thm 1 l.476–484 | Γ_b = ⟨n_(λ,0), n_(iλ,0)⟩, τ = 4λ² | χ((1+i)λ) = −1; deg L_b⁻¹ = 1 | e^{2πi(−2λ²)/τ} = −1; E′(iλ,λ) = (4/τ)λ² = 1; §A5.3: c₁ = −E | holds |
| §9.1 jets; Mok2012 Thm 2 l.495–514 | genus 2, ℓ = 2; weight (n+1) log\|z\|² | ℓ₀ depends on Γ | deg K² = 4 < 2g+1 = 5; ∫\|z\|^(−2n) dV diverges like ∫dr/r | holds |
| §9.2 extension of L² sections | Γ(2)/{±1}, X^M = ℙ¹ | E = O(1); dim ℓ−2 vanishing on D | O(−2)⊗O(3) = O(1); dim S_2ℓ(Γ(2)) = −(2ℓ−1)+3(ℓ−1) = ℓ−2 | holds |
| §9.6 n = 1; MilneSVI l.1690–1694 | Γ₀(11) | genus 1, two cusps | (−1/11) = (−3/11) = −1, so ν₂ = ν₃ = 0; g = 1 + 12/12 − 2/2 = 1 | holds |
| §10.1 hyperbolic embedding; Kiernan1972 l.57–75, Deng2020 l.61–63 | circle \|q\| = r | length √2π/\|log r\| | 2πr/(√2·r\|log r\|); metric is 2× Kiernan's \|dz\|²/(\|z\|²(log\|z\|²)²), the curvature −2 normalisation | holds |
| §10.4 unique model; MilneSVI Cor 3.16 l.1770–1774 | 𝔸¹ → {y² = x³} | excluded by smoothness | bijective on ℂ-points, not an isomorphism; Milne's proof uses nonsingular varieties | holds |
| §10.5 finite-point compactification; Mok2012 l.11–16 | Γ₀(2); doubled ℙ¹ over Γ(2) | X_Γ ≅ ℂ*; 6 vs 3 points | index 3, ν₂ = 1, ν₃ = 0, 2 cusps, g = 1+¼−¼−1 = 0; doubled cusps not separated | holds |
| §11.1 integral points across isogeny | ρ′(g) = A⁻¹gA, A = diag(2,1) | SL₂(ℤ) ∩ A·SL₂(ℤ)·A⁻¹ = Γ⁰(2) | A[[a,b],[c,d]]A⁻¹ = [[a,2b],[c/2,d]]; index 3 | holds |
| §11.2 cocompact ⇔ ℚ-anisotropic; WitteMorris2015 Prop 5.3.1 l.3909–3911 | SL₂ | SL₂(ℤ) not cocompact | [[1,1],[0,1]] ∈ SL₂(ℤ) unipotent; Godement criterion | holds |
| §11.3 components of X | n = 2 and n = 1, gᴴJg = −J | X = X⁺; two components | \|det g\|² = det(−J)/det J = −1 (n = 2), 1 (n = 1, swap S) | holds |
| §12.1 Γ-special; BaldiUllmo2023 l.49–50, Defs 3.1.6, 3.1.13 | Z = S_Γ; {w₂ = w₁²} | Γ-special with H = G; not totally geodesic | r_W = id; the curve leaves {w₂ = 0} = 𝔹(W_(0,ℂe₁)) | holds |
| §12.3 totally geodesic ⇒ Γ-special; BaldiUllmo2023 Thm 1.3.2 l.151–152 | n = 1 | only Z = S_Γ | BU assumes n > 1 (l.55) and torsion-free (l.102–104); README proves all n and all Γ | holds |
| `biholomorphic_ball_iff` | n = 0; n = 1, (w−½)/(1−w/2) | both sides true; g with tanh t = −½ | B = {0}, PU(1,0) trivial; (w + tanh t)/(1 + w tanh t) | holds; probe fails |
| `margulis_lemma` | n = 0; n = 1, C_m ⊂ K at 0 | ballDist 0 0 = 0; index 1 | √2·arcosh(1) = 0; trivial subgroup has index m, unbounded | holds; probe fails |
| `IsLattice.exists_finset_cuspPoint_orbits` | n = 0; cocompact Γ; PSL(2,ℤ) | F = ∅; F = ∅; F = {b₀} | sphere of ℂ⁰ empty; no parabolics; one cusp class | holds; probe fails |
| `IsLattice.compactSpace_quotient_iff` | PSL(2,ℤ); n = 0 | noncompact ⇔ cusp b₀; both true | T₁ fixes (c,1), on the sphere only c = 0 | holds; probe fails |
| `IsLattice.isFinitelyPresented` | PSL(2,ℤ); [F₂,F₂] ⊂ Γ(2)/{±1} | finitely presented; excluded | C₂ * C₃; normal of infinite index, so infinite covolume, infinite rank | holds; probe fails |
| `selberg_lemma` | ι = ∅; F = 𝔽_q; F = 𝔽_p(t) | vacuous; Λ′ = {1}; Λ′ = Λ | charpoly 1, closure ∅ = ⊥; Λ finite; eigenvalues tᵏ, 1 generate ⟨tᵏ⟩ | holds; probe fails |
| `IsLattice.exists_neat`, `IsNeat` | n = 2, γ = m·a₂, lift diag(½, i, 2) | ⟨γ⟩ not neat, ⟨γ²⟩ neat | 2i·(i/2) = −1; γ^(2k): 1, (−4)^(±k), 16^(±k) | holds; convention = AdelicAlgebraicGroups `IsNeatAut` |
| `IsLattice` | Γ = ⊥; n = 0 | not a lattice; lattice | G noncompact so μ(G) = ∞; one-point G | holds |
| `ballDist` | w = 0, w′ = ½e₁ | (√2/2) log 3 ≈ 0.7768 | √2·arcosh(2/√3) = √2·½ ln 3 = √2 artanh ½ | holds |
| R01 ShimuraVarieties §P.6 | §9.5, contract l.140 | normality; (Z/F)^an = Z^an/F | §P.6 text: construction, invariant presentations, universal property, gluing only | fails |
| R02 description | PSL(2,ℤ), z ↦ exp(1/z) | "everything holds … with torsion" | §10.2 Check: no extension to ℙ¹ | fails |
| R03 description | ShimuraCompactifications | "everything else … is a consumer" | README l.965: does not consume this roadmap | fails |

- Sources: 71 locators read against the cached texts (Mok2012 12, BaldiUllmo2023 17, WitteMorris2015 20, MilneSVI 10, Kiernan1972 4, Deng2020 3, Mostow1980 4, DeligneMostow1986 1). All 15 seeded targets support their statements as written.
- Libraries: 49 Mathlib and 16 Tau Ceti declarations opened at the pins. Every `file:line` in the supplier contracts matches. `Units.instMeasurableSpace` is `comap Units.val` (Mathlib/MeasureTheory/Group/Arithmetic.lean:668), which is what §5.1's Borel argument assumes.
- Cross-roadmap: about 115 cited sections and declared names resolved on main or at the open supplier heads; only §P.6 fails (R01). Both gap slugs appear in `plan.json` and the README. Neither gap is provided by ComplexComparisonPartII, whose README line 2927 explicitly avoids both facts.
- Gate: every check passes. Depcheck: `depcheck: 240 roadmaps, 2252 edges, 0 problem(s)`. Nothing changes outside the folder.
- Lean: `lake env lean` gives 7 `sorry` warnings and nothing else. `#check @` of all 16 declarations matches the README statements, with no lost binder. The probe (`simp`, `rfl`, `infer_instance`, `decide`, `aesop`) closes none of the 7 theorems.
- Overlap check: read RealSemisimpleLieGroups, ArithmeticFuchsianGroups, KleinianGroups, ShimuraVarieties, LieGroupsPartII, FuchsianOrbifolds, AdelicAlgebraicGroups, ConformalMappingPartII; the third list is empty. Shared objects and their owners: U(1,n), PU(1,n), ball, g_𝔹, sub-balls (RealSemisimpleLieGroups §5.7); Baily–Borel compactification and arithmetic Borel extension (ShimuraVarieties §§2.7, 3.1–3.3); n = 1 cusps, quotients and compactification (FuchsianOrbifolds Layers 0–4); arithmetic-lattice predicate and neatness (AdelicAlgebraicGroups §§3.4, 4.3). Each is cited, not restated. Nothing is shared with the other four.
- Source independence: 78 passages compared by hand with 8 sources, plus a scan of README and `Suggested.lean` for 7-word runs shared with all 8 cached texts. Nothing is shared beyond reference titles and phrases of at most 9 words. Largest share: BaldiUllmo2023, 39 of 148 source citations. Contents compared with BaldiUllmo2023 (Sections 1–7) and with Mok2012 (§§1.1–2.3, for Layers 8–9): independent; the Mok-like order of Layers 8–9 is forced by their *Needs:* lines.
- Shape: every numbered subsection has at least 3 Checks, and every layer has Examples and Dependencies. No LaTeX, process words, `lemma` or `set_option`.

## Not verifiable

- Goldman1999 Ch. 3 (§§2.1, 2.3–2.5, 3.2–3.4): uncertified; no legal copy, cited by locator only.
- Raghunathan1972 Thm 6.11, Ch. VIII, Ch. XIII (§§4.4–4.5, 6.1–6.3): uncertified.
- GarlandRaghunathan1970 Thms 0.7, 4.10 (§6.1(2)): waived; checked only as quoted at BaldiUllmo2023 lines 656–658.
- Borel1969 Cor 17.7, Borel1972 Thm A, BailyBorel1966 Thm 10.11, SiuYau1982, Cartan1957, Alperin1987: uncertified; locators not checked.

## Source issues

- **Misprint** in Mok2012 at §1.1, eq. (1), p. 4: the source defines a′·z′ as the bilinear sum of aᵢzᵢ; it should be the sum of conj(aᵢ)zᵢ, otherwise these maps do not preserve the Siegel domain; affects nothing.
- **Gap** in Mok2012 at §1.1, eqs. (5)–(6), p. 5: the source gives every element of Γ ∩ W_b vertical part kτ and a multiplier without a unitary factor; the vertical part is fixed only modulo τ and needs a semi-character factor, possibly −1; affects the proof.
- **Gap** in Mok2012 at Theorem 1, p. 11: the source asserts abelian-variety boundary divisors for every torsion-free lattice; it should assume unipotent cusp stabilisers, as BaldiUllmo2023 line 514 does; affects a stated result.
- **Misprint** in Mok2012 at the proof of the Main Theorem, p. 14: the source writes E as the canonical bundle twisted by the inverse of [D]; it should be twisted by [D], as in the Main Theorem's statement and line 589; affects nothing.
- **Misprint** in MilneSVI at Remark 3.13, p. 39: two items are labelled (c); the second, on the compact case via Kodaira embedding, should be (d); affects nothing.
- **Gap** in BaldiUllmo2023 at Theorem 3.1.12, p. 11: the proof reduces uniqueness of the algebraic structure to a finite-index subgroup without showing that an arbitrary algebraic structure on S_Γ lifts to the cover; it should restrict uniqueness to torsion-free Γ or justify the lift; affects a stated result.

## For the human reviewers

- none
