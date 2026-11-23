# Review of HamiltonianReduction (pull request #2690 at 34c2afa)
Folder: `TauCetiRoadmap/SymplecticGeometry/HamiltonianReduction/`
**Verdict:** accepted

**Summary.** Accepted with no findings. This was a full review: every statement and Check was recomputed, 43 source locators were checked at the text, the cited library declarations were opened at the pins, and every layer and item of the README on main was found at this head under its id (R1, R1a.0–R1a.4, R2, R2a.1–R2a.7, R3, R3.1, R3.2, R4, R5). Three small corrections and one format note remain, none blocking: a cited gauge theorem is restated without the range of its exponent, the description leaves out the supplier changes and the removed Lean declarations, and one hypothesis of the Weyl-relatedness statement is not used by its route. The status of Meinrenken's lecture notes is left for a human.

## C01 — The Coulomb-gauge theorem cited from Feehan in §R5.3 is restated for a `W^(1,q)` connection with no condition on `q`

A reader takes the sentence "a `W^(1,q)` connection on the unit disc whose curvature is small in `L^(s₀)`, `s₀ > 1`, has a `W^(2,q)` gauge" (README lines 1816–1819) to hold for every `q`, including `q = 1`. The source states it for `q ∈ [p, ∞)` with `p ∈ (1, ∞)` and `d/2 ≤ p < d`, which in dimension two is `1 < p < 2`, so `q > 1`, and its smallness constant depends on `p` and `s₀` (Feehan2020 lines 765–778; its Remark 2.4, lines 779–783, says why `p = 1` is excluded).

Write "a `W^(1,q)` connection, `1 < q < ∞`, on the unit disc …".

## C02 — The description does not state the supplier changes, the two headings of main that are gone, or the thirteen removed Lean declarations

