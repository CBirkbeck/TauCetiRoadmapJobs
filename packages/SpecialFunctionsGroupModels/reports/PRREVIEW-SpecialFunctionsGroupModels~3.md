# Review of SpecialFunctionsGroupModels (pull request #2694 at 6d84140)

**Verdict:** needs changes

**Summary.** Changes are needed: two findings, both small to repair. A Check of 3.3 gives the weight spaces of the regular representation of the circle with the sign of the weight reversed, and the Lean statement of the weight decomposition yields the Hilbert sum only for a Hilbert basis that already contains weight vectors, which the README's theorem does not assume. All five findings of the previous review are repaired, every other statement and numerical Check survived the computed pass, and `Suggested.lean` elaborates with `sorry` as its only warning. There are three small corrections and two format notes, none blocking. None of the six cited books could be read from a legal copy, so no source locator was verified; that is left to the human reviewers.

## R01 (P2) — For the left regular representation of the circle, the weight-`j` space is the line of `e^{−ijθ}`, not of `e^{ijθ}`

The first Check of 3.3 (README line 828) says: "For the regular representation of the circle on `L²(haarAddCircle)`, `weightSpace j` is the line of `fourierLp 2 j`." The README declares its Checks statements to prove, and with the only regular representation it defines this one is false, so an implementer who formalizes it with `MeasureTheory.Measure.leftRegular` cannot prove it.

In 1.3 the regular representation is `f ↦ f(g⁻¹ ·)`, and `weightSpace U κ j = {v | U(κ u) v = uʲ v}`. For `u = e^{iφ}` and `f = e^{inθ}`: `(U(u) f)(θ) = e^{in(θ − φ)} = u^{−n} f(θ)`. So `fourierLp 2 n` lies in `weightSpace (−n)`; at `j = 1` the function `e^{iθ}` has weight `−1`, and the weight-`1` line is spanned by `e^{−iθ}`. The stated identity holds only at `j = 0`. NoncompactQuantumSymmetry M5 records the same sign for left translation ("its Fourier index is the negative of its representation weight").

Write "the line of `fourierLp 2 (−j)`", or name the right regular representation `f ↦ f(· u)`, for which the Check holds as written.

## R02 (P2) — The Lean statement of the weight decomposition gives the Hilbert sum only when a Hilbert basis containing weight vectors is supplied

In 3.3 the README states: "for unitary `U` with continuous orbits on the circle, `H` is the Hilbert sum of the weight spaces". The declaration `isHilbertSum_weightSpace` (`Suggested.lean` lines 1061–1068) takes, besides `U`, `hU`, `κ`, `hκ`, a Hilbert basis `e`, indices `m n`, weights `jm jn`, proofs `hm : e m ∈ weightSpace U κ jm`, `hn`, and `u₁ u₂ g`, and concludes the conjunction of the Hilbert sum with the transformation law of one matrix element. To obtain the Hilbert sum from it one must first exhibit a Hilbert basis one of whose members is a weight vector, which is what the decomposition is needed for; for `H = 0` the index type is empty and the theorem cannot be applied at all. The Lean statement is therefore weaker than the README's, and unusable for its first half.

The first conjunct mentions none of `e`, `m`, `n`, `jm`, `jn`, `u₁`, `u₂`, `g`. The smallest change is to state it as its own theorem with `U`, `hU`, `κ`, `hκ` only, and keep the transformation law `D_{mn}(κ u₁ g κ u₂) = u₁^{jm} u₂^{jn} D_{mn}(g)` as a second theorem with the present hypotheses.

## C01 — `fixedSubmodule U K` is Tau Ceti's submodule of invariants of the restriction to `K`

`Suggested.lean` line 1222 defines `fixedSubmodule U K` with carrier `{v | ∀ k ∈ K, U k v = v}`. At the pin, `TauCeti/RepresentationTheory/Continuous/Invariants.lean` line 104 has `mem_invariants_restrict : v ∈ (π.restrict S.subtype).invariants ↔ ∀ s ∈ S, π s v = v`, for any `ContRepresentation` and subgroup, so the two submodules are equal and an implementer would add a second copy of a library object.

