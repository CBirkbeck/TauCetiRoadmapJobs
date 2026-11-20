# Review of SeibergWittenTheory (pull request #2651 at 83f8b33)

**Verdict:** accepted

**Summary.** Accepted, with no findings. The repairs hold. The headline theorems and every result drawn from Okonek–Teleman, Witten and Booß-Bavnbek–Marcolli–Wang now carry locators, and all 36 of them say what they are cited for. The docstring of `Suggested.lean` states the wall-crossing formula with its range, and so stated it is true. The §4.3 double cover points the right way. Every Check, headline formula and sign convention I recomputed holds. There are four small corrections and two format notes, none blocking: thirteen sections still cite no source; §3.1, §3.3 and §3.3a restate theorems that SpinGeometry §6.1 and IndexTheory §6.3 already state; and §9.4 does not name Mathlib's divided powers. Nothing is left for a human to decide.

## C01 — Thirteen sections still cite no source, and the six citations of Taubes give no theorem, section or page

The headline theorems now carry locators, and so does every result taken from the three readable sources. The sections without one are §§1.2, 1.4, 3.1, 3.3a, 4.1, 4.2, 4.4, 4.5, 5.3, 8.1, 9.2, 9.3 and 11.3. Taubes, *The Seiberg–Witten and Gromov invariants*, is cited by title alone in §§1.3, 4.3, 7.2, 8.2, 11.1 and 11.2. Most of these are constructions or standard analytic steps whose routes the README gives in full, so nothing stated is wrong. Still, a reader cannot compare the larger of them with a published statement: the smooth Banach quotient of §4.5, the relative parameter theorem of §8.1 and the family index theorem over the Picard torus of §9.3.

A published statement with its theorem and page at each of these would close the gap, cited by locator alone where the text is paywalled.

## C02 — Three bullets of §3.1 and the compact-support symbol of §3.3 are SpinGeometry §6.1's theorems, listed here as targets

SpinGeometry §6.1 on main already proves several of these facts for every Hermitian Clifford module whose connection is compatible with the Levi-Civita connection and whose grading is parallel (`TauCetiRoadmap/SpinGeometry/README.md` lines 2341, 2374–2383; §6.6, lines 2574–2576, gives the compact-support class of that symbol triple):
- the Leibniz rule (line 408 here);
- the formal adjoint of D⁺ with its H¹ domains (line 410);
- the geometric and Fourier symbols joined by the phase homotopy (lines 411–413);
- the chiral symbol triple of §3.3 (line 436).

By §1.3, (W, c, ∇_A) is such a module. Listed here without that attribution, they invite a second proof.

Saying that these bullets follow by instantiating SpinGeometry §6.1 would leave D_(A+a) = D_A + c(a)/2, the gauge covariance and the comparison with the Spinᶜ Thom character as this roadmap's own targets.

## C03 — §3.3a proves again that the Euler class is not a zero divisor for Spin(4) × U(1), which IndexTheory §6.3 already verifies

§3.3a (lines 464–467) asks to "prove that the real tangent Euler class restricts to the nonzero root product x₁x₂, that x₁x₂ is not a zero divisor there" for SU(2)₊ × SU(2)₋ × U(1). IndexTheory §6.3 on main verifies the same non-zero-divisor hypothesis for Spin(2ℓ) × U(k) through the torus injection and the Euler-root product (`TauCetiRoadmap/IndexTheory/README.md` lines 1304–1307). At ℓ = 2, k = 1 that is this group acting on ℝ⁴. The section already calls itself an application of IndexTheory §§6.2–6.3.

Citing §6.3 for this step would leave here only what is new: the rational isomorphism from B(Spin(4) × U(1)) to BSpinᶜ(4), and the half-spin characters z ± a₊, z ± a₋.

## C04 — §9.4 builds integral divided powers without naming Mathlib's `DividedPowers`, and the description says the library has none

Mathlib at the pin has `DividedPowers`, a divided-power structure on an ideal of a commutative ring (`Mathlib/RingTheory/DividedPowers/Basic.lean` line 77). The even-degree integral cohomology of the torus is a commutative ring. The construction of u^k/k! in §9.4 (lines 1195–1199) is a divided-power structure on its positive-degree ideal. The README would name `DividedPowers` as the structure this instantiates, or say why it is not used.

