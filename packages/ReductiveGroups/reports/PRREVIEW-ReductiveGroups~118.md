# Review of ReductiveGroups (pull request #2530 at 7e741b5)

**Verdict:** accepted

**Summary.** Accepted: a full second reading of this head found no false statement, no missing hypothesis and no supply defect. Every formula, Check and convention of the new §§9B.5–9B.8 was recomputed by hand (root maps, tori, multipliers, the `𝔽₂` counts in ranks two and four, the dualities), and the sampled locators of §1.1, §8.1 and §8.2 and those into Conrad's Appendix C agree with the texts. There is one small correction (the Downstream consumers list lacks ArithmeticGaloisRepresentations §7.3) and two format notes, none blocking. Nothing is left for a human to decide.

## C01 — ArithmeticGaloisRepresentations §7.3 is not in the Downstream consumers list that the scope points to

Whoever next revises §7.3 or its consumers would look under Downstream consumers for what must now cite §9B.5, and would not find §7.3 there. The scope paragraph names ArithmeticGaloisRepresentations §7.3 as a consumer of §9B.5 (line 23) and, seven lines later (line 30), says that the roadmaps planning objects of §§9B.5–9B.7 are "listed under Downstream consumers below"; the paragraph of Downstream consumers on §§9B.5–9B.8 (lines 6666–6682) does not name it. §7.3 on main still constructs *SimilitudeGroup.GSp* itself (`TauCetiRoadmap/ArithmeticGaloisRepresentations/README.md`, line 4618).

Adding "ArithmeticGaloisRepresentations §7.3 (*SimilitudeGroup.GSp*, the similitude group of `−Matrix.J`, from §9B.5)" to the sentence that lists the roadmaps planning objects of §§9B.5–9B.7 would close the gap.

## N01 — The similitude Dickson invariant and `GSO(q) = {det g = cⁿ}` over `R[1/2]` (§9B.6, lines 4943–4947) carry no locator

Conrad, *Reductive Group Schemes*, (C.3.1) and Remark C.3.11, pp. 327–328, gives the homomorphism `GO(q) → ℤ/2ℤ` extending `D_q` and its kernel `GSO(q)`; it builds it by descent rather than through `even.lift`, so the locator could follow the construction.

## N02 — The Cartan–Dieudonné theorem in §9B.7 (line 5054) is named without its namespace and is not in the supplier contracts

`exists_reflectionOrthogonal_list_prod_eq` is `TauCeti.QuadraticMap.exists_reflectionOrthogonal_list_prod_eq` (`LinearAlgebra/QuadraticForm/CartanDieudonne/Basic.lean`, line 651, over a field with `2 ≠ 0`, finite dimension, nondegenerate form). The full name there, and a mention in the *Classical and Clifford groups* contract, would let a reader find it.

## Previous findings

The previous review read this same head and accepted it with no finding. Its small correction (the consumer list) and its format note (the locator) are not repaired, since the head has not changed; they are C01 and N01 above.

## Verified sound