`isSphericalFunction_inner`, `rank_fixedSubmodule_le_one` and `exists_isUnitary_of_sphericalFunction` would be stated with `(U.restrict K.subtype).invariants`, and the supplier contracts would name it; or, if the local name is kept for readability, 5.3 would say that it is that submodule.

## C02 — `SU11.coe_rotation_two_pi` is a computed value and closes in one step

On a copy of the file, `(rotation (2 * π)).1.1 = -1` (line 738) is closed by one `simp` call that unfolds `rotation` and `ofPair`. As a target it asks an implementer for nothing; it is the Check "`rotation (2π)` is `−1`" of 0.1. It would be marked as a sanity check like the four the module docstring already lists, or left to that Check.

## C03 — The scope does not name VonNeumannAlgebras, which plans the weighted Bergman model of the same discrete series on the half-plane

Section 2.3 owns the weighted Bergman space of the disc with its reproducing kernel and the unitary action of `SU(1,1)` on it, and "Scope and ownership" lists the half-plane models of `D_l^±` only as NoncompactQuantumSymmetry M6.A's. On main, VonNeumannAlgebras Layer 9 (README line 2912) also plans, for `PSL₂(ℝ)` and even weight `n ≥ 2`, "weighted Bergman spaces, closedness of holomorphic L² functions, reproducing kernels, automorphy factors, unitarity" on the upper half-plane. A reader cannot tell from this roadmap how its `A²_k` relates to that space.

One boundary sentence would settle it: 2.3 is the disc model for all `k ≥ 2`, the Cayley transform carries the weight `(1 − |z|²)^{k−2} dA` to `y^{k−2} dx dy` up to a constant, and the half-plane spaces and the formal degree are VonNeumannAlgebras Layer 9's.

## N01 — In "Scope and ownership" two sentences point "below" at text that now stands above: "The numbers are those of the layers below" (line 1102) and "The Checks below compare with those functions numerically" (line 1219).

## N02 — `multiplierRep` (line 501) and `SU11.principalSeries` (line 696) take their value by `h.choose`. The uniqueness statement `multiplierRep_unique` makes the value determined whenever one exists, and the docstring says so; nothing is wrong, and a body built from the composition operator on `Lp` and the bounded multiplier would avoid the choice.

## Earlier findings

- R01 (the GNS theorem attributed to Tau Ceti): repaired. 5.3 now reads "The algebraic statement … is FactorRigidity §4.1's, applied to `G` as a discrete group", and the `*Needs:*` line and the supplier contracts name FactorRigidity §4.1, which is on main and states it (its line 426).
- R02 (multiplier for the right Haar measure): repaired, "`α(g, x) = Δ(g)^{−1/2}`".
- R03 (change of basis): repaired, "the inner sum and the outer sum each absolutely convergent … The double series over pairs `(j, k)` need not converge absolutely".
- R04 (converse of unitarity in 2.1): repaired, "The converse is the other direction of that criterion with the uniqueness of the realization".
- R05 (value in 5.2): repaired, "`φ(b_5) = 0.41207 99646`"; recomputed `0.4120799646`.
- C01: repaired; four statements are marked as sanity checks, and the quasi-regular representation is `multiplierRep_quasiRegular_spec`. C02: repaired, M6.A is cited and exists on main in M6's subsection on two spacelike inputs. C03: repaired, 5.3 names CStarAlgebras §2.2. C04: repaired, `sphereRep_spec` states the irreducibility. C05, C06: repaired.
- N01, N02: repaired. N03 (definition by choice): kept by the author with a docstring; see N02 above.
- The question on the radius label is answered in 2.6 (`ℏR`, from the character `exp(i k·v/ℏ)` of NoncompactQuantumSymmetry M6).

## Verified sound