In the description, "the library has none of the following at the pins: … divided powers" would read "no divided-power structure on the cohomology of a torus".

## N01 — Several sentences still say what the route does not do, and one cites a work the References do not list

Three such sentences are gone. Others remain:
- line 594 ("no continuous global selector is claimed");
- line 625;
- lines 714–716 (Aronszajn's theorem);
- line 963;
- lines 1246–1248;
- lines 1258–1260;
- lines 1327–1329, which mention "a positive chamber of Baldridge", a work the References do not list.

Dropping these clauses, or citing Baldridge, is optional.

## N02 — §1.3 uses the Levi-Civita connection without naming Mathlib's `CovariantDerivative.leviCivitaConnection`

The connection exists at the pin (`Mathlib/Geometry/Manifold/VectorBundle/CovariantDerivative/LeviCivita.lean` line 360), and SpinGeometry §6.1 cites it. The *Needs:* line of §1.3 (lines 207–209) would name it.

## Earlier findings

- R01 (no locators): partly repaired. The headlines and every result taken from the three readable sources are now located, for example line 766 ("Okonek and Teleman, Proposition 4 i), p. 4, for the properness of the projection to the parameters"). The rest is C01.
- R02 (docstring range): repaired. `Suggested.lean` lines 21–23 add "`d ≥ 0`, `0 ≤ r ≤ min(b₁, d)` and `r ≡ d ≡ b₁ mod 2`", and say that outside this range both invariants vanish. That holds, since b₂⁺ = 1 forces d = b₁ + 2δ − 2 ≡ b₁.
- R03 (§4.3 double cover): repaired. Lines 614–615 now read "a circle that the quotient here double covers".
- C01 (old numbering): repaired, lines 68–69.
- C02 (smooth compact Spin): repaired. See lines 138–146, 208–209 and 1549–1555, and the description's list of what the library lacks.
- N01 (§11.2 before §10.4): repaired, lines 65–66.
- N02 (negations): partly repaired; see N01 above.
- Question on the FourManifolds carrier: answered at lines 126–128. FourManifolds §4.1 on main defines Spinᶜ(n) as the same quotient of the native Spin group (its line 1863), which is how Tau Ceti's `CliffordAlgebra.spinCGroup` is built.

## Verified sound

| Target | Instances tried | Values computed (each side) | Result | Change |
|---|---|---|---|---|
| §1.3 Spinᶜ connections | u = e^(iθ), a = −2u⁻¹du | ∇_(A+a)(uψ) = du ψ + u∇ψ − du ψ = u∇ψ; with ∇_(A+a) = ∇_A + a the action would be A − u⁻¹du | holds; Taubes unreadable | none |
| §2.2 Q₀ | ψ = (1, 0); ψ and iψ | diag(½, −½), trace 0; variant ψψ* − \|ψ\|²Id has trace −1; B(ψ, iψ) = 0, variant 2iψψ* | holds; QuadraticEnd.lean 70, 86, 325 | none |
| §3.1 Dirac symbols | ξ ≠ 0; u = e^(iθ) | c(ξ)(−c(ξ)/\|ξ\|²) = 1, variant −1; D_(Aᵘ)(uψ) = c(du)ψ + uDψ − c(du)ψ = uDψ | holds; three bullets are SpinGeometry §6.1's | C02 |
| §3.3a Spinᶜ(4) comparison | torus a₊, a₋, z | e^z(2cosh a₊ − 2cosh a₋) = 4e^z sinh(x₁/2) sinh(x₂/2); degree four l²/8 − p₁/24 | holds; non-zero-divisor step in IndexTheory §6.3 | C03 |
| §4.3 Coulomb gauge | S¹ × S³, u = e^(iθ) | d*(a − 2dξ) = 0; shift −4πiα; ℝ/4πℤ → ℝ/2πℤ has degree 2 | holds | none |
| §4.4 slices | ξ = it; \|ψ\| ≡ ε | d₀*d₀ξ = 4Δξ + \|ψ\|²ξ, via Re⟨itψ, φ⟩ = t Im⟨ψ, φ⟩; lowest eigenvalue ε² → 0 | holds; no locator | C01 |
| §4.5 quotient | (A, 0); ψ ≢ 0; n ∈ ℤ^b | stabilizers S¹ and {1}; ∏u_j^(n_j) moves h by −4πiΣn_jα_j, t ↦ t − n, coexact part kept | holds; no locator | C01 |
| §6.1 cokernel elimination | Fock vacuum | c(e_i)ψ ∝ ε₁, iε₁, ε₂, iε₂, a real basis of W⁻; OkonekTeleman1996 line 164 proves submersion | holds | none |
| §7.2 charge-one line | phase cover; (ψ, w) ∼ (cψ, cw) | a_j(p·z) = z⁻¹a_j(p); line = Hom(ℂψ, ℂ) = O(1); OkonekTeleman1996 line 228: c₁ is u | holds | none |
| §7.3 slant comparisons | fibre at (y, [A, ψ]) | weight u(y)² gives pr*L ⊗ U², point class 2μ; OkonekTeleman1996 line 422 has factor 2 | holds | none |
| §8.1 relative parameters | q = 1, 2; b₂⁺ = 1, 2 | generic q-family misses codimension-b₂⁺ wall iff q < b₂⁺; projection index d + q | holds; no locator | C01 |
| §8.3 invariance | regular path; b₂⁺ ≥ 2 | ∂W = M₁ − M₀ gives difference 0; OkonekTeleman1996 line 194: bad set codimension b⁺ | holds | none |
| §9.2 stabilized index | D_t onto; one jump | W = 0, I = [ker D] of rank δ; ker(D, W) of constant rank δ + rank W | holds; no locator | C01 |
| §9.3 family index | b₁ = 0; ℂP², l = 3h | T a point, I = ⟨e^(l/2)Â, [X]⟩ = (9 − 1)/8 = 1 = χ(O) | holds; no locator | C01 |
| §9.4 adapters | b = 4; u = ν₁ν₂ + ν₃ν₄ | graded Ω² = −2Σ_(i<j)ν_iν_j ⊗ α_iα_j gives c₁(I) = −u; u²/2 = ν₁ν₂ν₃ν₄ | holds; source omits sign | C04 |
| Headline: compactness | maximum of f = \|ψ\|² | 0 ≥ Scal f/4 + f²/4 − √2\|η\|f/2, so f ≤ 2√2\|η\| − Scal; HS norm gives 4\|η\| | holds | none |
| Headline: structure | K3; ℂP², l = 3h, h | d = 0, 0, −2; 2δ + b₁ − 1 − b₂⁺ = (l² − 2χ − 3σ)/4; Witten1994 line 161 with c₁ = l/2 | holds | none |
| Headline: invariance | b₂⁺ = 2; repeated loop | 2-families meet codimension-2 wall in points; 2⟨ν(γ)²μ^m⟩ = 0 in ℤ | holds | none |
| Headline: wall crossing | E × ℙ¹ (m₀, n); ℂP², l = (2j+1)h | m − δ + 1 = k; u = nν₁ν₂, jumps 1 and n; d = j² + j − 2 | holds | none |
| Docstring range | b₂⁺ = 1 | d ≡ b₁; r > b₁, r > d or d − r odd give 0; d < 0 gives empty moduli | holds (R02 repaired) | none |
| §9.4 carrier | Mathlib pin | `DividedPowers` on an ideal of a commutative ring, Basic.lean 77 | target stands; carrier unnamed | C04 |

- Source locators checked against the text: 36 (OkonekTeleman1996 26, Witten1994 6, BBMW2002 4). The six Taubes citations carry no locator and the text is unreadable.
- Library: all 118 backticked names in the README resolve at the pins (one is the namespace `TauCeti.SeibergWitten`). I opened 24 declarations, among them QuadraticEnd.lean 70, 86, 195, 325; SpinC.lean 240, 244, 259; EvenRepresentation.lean 207, 261; Neg.lean 43; InsertionForm.lean 74; AlternatingFourForm.lean 166; Characteristic.lean 66; HalfSpinor.lean 333; SardSmale.lean 409; Stabilization.lean 72; Family.lean 62; Exterior.lean 343; SelfDual.lean 412; and Mathlib Fredholm/Basic.lean 123, LinearMap.lean 303, CovariantDerivative/Basic.lean 366, LeviCivita.lean 360, DividedPowers/Basic.lean 77.
- Cross-roadmap citations resolved on main: all 14 suppliers and every cited section. That covers FourManifolds §4.1; SmoothBundlesConnections B2.1–B6.3; ComplexKahlerGeometry 5.1–5.7; PseudodifferentialOperators Layers 1, 4–7; SpinGeometry 6.1–6.3; IndexTheory Layers 1–7; HeegaardFloer 2.1, 2.2, 2.5, 3.4; and DGFloer Layer 1 item 2, the cohomological Serre spectral sequence (its line 470). The open DGFloer head lists §SW3.3a only among the roadmaps that cite it (its line 3791), so there is no cycle.
- Automatic checks: all passed, none set aside. Dependency check: `depcheck: 200 roadmaps, 2202 edges, 0 problem(s)`. Every supplier is on main.
- Elaboration: `lake env lean` on `Suggested.lean` exits 0 with no messages. The file declares nothing, so there was no `#check @name` comparison to make. Nothing outside the folder changed.
- Checks: 59 bullets in 38 sections, all recomputed. The description's counts match.
- Wording: I compared 14 passages with the sources at their locators: §§3.3, 3.4, 5.1, 5.2, 5.4, 6.1, 6.2, 7.1, 7.2, 9.4, 10.1, 10.2, 11.1 and the docstring. The longest shared run is four words, "complex orientation of the" (§7.1 against OkonekTeleman1996 line 233).

Overlap check: read SpinGeometry, IndexTheory, FourManifolds, TaubesGromov, InstantonFloerTheory and SpectralManifolds. Shared objects and their owners:
- Generic Dirac operators, their symbols and the phase homotopy: SpinGeometry §6.1 (C02).
- The Euler non-zero-divisor property for Spin(2ℓ) × U(k): IndexTheory §6.3 (C03).
- Spinᶜ(n) and lifts: FourManifolds §4.1, cited here.
- SU(2) anti-self-dual theory: FourManifolds Layer 5, not used here.
- SW = Gr: TaubesGromov, a consumer.
- InstantonFloerTheory: nothing shared.
- SpectralManifolds SM8 (open) plans Spinᶜ spinor bundles and their connections in every dimension. This roadmap, on main, owns dimension four, so it is SpectralManifolds that must cite it.

Source independence: 14 passages compared with 3 sources, none shared beyond four words. The largest share of the locators is OkonekTeleman1996, 26 of 42 (Taubes has 6 without locators). Contents compared with OkonekTeleman1996 §§1–5: independent. Layers 1–5 and 11 have no counterpart there, and Proposition 15 of its §4.1 sits in Layer 10 here. The order of Layers 9 → 10 is forced by the *Needs:* lines of §§10.2–10.3.

Research link: Layers 8–10 are the full exterior-form invariant and the universal wall-crossing formula of Okonek–Teleman (1996, Theorem 16), which generalizes Witten (1994), Kronheimer–Mrowka and Li–Liu. §5.1 is Booß-Bavnbek–Marcolli–Wang (2002, Theorem 2.7). TaubesGromov builds Taubes's SW = Gr on these invariants. This rests on the README and on the three texts I read.

## Not verifiable

- Taubes, *The Seiberg–Witten and Gromov invariants*, Math. Res. Lett. 2 (1995). The DOI landing page refused access (HTTP 403) and no open copy was found, so its six citations (§§1.3, 4.3, 7.2, 8.2, 11.1, 11.2) were not checked. The gauge, point-insertion and canonical-lift conventions they support were recomputed independently.

## Source issues

- **Error** in OkonekTeleman1996 at §4.1, the Chern character of index(D_A), p. 13: the source says c₁ of the index bundle is +u_c, squaring Σν′(lⁱ)⊗l_i with the ungraded product; it should be −u_c under the graded Künneth product, so c(index) = exp(−u_c); affects a stated result.
- **Misprint** in BBMW2002 at the proof of Theorem 2.7, p. 9: the source says the absorption factor is 1 − 2CC₀/R, with C₀ bounding the perturbation coefficient; it should be 1 − 2CC₀²/R, since the perturbation enters squared; affects nothing.

## For the human reviewers

- none