| Statement | Instances tried | Values computed on each side | Result | Change |
|---|---|---|---|---|
| §1.1 invariants via the universal point (sample) | `μ_p` over `𝔽_p`, weight-one line; trivial group | `μ_p(𝔽̄_p) = 1` acts trivially, yet `t ≠ 1` in `𝔽_p[t]/(tᵖ−1)` gives invariants `0`; jantzen §2.10(1)–(2) p. 41 | holds | none |
| §1.1 Hochschild complex (sample) | `𝔾_m` weight one; trivial group | `d⁰(1) = 1⊗(t−1)`; `d¹ = t⊗(t−1) − (t⊗t − 1⊗1) + (t−1)⊗1 = 0`; trivial group `d = 0, id, 0` | holds | none |
| §1.1 enough injectives, `H` flat (sample) | hypothesis against source | jantzen §3.9(b) p. 60 assumes `G` flat, any module `M`; README the same | holds | none |
| §1.1 induction for a non-surjective Hopf map | unit map `ℤ → ℤ[t, t⁻¹]` | cotensor is the invariants: weight-one line `0`, trivial line `ℤ` | holds | none |
| §8.1 split datum (sample) | `SL₂`, `PGL₂`; `GL(R ⊕ L)`; empty base | root `2ϖ` versus a generator of `X`; root spaces `L`, `L∨` not free; conrad Def. 5.1.1 p. 136 has the three conditions | holds | none |
| §8.2 pinning (sample) | `x_α(2t)` over `ℚ`, `𝔽₂`; `Spec(k × k)` | tangent `2E₁₂`, zero mod 2; signs `(+,−)` not a constant system; conrad Def. 6.1.1, Rem. 6.1.2 pp. 186–187 | holds | none |
| Conventions: half-discriminant | `x²`; `z² + xy` | Gram `(2)`, `disc' = 1`; Gram determinant `2·(0−1) = −2`, `disc' = −1` | holds | none |
| Conventions: row versus column | `C` with `C² = ±1` | `MCMᵀ = C ⇒ MᵀC⁻¹M = C⁻¹`, and `C⁻¹ = ±C` | holds | none |
| §9B.5 `GSp₂ₘ`, multiplier, torus | `m = 0, 1`; `diag` in `GSp₄` | `GSp₀ = 𝔾_m`; `GSp₂ = GL₂`, `r = det`; `d₁d₃ = d₂d₄`; `diag(2,2,1,1)`: `ν = 2` nonsquare; `diag(2,1,2,1)`: `4 ≠ 1` | holds | C01 |
| §9B.5 root maps in the `J_{Sp}` model | `E_ij − E_{j'i'}`, `E_{ii'}`, `E₁₃` in `Sp₄` | `XᵀJ + JX`: `−E_{i'j} + E_{ji'} − E_{ji'} + E_{i'j} = 0`; `E_{i'i'} − E_{i'i'} = 0`; `E₃₄ − E₄₃ ≠ 0` | holds | none |
| §9B.5 `(𝔾_m × Sp)/μ₂ ≅ GSp`; root datum | kernel; `ℚ`-points; coroots | kernel `{c s = 1, c² = 1} = μ₂`; `ν(cs) = c²`; `⟨2ε_i − ε₀, ε_i∨⟩ = 2`, `⟨ε₀, ε_i∨⟩ = 0` | holds | none |
| §9B.6 `g` determines `c` in `GO` | even and odd rank | `(c − c')b_q = 0` with `b_q` perfect; odd rank: `q` takes a unit value locally | holds | none |
| §9B.6 Dickson invariant, `SO` | `xy` over `𝔽₂`; `x²` over `𝔽₂`; `l = 0` | `O(𝔽₂) = {1, s}`, `det s = 1`, `D(s) = 1`; `O = μ₂`, `SO = 1`; `l = 0` trivial | holds | none |
| §9B.6 similitude invariant, `GSO` | as previous review, re-read | `f(v,v) = c⁻¹q(gv) = q(v)`; `det(s⁻¹g) = c⁻ⁿ det g` | holds | N01 |
| §9B.6 orbit-map dimensions | `l` even, `l` odd | `l² − l(l+1)/2 = l(l−1)/2`; `l² − 1 − (l(l+1)/2 − 1) = l(l−1)/2`; conrad Thm C.1.5 pp. 305–306 | holds | none |
| §9B.6 `q_J`, `δ` and `SO_l^J` | `l` even; `l = 3` | `½ᵗxJx = Σ_{i≤n} x_i x_{l+1−i}`; `q_l(δx) = 2q_J(x)`; `δ⁻¹x(a)δ` rows `(1, a, −a²/2), (0,1,−a), (0,0,1)` preserve `q_J` | holds | none |
| §9B.6 root map `x_{ε_n}` | `l = 3`; additivity | `(x₁+2ax₂−a²x₃)x₃ + (x₂−ax₃)² = x₁x₃ + x₂²`; `N_aN_b = −2abE₁₃` gives `x(a)x(b) = x(a+b)` | holds | none |
| §9B.7 torus, `ρ`, `ν` | `u = a e f + f e` | `(ef)² = ef`; `u e = a e`, `e u = e`; `τ(u)u = a(fe + ef) = a`; `ν(c∏u_i) = c²∏a_i` | holds | none |
| §9B.7 root datum of `GSpin_l` | simple coroots against `Υ` | `⟨2ε₀+Σε_i, 2ε_n∨−ε₀∨⟩ = 0`, `⟨·, ε_{n−1}∨+ε_n∨−ε₀∨⟩ = 0`, `⟨·, ε₀∨⟩ = 2`; asgari-shahidi Def. 2.1 pp. 5–6 | holds | none |
| §9B.7 exact sequences in low rank | `l = 0, 1, 2` | `Spin₀ = Spin₁ = μ₂`; `Spin₂ = {(a, a⁻¹)} → SO₂`, `a ↦ a²`, kernel `μ₂` | holds | none |
| §9B.7 field points versus `lipschitzGroup` | rank 0; `q₄` over `𝔽₂` | closure of no vectors is trivial, `GSpin = K^×`; `O = 72`, `SO = 36`, six vectors, reflections generate `36`, even products `18 < 36 = |GL₂(𝔽₂)|²` | holds | N02 |
| §9B.7 centre of `GSpin_l` | `l = 2n ≥ 4`; `l` odd | `a_i/a_j = a_ia_j = 1 ⇒ a_i = ζ`, `ζ² = 1`: `𝔾_m × μ₂`; `ε_n` forces `a_i = 1` | holds | none |
| §9B.7 spinor norm | `diag(2,1,1/2)` in `SO(q₃)(ℚ)` | lift `u₁(2)`, `ν = 2`, a nonsquare; `ν(ch) = c²ν(h)` | holds | none |
| §9B.8 low rank | `GSpin₃`, `GSpin₆`; `−det` on trace zero | scalars `z ↦ (z, z²)`, `det = z⁴ = (z²)²`; `−det[[a,b],[c,−a]] = a² + bc` | holds | none |
| §9B.8 dualities | `GSpin_{2n+1}` against `GSp₂ₙ` | roots `ε_i`, `ε_i+ε_j` ↔ coroots `ε_i∨`, `ε_i∨+ε_j∨`; coroots `2ε_i∨−ε₀∨` ↔ roots `2ε_i−ε₀` | holds | none |
| Headlines in `TauCetiRoadmap/ReductiveGroups/Suggested.lean` (11 theorems) | elaboration; file against main | exit 0, 11 `sorry` warnings and nothing else; file identical to main's | holds | none |