| Statement | Instances tried | Values computed on each side | Result | Change |
|---|---|---|---|---|
| 0.1 `SU(1,1)`: Euler map, ranges, `mem_su11_iff` | product `k_α b_t k_γ`; period lattice; `[[0,1],[−1,0]]` | `a = ch e^{i(α+γ)/2}`, `b = sh e^{i(α−γ)/2}`; lattice `{(2πp, 2πq): p ≡ q mod 2}`, box area `8π²`; `gᴴJg = −J` | holds | none |
| 0.1 `eulerHaar`, Lie basis, `SU(2)` conversion | `{t ≤ 1}`; brackets; `β = it` | `(8π²)⁻¹·2π·4π·(cosh 1 − 1) = 0.5430806348`; `[b₁,b₂] = −b₃`, `[b₂,b₃] = b₁`, `[b₃,b₁] = b₂`; `b = i sh e^{i(α−γ)/2}` both sides | holds | none |
| 0.2 `ax + b`, oscillator, triangular groups | `g = (2,0)`, box `[1,2]×[0,1]`; `s(1,0,0)²`; Jacobians | `μ_L`: `1/2`, `1/4`; `(1,3)` entry gives `δ₁+δ₂ − Im(c)/4`; misprint `−5/4 ≠ −2`; both densities `e^{−τ}` | holds | none |
| 0.3 motion groups | `M(1)`, `M(2)`, `iso(2)`, `Λ_1` | `(−1,1) ≠ (r,1)` for `r ≥ 0`; `[b₂,b₃] = b₁`, `[b₃,b₁] = b₂`; `cosh 2 = 3.7621956911`; `θ(a,k) = (−a,k)` multiplicative | holds | none |
| 1.1 Radon–Nikodym cocycle | translation with `eˣ dx`; half-plane point; circle | `ρ = e^{−g}`; `0.0553633218`, `0.0180172064`; derivative of `φ⁻¹` is `(a − bw)⁻²`, density `|a − bw|⁻²` | holds | none |
| 1.2 representation law | `α ≡ 0`, `α = χ(g)`, empty `X` | `T(g)T(h)f = α(g,x)α(h,g⁻¹x) f((gh)⁻¹x)`; `α ≡ 0` fails `α(1,x) = 1`; both sides vacuous | holds | none |
| 1.3 `L²` realization, unitarity criterion, strong continuity, quasi-regular | both directions; `ρ = 0, ∞`; right Haar on `ax + b` | `∫(|α|² − ρ)|h|² = 0`; `ρ ∈ (0,∞)` a.e.; uniform convergence on `V·supp f`; `μ_R(gE) = 2 μ_R(E)`, `α = Δ^{−1/2}` | holds | none |
| 1.4 cohomologous multipliers | `β = e^{ix}`, `β = eˣ`, `β = 1` | twist `e^{ig}`; twist `e^{g}` of modulus `≠ 1`; twist `α` | holds | none |
| 2.1 principal series: law, unitarity, adjoint, weights | Check data | norms `11.0000000000`, `12.0198880665`, `11.4937819663`; adjoint `−1.19620 − 0.38632i` both sides, wrong parameter `−1.99828 − 0.47504i` | holds | none |
| 2.1 `ofSL2R`, compact picture | `h = [[2,3],[1,2]]`, `t = 0.81`; 3000 random `(h, t, τ, e)` | `a = 2 − i`, `b = 2i`; `−0.3133253614 + 2.7950357546i`, `−1.7051684444 − 2.2366935927i`; maximal relative error `6·10⁻¹⁴` | holds | none |
| 2.2 complementary weights | `τ = −0.2, −0.9, −0.3, −0.8, 0.3` | `0.2535982026`, `8.9025380657`; ratios `7/3`, `4.38970`, `1/6`; `w(0.3,0) = −0.2074`; `w(n) = w(−n)` by reflection | holds | none |
| 2.3 holomorphic discrete series | `k = 2, 3, 5`; Check data | `‖zʲ‖² = (k−1)B(j+1,k−1)`: `1/2`, `1/10`, `1/5`; `2.43334` both sides, `12.9249` with `+k`; kernel `1.0135685 − 0.6108726i` | holds | C03 |
| 2.4 `ax + b` on the half-line | cocycle; reversed order; dilation | `e^{iλ(ab′+b)x}` both sides; difference `0.2505463`; `f(c·)` intertwines `T_λ`, `T_{λc}` | holds | none |
| 2.5 Schrödinger, Fourier dictionary | Check data; commutator; MetaplecticAutomorphicForms 0.15 | `0.1485468692 + 0.2239731637i` both sides, wrong shift `−0.68676 + 2.40216i`; `(0,0,pq)`; `ρ(x,y,z − xy/2) = U(x,y,z)` | holds | none |
| 2.6 sphere models | `M(2)`, `R = 1.7`, `r = 0.8`; `n = 1` | `i³J₃(1.36) = −0.0466203227i`; `⟨a + ka′, ξ⟩ = ⟨a,ξ⟩ + ⟨a′,k⁻¹ξ⟩`; `n = 1` splits | holds | none |
| 3.1–3.2 matrix elements, addition theorem, unitarity relations | shift on `ℓ²(ℤ)`; `τ = 0.1`, `g = boost 1` | `δ_{m′,m+k}`; column sum `1.0585138265`; rows use `U(g)* = U(g⁻¹)` | holds | none |
| 3.3 weights under a circle subgroup | left regular representation of the circle; Euler factorization at Check data | `U(u)e^{inθ} = u^{−n}e^{inθ}`; factorization error `8·10⁻¹⁷`, Vilenkin–Klimyk form off by `0.0138` | Check false; Lean weaker than README | R01, R02 |
| 4.1 ladder operators | general `n`, `ε` | `A₁zⁿ = ½[(τ+ε−n)z^{n+1} + (τ−ε+n)z^{n−1}]`; `J₊ → m − τ`, `J₋ → −(m + τ)`; `J₊J₋ − J₋J₊ = 2m` | holds | none |
| 4.2 Casimir eigenvalue | `τ = 0.23+0.4i`, `−½+0.8i`, `−k/2` | `0.1229 + 0.584i`; `−0.89`; `0, −3/4, −2`; `−b₁+ib₂ = −E_+`, `−b₁−ib₂ = E_−` | holds | none |
| 4.3 template equation | four parameter sets, `t = 0.9` | residuals `1·10⁻⁸` to `6·10⁻⁷` (finite differences); `−coth t`: `0.95678`; cross term reversed: `0.2165` | holds | none |
| 5.1 Gel'fand's criterion | transpose; inversion; symmetric pair | `(f*h)∘σ = (h∘σ)*(f∘σ)`; `gᵀ = g(γ,t,α)`; `k_π b_t k_π⁻¹ = b_{−t}`; `σ(kp) = k⁻¹(kp)k⁻¹` | holds | none |
| 5.2 spherical functions, transform, characters | functional equation; `t = 5`; non-unimodular `G` | `2.3364502682`, `1.4099165308`, `0.9016545857` both sides; `74.2099485248`, `0.4120799646`; only left `K`-invariance of `h` used | holds | none |
| 5.3 representations, multiplicity one | projection onto fixed line; `H = 0` | `∫_K ⟪v,U(xky)v⟫ = ⟪U(x)*v,v⟫⟪v,U(y)v⟫`; `‖U(k)v − v‖² = 2 − 2 Re φ(k) = 0`; rank `0` | holds | C01 |
| 5.4 `(SU(1,1), K)`, radial equation | `cosh t`, `cosh² t`; `τ = −½+0.8i` | `c = 2`; `6cosh²t − 2`; `D₀₀(b_{0.9}) = 0.8331690033 = ₂F₁(−τ, τ+1; 1; (1−cosh 0.9)/2)` | holds | none |