The description says only that "the consumed Hamiltonian-systems contracts and the regular-level manifold are cited as the Tau Ceti declarations that realise them". The head changes more than that. Against the README on main it no longer consumes IntegrableSystems I2.0 (the period-one circle is now Tau Ceti's `AddCircle`, §R1a.3), RootSystems Layer 4 (now `TauCeti.existsUnique_mem_orbit_inter_dominantChamber` and `TauCeti.stabilizer_eq_closure_wallReflections`, §R2.3), CompactGroups Layer 0 (now `TauCeti.haarProb`, §R3.1), SpinRepresentations Layers 2 and 7 (now `CliffordAlgebra.simplyConnectedSpace_realCliffordSpinGroupZero`, §R2a.7), LieGroupoidsPoisson G0.1 and G4.2a, and CotangentLagrangian C1–C2; the transverse fibre product of §R3.0b now comes from SmoothBundlesConnections §B1.0; and MorseNovikov §6.4 and DeRhamCohomologyAndDuality §2.4 and Layer 3 are named as suppliers for the first time.

The sentence "Every layer and section of the README on main keeps its id" is true of the R-ids, but main's sections "Conventions, lower layer and boundaries" and "Acceptance and order" are not at the head under those titles: their content is in Conventions, "How to read the build", the Dependencies of each layer and the Checks and Examples (I found each test of "Acceptance and order" there). The description also does not say that `Suggested.lean` loses its thirteen declarations of main (`fundamentalField`, `coadjoint`, `IsSmoothSymplecticAction`, `IsEquivariantMomentMap`, `fundamentalField_lie`, `algebraicMoment`, `equivariantMoment_infinitesimal`, `cotangentMomentum`, `cotangentLiftedAction`, `cotangentMomentum_hamiltonian`, `PullsBackTo`, `descendedForm_unique`, `descendedForm_exists`), each of which the pinned Tau Ceti now realises and the README names on an *In Tau Ceti:* line. Add three sentences saying so under "Changes of content" and "`Suggested.lean`".

## C03 — Connectedness of the group is not used by the route given for `exists_mem_normalizer_Ad_eq`

The route of §R2.4 (lines 949–951) conjugates `T` and `g T g⁻¹` inside `Z_K(Y)⁰`, which is compact and connected whether or not `K` is; both are maximal tori there because a maximal torus of `K` contained in a subgroup is maximal in it. So the argument proves the statement for every compact Lie group, and the `[ConnectedSpace G]` binder (`Suggested.lean` line 60) and "compact connected" in the README are stronger than the proof needs. The source's setting is a compact connected group, so nothing is false. If the general form is wanted, drop the binder and say "compact" in §R2.4; otherwise a clause that connectedness of `K` is the source's standing hypothesis and is not used would do.

## N01 — The References list omits some locators that the layers cite

Meinrenken's Theorem 8.2 (§R3.0e), Cannas da Silva's §24.5 (§R3.0e), Huebschmann's §1.2 with (1.2.3), §2 and Theorem 2.33 (§§R5.2, R5.5–R5.7, R5.9, R5.10), the remark after Definition 4.28 of Alexandrino–Bettiol (§R2.4) and page 8 of Bates–Lerman (§R3.2) are cited in the text and absent from the per-source lists (lines 2272–2299).

## Previous findings

The previous review, of `4ddef36`, had no findings. Its small corrections and format notes at this head:

- C01 (Huebschmann pages are those of the arXiv version) — repaired: "Math. Z. 220 (1995), 595–609; numbering and pages of arXiv dg-ga/9411006v1" (line 2292).
- C02 (four sections of the last layer without a locator) — repaired: §R5.2 "Huebschmann, §2, p. 8, uses this slice `A + ker d_A*`"; §R5.3 "Feehan, Theorem 2.3, p. 18"; §R5.4 "Huebschmann, part II, Theorem 2.3 and Lemma 2.4, p. 6"; §R5.6 "Huebschmann, §1.2, p. 5". Each was read at the text; C01 above is about the second.
- N01 (the table of former labels was partial) — no longer applies: the head uses main's ids R1–R5 throughout, so there are no former labels to map.
- N02 (References list incomplete) — partly repaired; carried as N01.

## Verified sound

| Statement | Instances tried | Values computed (README side / independent side) | Result |
|---|---|---|---|
| "This roadmap owns" (sample) | each owned object against the layers and against other roadmaps | every clause has a section R1–R5; KKS, flux, reduction, normal form found owned nowhere else; LieGroupoidsPoisson §G4.6B and HamiltonianSystems both hand them here | holds |
| "Already in the library" (sample) | the seven named declarations at the pin | `RegularValue/Level.lean` 234, 435; `Instances/Quotient.lean`; `RootSystem/FundamentalDomain.lean` 201, 247 (needs `IsRootSystem`, linear order, crystallographic, reduced) | holds |
| "Owned elsewhere and consumed here" (sample) | 61 section ids in 16 roadmaps | all resolve on main (Orbifolds O1.4, O2.4, O4.2 as numbered items; DifferentialGeometry ids as bold items); CotangentLagrangian §§4.1–4.3, 4.7 at its open revision | holds |
| "Not claimed" (sample) | Banach case; central extension; discreteness of `Γ_ω` | §R1.7, §R1.4, §R1a.2 and §R1a.4 each state the same non-claim; no layer asserts any of the three | holds |
| Regular reduction, §R3.0a | circle on `ℂⁿ`; `SO(3)` on `T*ℝ³`, `c ≠ 0` | `2n − 1 − 1 = 2n − 2`; `6 − 3 − 1 = 2`; `dμ(ξ_M) = ξ × c ≠ 0`, level not coisotropic; `ker i*ω = 𝔤·x ∩ ker dμ = 𝔤_c·x` | holds |
| Shifting, §R3.0b | tangent vectors `(ξ, v)` at `[1, z]`; abelian case | `ω(ξ_M + v, η_M + w) = c([ξ,η]) + ω(v,w)`, minus `ω_KKS = c([ξ,η])` leaves `ω(v,w)`; other sign reduces at `−c`: `μ⁻¹(½) = ∅` | holds |
| Stages, §R3.0c | `T*U(2)`; `T²` on `ℂ²`; `N` on `𝔤/𝔫` | `8 − 6 = 2`, then a point; `Ad_n ξ − ξ ∈ 𝔫`; freeness of both stages gives freeness of `G` on `μ⁻¹(0)` | holds |
| Flux theorem, §§R1a.0–R1a.3 | torus translation; shear; two-parameter family `(x + t, y + ux)` | `ι_X ω = A(a dy − b dx)`; `−sin(2πx) dx = d(cos(2πx)/2π)`; `∂_u β_t − ∂_t β_u = dx = d(x)`; Banyaga `S(j(x))(c_i) = −x_(i+1), +x_(i−1)` matches | holds |
| Diagonal chart sign, §R1a.2 | linear model `V × V`, `q = (x+y)/2`, `p = ω(·, y − x)` | pullback of `dq ∧ dp` equals `ω(v₁,v₂) − ω(u₁,u₂)`; graph of `tθ` has velocity with `ι_X ω = −θ`, flux `−[θ] = [η]` | holds |
| Compact-support flux, §R1a.4 | cylinder, `X = −f(r − R) ∂_θ` | `ι_X(dr ∧ dθ) = f dr`, class `∫f = 1` in `H¹_c`, zero in `H¹_dR`; exact `ω = dλ` gives `Γ_(ω,c) = 0` | holds |
| KKS theorem, §R2.2 | `SO(3)`; Heisenberg; sharp convention | `(ξ×ν)×(η×ν) = (ν·(ξ×η))ν`, `ω = dA/r`, area `4πr`; `ξ_O = (tr, −sr, 0)`, `ω = dp ∧ dq / r`; `π♯dℓ_ξ = −ξ_O` | holds |
| `exists_mem_normalizer_Ad_eq`, §R2.4 | `SU(2)`, `X = diag(i, −i)`; trivial group; disconnected `K` | `n = [[0,1],[−1,0]]` gives `−X`, no element of `T` does; route never uses connectedness of `K` | holds; C03 |
| `isConnected_stabilizer_coadjointRepresentation`, §R2.5 | `SO(3)`; `U(3)`, `diag(i,i,0)`; `O(2)`; group element `diag(1,−1,−1)` | circle and `SO(3)`; `U(2)×U(1)`, `5 = 3 + 2`; `O(2)` disconnected at `ν = 0`; centralizer of the group element is `O(2)` | holds |
| Chamber classification, §§R2.4–R2.5 | `U(n)` permutations; centre | dominant representative `a₁ ≥ … ≥ aₙ`; roots `x_j − x_k` vanish on `iℝ·1`, chamber taken in `𝔱*_ss` | holds |
| Morse indices and `χ(O_μ)`, §§R2a.2–R2a.4 | `S²`; `U(3)` full flag; `ℂP²` | `q_p = −α(p)J`; `Hess = −(a/r)B`, quotient value `−2` vs tangent `−1/2` at `r = 2`; indices `6,4,4,2,2,0`; `χ = 3`, `6` | holds |
| `Spin(7)` test, §R2a.7 | supports `1234, 1256, 1357` | square `(−1)^6 (−1)^4 = 1`; commutator sign `(−1)^(16−2) = 1`; sums `3456, 2457, 2367, 1467`; order 16 > 8 | holds |
| Local normal form, §R3.1 | `H = 1, ν = 0`; fixed point; vertical contraction | `−dλ = b(ξ) − a(ζ)`; `−d⟨ν,θ⟩ = ν([ξ,ζ])`; `½ω(iz,z) = −½|z|²`; `d(λ(ξ_vert)) = dμ_V^ξ` cancels `ω_V(−ξv,·)` | holds |
| Singular reduction, §R3.2 | weights `(1,1)` at 0; `(1,−1)` at 0 | origin, a point; cone with quotient `ℂ`, strata `{0}`, `ℂ∖{0}`; Bates–Lerman Theorem 7: proper, `O` locally closed | holds |
| Cotangent reduction, §R4.1 | shift sign; fibre translation; Ortega–Ratiu | `(p + ⟨c,A⟩)(ξ^left) = c(ξ) − c(ξ) = 0`; `τ_α* ω = ω − π*dα`; `A_left = −A` gives `Ω − B_c = ω_can + pr*β_c` | holds |
| Curvature moment map, §R5.1 | `g_t = exp(tξ)`; integration by parts | `[ξ,A] − dξ = −d_A ξ`; `∫B(d_A a, ξ) = ∫B(a ∧ d_A ξ) = Ω(−d_A ξ, a)` | holds |
| Deformation complex, §§R5.5, R5.9, R5.10 | `U(1)`; irreducible `SO(3)`; framed | `2 + (2g − 2) = 2g`; `6g − 6`; `(2g−2)d + 2h + d − h = (2g−1)d + h` | holds |
| Gauge theorem cited in §R5.3 | Feehan Theorem 2.3 at `d = 2` | README: any `q`; source: `q ≥ p`, `1 < p < 2`, `s₀ > 1` | C01 |
| R1 conventions | `SO(3)` on `ℝ³`; `X_({f,g})`; `Sp(V)`; `O(2)` on `T*S¹` | `[ξ_M,η_M] = −(ξ×η)×x`; `ι_([X_f,X_g])ω = d ω(X_g,X_f)`; `{μ_A,μ_B} = ω(Av,Bv) = μ_[A,B]`; `−p + c ≠ −p − c` | holds |

- Source locators checked for number and page at the text: 43 in 10 sources (CannasDaSilva2001 11, Meinrenken2024 11, Banyaga1978 5, Bott1956 3, AlexandrinoBettiol2010 3, BatesLerman1997 5, OrtegaRatiu2005 1, Huebschmann1995 3, Huebschmann1996 2, Feehan2020 1); the statements of 34 were read in full, the others at their opening lines; hypotheses agree except C01.
- Library declarations opened at the pin: `Geometry/Lie/Subgroup/Torus.lean` 82–89, 255, 272; `Geometry/Lie/Subgroup/LieAlgebra.lean` 277; `Geometry/Lie/Adjoint/Derivation.lean` 62; `…/Coadjoint/Basic.lean` 80; `…/EquivariantMomentMap/Basic.lean` 259, 355; `…/Pullback/Submersion.lean` 204; `Geometry/Symplectic/Manifold/Descent.lean` 103; `Hamiltonian/MomentMap.lean` 232, 355; `Riemannian/Nil/Basic.lean` 92, 193 (no `LieGroup` instance); the other backticked library names were matched to a declaration of that name at the pins.
- Neither `Suggested.lean` theorem, nor a statement about connected stabilizers or normalizers and `Ad`, is in the pinned Mathlib or Tau Ceti.
- Cross-roadmap citations resolved: 61 ids in 16 roadmaps on main, 4 in CotangentLagrangian's open revision (named in the description). Roadmaps on main cite R1, R1a.0, R1a.2, R2, R2a, R2a.2, R3, R3.1, R4, R5 and the anchors of R1 and R2 here: all present.
- Dependency check: `depcheck: 133 roadmaps, 1479 edges, 0 problem(s)`; no UPWARD or CYCLE line.
- Automatic checks: all passed. Elaboration of `Suggested.lean`: two `sorry` warnings only. Elaborated types compared with §R2.4 and §R2.5: compact, connected, Hausdorff and finite-dimensional binders present in both. One-tactic probe (`rfl`, `simp`, `infer_instance`, `simp_all`, `aesop`): neither statement closes.
- Merge-base comparison: every layer, numbered subsection and R2a item of main is at the head with its statement; the thirteen Lean declarations of main are realised by declarations named on *In Tau Ceti:* lines. Changes outside the folder: none.
- Overlap check: read ConvexityToric, GeometricQuantization and the SymplecticGeometry index (main), and the open IntegrableSystems, HamiltonianSystems, CotangentLagrangian, ContactGeometry and SymplecticGeometry heads; nothing shared (HamiltonianSystems lists group actions, KKS and reduction as outside its scope).

Source independence: 34 passages compared with 10 sources, none shared beyond formulas and standard names; largest share CannasDaSilva2001, 12 of 46 citations; contents compared with CannasDaSilva2001 (Parts VIII–X, chapters 21–26): independent — R1a, R2a, R3.1, R3.2, R4 and R5.2–R5.10 have no counterpart there, and the layers are those of main.

Research link: R1a is the flux theorem of Banyaga (1978); R2a the Morse theory of adjoint orbits of Bott (1956); R3.1–R3.2 the normal form and singular reduction of Bates–Lerman (1997); R5 the local model of Huebschmann (1995, 1996) for Atiyah–Bott's moment map. Rests on the README's references and the texts read.

## Not verifiable

- Banyaga1978 is an OCR text: §III.6 was read (lines 1528–1575) but the heading of Lemme III.6.1 is not legible in it, so the end of the range "pp. 221–223" was not confirmed.
- Huebschmann1995 §§2.18–2.32, cited in §R5.8 as the construction to follow, was located (lines 360–498) and not compared step by step.

## Source issues

- none

## For the human reviewers

- Licence and status: Meinrenken2024 is unpublished lecture notes on the author's Toronto page (README References). It carries 10 of the 46 citations, including the general-group statements of regular reduction (Theorem 8.3) and of the Kirillov–Kostant–Souriau theorem (Theorem 7.25).
- Status: AlexandrinoBettiol2010, OrtegaRatiu2005 and Feehan2020 are cited in their arXiv versions, with that numbering (README References); the two `Suggested.lean` theorems rest on the first.