- Source locators checked against the text (21): jantzen §2.8 (lines 1100–1150), §2.10 (1216–1224), §3.9 (1688–1707), §4.2 (1936–1943), §4.7 (2000–2012), §4.14–4.15 (2102–2130); conrad Def. 5.1.1 (5651), Def. 6.1.1 and Rem. 6.1.2 (7725–7750), C.1.4 (12491), C.1.5 (12550), C.2.1, C.2.2 (12685, 12699), C.2.8 (12992), C.2.11, C.2.12, C.3.1 (13075–13096), C.3.2 (13163), C.3.5 (13216), C.4.1 (13834), C.4.6 (13986), C.4.10 (14145), rank-one `Spin` (14198), C.6.2–C.6.6 (14758–14927); asgari-shahidi Def. 2.1 (203–215); cai-friedberg-kaplan §1 (250–266).
- Library declarations opened at the pins: Mathlib `CliffordAlgebra/SpinGroup.lean:62, 154, 293`, `CliffordAlgebra/Even.lean:65, 243`, `SymplecticGroup.lean:59, 102`, `QuadraticForm/Radical.lean:115`, `QuadraticForm/Dual.lean:85`, `QuadraticForm/TensorProduct.lean:128`, `Morphisms/SmoothFiber.lean`; Tau Ceti `ConstantForm/Basic.lean:324`, `Symplectic/Basic.lean:120`, `Orthogonal/Basic.lean:96`, `SpecialOrthogonal/Basic.lean:150` and `Smooth.lean:100`, `LinearAlgebra/Matrix/GeneralLinearGroup/Symplectic/Basic.lean:245` (`JFin`), `QuadraticForm/OrthogonalGroup/Basic.lean:190, 409`, `Split/Even.lean:52`, `Split/Odd.lean:55`, `Lipschitz/CliffordGroup.lean:140`, `Pinning/Isomorphism.lean:102`, `CartanDieudonne/Basic.lean:651`. All names of the new contract entries exist.
- Cross-roadmap citations resolved, all on main: LefschetzPencilsAndVanishingCycles §§2.1–2.2 (headings at lines 1491, 1551), DeformationAndDerivedPatchingAlgebra §3.3 (line 603, fibre criterion at 624), SchemeAndStackFoundations §2.11 (Hilbert 90), Completed/OrthogonalSpinGroups (spinor norm), ArithmeticGaloisRepresentations §7.3 (line 4618).
- Automatic checks: all pass. Dependency check output: `depcheck: 200 roadmaps, 2231 edges, 0 problem(s)`, no UPWARD, CYCLE or moved line. Only `TauCetiRoadmap/ReductiveGroups/README.md` changes; nothing outside the folder.
- Signatures: `Suggested.lean` is unchanged against main, so the elaborated types of its 22 declarations are those already compared with the README; none lost a section binder. One-tactic probe not rerun for the same reason: no declaration is new or restated.
- Headlines: the eleven stated theorems are those the module docstring lists; the results of §§9B.5–9B.8 need carriers absent at the pins (the pinned model of a root datum, named in the docstring's Layer 9 item; the orthogonal and spin group schemes of a quadratic module), so none is statable and none is stated.
- Pull request text: agrees with the head (a revision of a roadmap on main, eight headings added, none removed or renumbered, three supplier subsections added, `Suggested.lean` unchanged).
- Overlap check: read ClassicalGroupsPartII, OrthogonalTamagawaAndLatticeMass, QuadraticFormsOverABase (open) and ChevalleyGroups, GroupSchemesOverABase, ReductiveGroupsPartII (main), with the objects searched across all heads. `GSp₂ₘ`, `O`, `SO`, `GO`, `GSO`, the Dickson invariant, `GPin`, `GSpin`, `Spin` as group schemes over a ring: owner ReductiveGroups §§9B.5–9B.7 (on main, earlier than the open roadmaps, which the README lists as consumers; AutomorphicLFunctionsAndLocalFactorsPartII §0.0 is the characteristic-zero special case and a consumer). Ordinarity and the centre `Z(q)`: LefschetzPencilsAndVanishingCycles §§2.1–2.2. Field points and the spinor norm in characteristic not two: Completed/OrthogonalSpinGroups. Dual groups: ReductiveGroupsPartII RG2.5.

Source independence: 12 passages compared with 4 sources (jantzen, conrad, asgari-shahidi, cai-friedberg-kaplan), none shared beyond forced formulas (the sets of simple roots and coroots); largest share milne, about 110 of about 200 locators; contents compared with milne (25 chapters): independent, the layers take its chapters 4, 10, 5, 7, 9 and 12, 14 and 16, 19, 17 and 21 in a different order and add layers it lacks (5P, 6A, 6B, 7a–7f, 9, 11); §§9B.5–9B.8 against conrad Appendix C: C.1–C.3 merged in §9B.6, §9B.5 and the dualities not from it.

Research link: §§9B.5–9B.8 build the split classical and general spin group schemes with the based root data on which Cai, Friedberg and Kaplan (2024) state the doubling construction and Asgari and Shahidi (2006) generic transfer for GSpin; the roadmap develops Conrad's relative reductive group schemes and Jantzen's rational representations. Rests on README §§9B.7–9B.8 and cai-friedberg-kaplan §1, asgari-shahidi §2.

## Not verifiable

- Asgari, *Local L-functions for split spinor groups*, Canad. J. Math. 54 (2002), §2, marked † in §9B.7: no open copy is in the sources cache; the README itself marks the locator as unchecked, and Asgari–Shahidi Definition 2.1 carries the same datum.
- Knus–Merkurjev–Rost–Tignol, *The Book of Involutions*, §§12, 13, 23, marked †: behind a paywall; cited only in the reference list.
- Milne's locators outside the sample (about 110) and the unchanged layers other than §1.1, §8.1 and §8.2 were read for consistency but their locators were not reopened this round.

## Source issues

- none

## For the human reviewers

- none