- Source locators checked against the text: 0 of the 15 sampled subsections (no legal copy of any of the six books).
- Library declarations opened at the pin: `mem_invariants_restrict` (`Continuous/Invariants.lean:104`), `matrixCoeff` (`Continuous/MatrixCoefficient.lean:70`), `leftRegular`, `isUnitary_leftRegular`, `continuous_leftRegular_apply` (`Continuous/LeftRegular.lean:57, 94, 102`), `exists_linearIsometryEquiv_congr_eq` (`Continuous/Unitary/Equivalence.lean:51`); no topological irreducibility predicate, Gel'fand pair, spherical function or multiplier representation in either library.
- Cross-roadmap citations resolved on main: NoncompactQuantumSymmetry (`C₀`, `k_t`, M4.SL2R generators, M4.P, M4.TypeI, M5 `a_{±2j}`, M2 `π_b`, M6 adapters, M6.A), MetaplecticAutomorphicForms 0.15, 0.17, 1.1, 1.2, FactorRigidity §4.1, CStarAlgebras §2.2, RealSemisimpleLieGroups §5.7, SmoothBanachRepresentations 0.2, Layer 2, 3.1, CompactGroups Layer 5, LieGroups Layer 9, AutomorphicFormsOnReductiveGroups §§2.1, 2.6, 2.7, BallQuotientsAndComplexHyperbolicLattices §1.6, OperatorAlgebraDynamics D4.LCAWeyl; SpecialFunctionsSU2MatrixElements §§1.1, 1.3, 1.4, 2.1–2.3, 2.7, 4.2, 6.4 at its open head.
- Dependency check: `depcheck: 182 roadmaps, 2074 edges, 0 problem(s)`; no change outside the folder.
- Elaboration: `lake env lean` on `Suggested.lean`, 79 `sorry` warnings, no error; elaborated types compared with the README; the definitions that omit an unused section instance are unaffected.
- One-tactic probe on a copy: ten statements tried, one closed (C02).
- Description against the head: 75 theorems and 4 instances with `sorry`, 63 definitions, four sanity checks, the supplier list; all as stated.

Overlap check: read SpecialFunctionsSU2MatrixElements (open), NoncompactQuantumSymmetry (main), QuantumFoundations (open), QuantitativeOrbitMethodAndMicrolocalAnalysisOnLieGroups (open); the general matrix element and the Gel'fand-pair theory are owned here and SpecialFunctionsSU2MatrixElements names this roadmap as their owner; the `SL(2,ℝ)` dual, the Heisenberg models and the Euclidean adapters are NoncompactQuantumSymmetry's and are consumed; the unitary Stone–von Neumann theorem is MetaplecticAutomorphicForms', consumed by this roadmap and by QuantumFoundations; nothing else shared.

Source independence: 0 passages compared with 0 sources (none of the six texts could be read); largest share Vilenkin–Klimyk Vol. 1, 32 of 90 locator citations; contents not compared with its table of contents, which could not be opened. By the locators alone the layers draw on its chapters out of order (Layer 0: chs. 6, 1, 5, 4; Layer 1: chs. 1, 2; Layer 2: chs. 6, 2, 1, 4; Layer 3: chs. 2, 6; Layer 4: chs. 6, 2; Layer 5: chs. 1, 6).

Research link: The `SU(1,1)`, Heisenberg and motion-group models with their weight and Casimir dictionaries are the concrete forms of the unitary duals that NoncompactQuantumSymmetry classifies; Layer 5 is the Gel'fand-pair harmonic analysis of Dieudonné 1980 and Wawrzyńczyk 1984 that the planned special-function sequels use. Rests on the README's scope and consumer sections.

## Not verifiable

- Vilenkin–Klimyk, Vol. 1 (Kluwer 1991): paywalled; every locator into it unverified, and its public contents page redirected to a sign-in.
- Klimyk–Vilenkin, Encyclopaedia of Mathematical Sciences 59 (Springer 1995): paywalled.
- Wawrzyńczyk (Reidel 1984): paywalled.
- Dieudonné, CBMS 42 (AMS 1980): the publisher's page is not a classified open host.
- Miller (Academic Press 1968): no legal copy found.
- Edmonds (Princeton 1957): the publisher's page is not a classified open host.
- The four misprints the README attributes to its sources, for the same reason; the corrected forms were computed and hold.
- The radius label `ℏR` for the `ℝ³ ⋊ SU(2)` adapter: read for the planar adapter in NoncompactQuantumSymmetry M6, assumed the same for the spatial one.

Automatic checks set aside as false positives: the four `instance … := by sorry` declarations for the motion groups are instances of proposition-valued classes (topological group, local compactness), so they are theorems stated as instances and carry no admitted data.

## Source issues

- none

## For the human reviewers

- **Not tested.** No text of any of the six cited books was readable legally, so neither wording nor arrangement was compared with a source; Vilenkin–Klimyk Vol. 1 has the largest share (32 of 90 locator citations).
- **Licence.** README "Prior formalization" says the names and statements of 0.1, 1.1–1.3, 2.1 and 3.1–3.2 are those of the author's own repository `bjbraams/lean-SFVK`, stated there as Apache-2.0; that repository was not opened.
- **Licence.** Requests for three texts (Dieudonné, Miller, Edmonds) are recorded for the operator; the other three resolve only to paywalled pages.
