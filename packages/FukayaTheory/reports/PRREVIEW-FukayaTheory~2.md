# Review of FukayaTheory (pull request #1045 at 93906cc)

**Verdict:** accepted

Full review of `TauCetiRoadmap/FukayaTheory/README.md` (688 lines) and `TauCetiRoadmap/FukayaTheory/Suggested.lean` (docstring-only) at head 93906cc. The gate at this head passes every check (build OK); the dependency check reports `depcheck: 204 roadmaps, 1403 edges, 0 problem(s)` with no UPWARD or CYCLE line. No P1 or P2 finding; five P3 notes, which the author may take or leave. The diff outside the roadmap folder is empty.

Source ids used below (worker cache, line-numbered text): `fooo-polydisks` = arXiv 1104.4267v1; `dsrs` = arXiv 1205.0533v3; `charest` = arXiv 1212.2923v1; `konstantinov` = arXiv 1701.03624v2; `ambrosioni` = arXiv 2306.13600v2; `biran-cornea` = arXiv 0708.4221v1; `auroux` = arXiv 1301.7056v1; `ww-coprime` = arXiv 1601.04924v2; `ww-corr` = arXiv 1101.3770v1. The folder has no `sources.toml`, like every roadmap folder on main (0 of 124 have one), so its absence is not a finding.

## Repair status of the previous review (head 5afda6c)

- **R01 (P2, sphere theory re-planned against HeegaardFloer F2.6a–d): repaired.** The supplier table (README line 27) now reads "F2.6a–d (the sphere theory: …) … The sphere theory is consumed in FK3.1b, FK3.2, FK8.0 and FK9.1 and is never rebuilt; FK3.1b states only its bordered, joint-incidence and parameter-dependent extensions"; the contract (line 69) lists F2.6a–d item by item; FK3.1 (line 346) opens "the bordered extension of HeegaardFloer F2.6d's quantitative simple-point windows … nothing about spheres is constructed here"; FK3.1b (line 386) says the residual set, smooth selection and one-marked cobordism/degree theorem "are HeegaardFloer F2.6b–d; consume them". Each cited HeegaardFloer section exists on main with the stated content (`TauCetiRoadmap/HeegaardFloer/README.md` lines 2306, 2376, 2461, 2512; F2.6d line 2515 carries the ratio condition `inf_(ζ≠z) d(u(z),u(ζ))/d(z,ζ)≥1/K` with `‖du‖∞≤K`, and lines 2532–2536 the one-marked cobordism and degree).
- **R02 (P2, FK5 engine versus ImplicitAtlases): repaired** by the second option of the repair. Scope (line 29) and FK5.1 (line 462) state that FK5 owns a chain-level Kuranishi/multisection engine, consume ImplicitAtlases §§0.2–0.4 for orientation lines, finite-group invariants and relative chains, give the reason (the atlas engine's output is a rational functional on Čech cohomology; fibre products only for transverse data over a manifold, §7.1; the application interface §7.4 gives no chain-level fibre-product compatibility), and FK9.2 (line 651) states the comparison of the two engines on shared closed data. The reason is correct at the ImplicitAtlases head: §4.3 says the class "is a functional on cohomology; no canonical chain-level functional to ℚ is asserted" (`TauCetiRoadmap/ImplicitAtlases/README.md` line 567), §7.1 forms fibre products of regular loci over a manifold with a transverse joint chart (line 772), §7.4 supplies the input interface only (line 831).
- **R03 (P3, `Suggested.lean` padding): repaired.** The file is a module docstring and an empty namespace; it names the five headline theorems and what each lacks at the pins. `lake env lean` exits 0 with empty output.
- **R04 (P3, README shape): largely repaired.** `# Roadmap:` title with `**Summary.**`, `## Scope and ownership`, `## Conventions`, `## Exact supplier contracts` per supplier, `## How to read the build`, ten `## Layer k:` sections with 32 `### k.n` subsections and 32 `*Needs:*` lines, `### Examples` and `### Dependencies` per layer, `## Downstream consumers`, `## References`. What remains is R02 below: 18 subsections still have no `**Checks.**` block and no definition has an API bullet list.
- **R05 (P3, HeegaardFloer item numbers): repaired.** Line 69 lists F1.1–F1.5 with F1.4 the Lagrangian-path Robbin–Salamon conventions and F1.5 the bordered Riemann–Roch; FK1.2b (line 212) cites F1.4 for the index, FK2.2 (lines 274–276) cites F1.5 for Riemann–Roch and F0.0 with F1.4 for determinant lines.
- **R06 (P3, locators): repaired.** Charest Theorems 4.1.4–4.1.5, Lemma 4.1.6 and the §4.3 index bound; Biran–Cornea Lemma 3.2.2; de Silva–Robbin–Salamon (H), Definition 6.1, Theorems 3.4, 6.7–6.8, 9.1–9.3, 12.1–12.2 and Remark 9.11; Konstantinov Definition 2.2 and Proposition 2.4; FOOO §6.1 (6.2)–(6.3) and Remark 6.3; Ambrosioni §1.2; McDuff–Salamon Proposition 2.5.1 by locator (uncertified). All verified below.

## R01 (P3) — FK8.1 Check: the equal-sign model does not give "H⁰ of the wrong rank"

**Location.** `TauCetiRoadmap/FukayaTheory/README.md` line 589: "a model that counted the two lunes with equal sign would give `d b=2T^A a` up to basis change and `H⁰` of the wrong rank."

**Claim.** The relative sign of the two lunes is detected by the cohomology of the torus complex.

**Witness.** Equal signs give `d b=T^A(a+c)`, not `2T^A a`: `a+c` is a primitive vector of `Λ₀³` (basis `(z, a+c, c)`), so `Λ₀³/(T^A(a+c))≅Λ₀²⊕Λ₀/(T^A)`, the same rank 2 and the same torsion as for `d b=T^A(a−c)`; over `ℤ`, `ℤ³/(a+c)≅ℤ²` as well. More generally `d b=T^A(a+uc)` has this cohomology for every unit `u`, so no coefficient-level test on this pair sees the relative sign.

**Repair.** Replace the negative control by one that the sign law discriminates. For instance: reversing the orientation of `α` flips both lune signs (de Silva–Robbin–Salamon, Remark 9.11), giving `d b=−T^A(a−c)` with the same cohomology, so the sign is tested at the chain level against the Remark 9.11 complex `∂a=+b`, `∂c=−b`; and say that this pair detects the relative sign only at the chain level, the cohomology being insensitive to a unit rescaling of `c`. Tested on the refuting instance: with `d b=T^A(a+c)` the stated `H⁰≅Λ₀²⊕Λ₀/(T^A)` is unchanged.

## R02 (P3) — Eighteen subsections have no Checks and no definition has an API list

**Location.** `TauCetiRoadmap/FukayaTheory/README.md`: subsections 0.4, 1.1, 1.2, 2.1a, 2.3, 3.1a, 3.1b, 3.1c, 3.2, 3.3, 4.1, 4.2, 5.2, 5.3, 6.2, 7.1, 9.0, 9.1 (18 of 32) have no `**Checks.**` block; no subsection lists a definition's API as bullets.

**Claim.** Every definition has its API and at least three discriminating Checks.

**Witness.** Count over the file: 15 `**Checks.**` blocks, 32 subsections, 0 API bullet lists. Definitions without Checks include the coloured unit-cell complex and its obstruction class `u_ε` (FK0.4), the relative-spin brane carrier and its `H¹` torsor (FK1.1), the unit-forgetful allowed-data carrier (FK2.1a), the metric cluster domains and the steering theorem (FK2.3), the strict weakly unobstructed object `(L,E,b,λ)` and its localization (FK7.1), the finite-loss moving-end comparison template (FK9.0).

**Repair.** Add three Checks to each definition-bearing subsection, each saying what is computed and what a wrong definition would get wrong. Candidates already computed in the text: FK0.4, the `e⁺/f` extension on the one-object algebra (`m₁(f)=e⁺−e_old`, `m₂(e⁺,f)=f`, all higher operations zero) and the obstruction class of `C_A` at energy `A` (`r=[v]`, `u_A` onto, correction exists); FK1.1, the equator's two spin structures and the sign change `(-1)^⟨α,∂β⟩=−1` for the hemisphere class under the nontrivial `α`; FK2.3, the one-edge steering formula at `F=0` (`DΦ=id`, `δγ(ℓ)=∫δY`); FK7.1, the scalar monotone object `b=λf` and the rank-two `U=diag(1,2)` brane that is not strict weakly unobstructed. API bullets may be prose and carry no Lean names, since `Suggested.lean` declares nothing.

## R03 (P3) — `λ_C2` is not the supplier's name for the cotangent one-form

**Location.** `TauCetiRoadmap/FukayaTheory/README.md` line 85 ("the intrinsic cotangent phase space with `λ_C2` and `ω=−dλ_C2`"), line 220, line 230 ("CotangentLagrangian C1 (`λ_C2`)"), line 408 ("`θ=−λ_C2`").

**Claim.** `λ_C2` names CotangentLagrangian's canonical one-form.

**Witness.** `TauCetiRoadmap/SymplecticGeometry/CotangentLagrangian/README.md` C1 item 2 (line 31) constructs the one-form as `λ(v)=p(dπ(v))` with `ω=−dλ`; the string `λ_C2` occurs nowhere in that README (0 hits), and the form is a C1 object, not a C2 one.

**Repair.** Write "C1's canonical one-form `λ`, with `ω=−dλ`" at line 85 and use `λ` (or define `λ_C2` as this roadmap's name for it at first use) at lines 220, 230 and 408. Tested: the cap-area Check at line 228 and the collar `θ=−λ` at line 408 are unchanged by the renaming.

## R04 (P3) — The headline intersection bound is paraphrased without its brane hypotheses

**Location.** `TauCetiRoadmap/FukayaTheory/README.md` line 3 ("the exact and weakly exact intersection bound `#(L∩φ_H(L))≥Σ_j dim_k H^j(L;k)` (FK9.0)") and `TauCetiRoadmap/FukayaTheory/Suggested.lean` lines 20–22 ("for a compact exact or weakly exact Lagrangian `L` and a Hamiltonian diffeomorphism `φ_H` with `L ⋔ φ_H(L)`").

**Claim.** The bound holds for every field `k` and every compact weakly exact Lagrangian.

**Witness.** FK9.0 (line 609) states it for "an exact or weakly exact trivial rank-one Hamiltonian self-pair", whose objects are branes carrying an actual relative spin lift (FK1.1, line 180); the paraphrases drop the orientation hypothesis. For `k` of characteristic 2, or of characteristic 0 (since `dim H^j(L;𝔽₂)≥dim H^j(L;ℚ)`), the bound follows from the mod-2 theory for any `L`; for odd characteristic the signed count needs the relative spin lift, which a compact Lagrangian need not admit (`w₂(TL)` must lie in the image of `H²(X;ℤ/2)`).

**Repair.** In the Summary and the docstring write "compact exact or weakly exact brane `L` (oriented, relatively spin)" or "for `k` of characteristic 2 or 0, and for every `k` when `L` is relatively spin". FK9.0 itself needs no change.

## R05 (P3) — FK3.1 Check infers a vanishing Maslov class from exactness alone

**Location.** `TauCetiRoadmap/FukayaTheory/README.md` line 362: "Exact branes in an exact target have `ω=0` on `π₂(X,L)`, hence `μ=0` there, `N_L=∞` and an empty Maslov-two sum".

**Claim.** Exactness implies `μ=0` on `π₂(X,L)`.

**Witness.** The inference holds only for an exact brane supplied as monotone data (`ω=τμ` with `τ>0` forces `μ=0` from `ω=0`); exactness alone does not fix the Maslov class (its vanishing for exact Lagrangians in cotangent bundles is the Abouzaid–Kragh theorem, not a formal consequence).

**Repair.** Write "An exact brane given as monotone data has `ω=0` on `π₂(X,L)`, hence `μ=0` there …", so that the Check tests the monotone definition rather than asserting a theorem about exact Lagrangians.

## Verified sound

**Gate and build.** Gate at 93906cc: every counter 0, build OK. `lake env lean TauCetiRoadmap/FukayaTheory/Suggested.lean` exits 0 with empty output. The file has no declarations, so there is no `#check` scratch and no padding probe to run; the docstring has the required form ("<title>: target signatures", the roadmap is `README.md`, five headline theorems each with what it lacks). `git diff --stat origin/main...HEAD -- . ':!TauCetiRoadmap/FukayaTheory'` is empty.

**Dependency check.** `gate --depcheck … --movable`: `depcheck: 204 roadmaps, 1403 edges, 0 problem(s)`; no UPWARD, CYCLE or `moved:` line. FukayaTheory is merge-order line 209; its open-head suppliers are earlier (CalibratedGeometry 208, ImplicitAtlases 200, SmoothBundlesConnections 7); the others are on main (MorseNovikov, HeegaardFloer, DGFloer, DGAInfinity, StablePeriodicCurved, SpinGeometry, AlgebraicTopology, DifferentialGeometry, GeometricTopology, SymplecticGeometry/CotangentLagrangian, HamiltonianFloerOperations). HamiltonianSystems is consumed from another author's open pull request that adds that folder (its Layer 1 "Hamiltonian vector fields and the Poisson bracket" and Layer 2 "dynamics" exist at its head; its convention `ι_{X_F}ω=dF` is the one the README converts through `f=−H`); it is not in the merge order, so that edge is not mechanically checked.

**Cross-roadmap citations resolved (file and line on main or at the open head).** HeegaardFloer: Lane M (1.0a–1.10, lines 216–1145), F0.0 (2.2, line 1222), F0.2 (2.4, line 1427), F0.3–F0.5 (lines 1462, 1480, 1662), F1.1–F1.5 (lines 1818–1982), F2.1–F2.5 (lines 2081–2282), F2.6a–d (lines 2306, 2376, 2461, 2512), F3 (lines 2949, 2990; line 3007 names the FK4.2 overlap with `H_FK=−H_HF`; line 4131 lists FukayaTheory as the FK4.2 consumer). MorseNovikov N1 (lines 75–139): `U_C`, `P_(ρ,φ)` with `N′∘φ=cN`, `c>0`, `P(U_C)⊆U′_(cC)`, nonnegative subrings and positive ideals, geometric series; N1 does not state the localization `S⁻¹Λ₀≅Λ_loc`, so FK0.1's statement is not a duplicate. DGAInfinity: Layer 0 (line 263), Layer 2 (line 317, general-ring hypothesis "require `f₁` to be a chain-homotopy equivalence" at line 326), Layer 4 (line 394), Layers 5–6 (lines 431, 466). StablePeriodicCurved Layer 5 (line 411, right-convention curved DG algebras). DGFloer Layer 6 items 2–3 (lines 1071–1083) and the scope line 67 leaving polygon operations to the Fukaya roadmap. SpinGeometry G4 (line 395; `H¹(X;ℤ/2)` torsor at line 492). SmoothBundlesConnections B1–B2 (lines 219–868), Layer 5 (line 1070). AlgebraicTopology Stage 1 (line 289), Stage 2 item 6 (line 382, local coefficient systems), Stage 4 (line 499), Stage 6 with 6.0–6.2 (lines 946, 948). DifferentialGeometry Layer 3 (line 371; 3.5 time-dependent flows at line 400), Layer 5 (line 503), 8.3–8.4 (lines 836, 834). CotangentLagrangian C1, C2, C4 (lines 25, 44, 247; Weinstein at line 309). GeometricTopology Layer 11 (line 831). CalibratedGeometry C2 at the open head (line 180; integral smooth-to-singular comparison, lines 202–216). ImplicitAtlases at the open head: §0.2 (line 109), §0.3 (line 125), §0.4 (line 141), §1.1 (line 284), §3.1 (line 438), §4.3 (line 550), §5.4 (line 628), §5.6 (line 656), §7.1 (line 770), §7.4 (line 829). HamiltonianFloerOperations line 22 records FukayaTheory as owner of the Lagrangian operations. GromovWittenTheory (open head line 766) and AnalyticStableMaps (open head line 1107) name Lagrangian Floer theory only as a possible consumer.

**Ownership greps** over all open heads and main for lune, Lazzarini, bounding cochain, Fukaya category, Lagrangian Floer, Kuranishi, relative spin: no second owner. Lunes elsewhere are other objects (RiemannianGeometry spherical lunes, KhovanovHomology diagram lunes); CombinatorialHeegaardFloer is grid homology; GaugeQuiltFieldTheory (open head) consumes "FK's ordinary polygon contracts" and owns quilts only; SymplecticFieldTheory line 754 explicitly does not own a Kuranishi approach.

**Pinned library declarations opened** (Mathlib 6b7abb3c, Tau Ceti a91d3aa). `AInfinityAlgebra` with `m_zero` (`TauCeti/Algebra/Homology/AInfinity/Algebra.lean` lines 65–72); `maurerCartanSum` with sign `negOnePowCast R (n.choose 2)` and `IsMaurerCartan` (`…/Algebra/MaurerCartan.lean` lines 74, 105), matching FK0.2's `(-1)^(n(n−1)/2)`; `InternalGrading.toGradedObject` (`TauCeti/Algebra/Module/GradedModule/GradedObject.lean` line 52); `curvedDGRightModuleHomComplex` (`TauCeti/Algebra/Homology/Curved/Module/Right/HomComplex.lean` line 151) with `δ(f)=d_N∘f−(−1)^p f∘d_M`, `d_M²x=x*w` and `δ²(f)(x)=f x*w−f(x*w)=0` (lines 14–26), exactly FK0.2's right-module convention; `SmoothEmbedding.tangentRange` (`TauCeti/Geometry/Manifold/SmoothEmbedding/NormalSpace.lean` line 43, needs `n ≠ 0`); `SmoothTwoForm.Tames` (`TauCeti/Geometry/Symplectic/Manifold/TwoForm.lean` line 114); `SmoothAlmostComplexStructure` (`…/AlmostComplex.lean` line 67); `IsLagrangian.isMaximalTotallyReal_of_tames` (`TauCeti/Geometry/Symplectic/Lagrangian/TotallyReal.lean` line 92); `riemannMapping` (`TauCeti/Analysis/Complex/Conformal/RiemannMapping/Existence.lean` line 96) and `exists_continuousOn_closedBall_bijOn_ball_of_isJordanCurve_frontier` (`…/Conformal/Caratheodory.lean` line 240); the time-independent flows in `TauCeti/Geometry/Manifold/IntegralCurve/` (Flow, SmoothFlow, Maximal). Mathlib: `GradedObject` (`CategoryTheory/GradedObject.lean` line 43), `MultilinearMap` (`LinearAlgebra/Multilinear/Basic.lean` line 88), `LinearMap.finrank_range_add_finrank_ker` (`LinearAlgebra/FiniteDimensional/Lemmas.lean` line 173), `BaireSpace` (`Topology/Defs/Basic.lean` line 238). Absent at the pins, confirming the docstring: no Hamiltonian vector field or flow on a manifold (the only `hamiltonian` hits are graph theory and a docstring word), no Novikov ring, no Floer complex, no relative spin structure. Singular homology does exist at the pins (`Mathlib/AlgebraicTopology/SingularHomology/Basic.lean`, Tau Ceti `singularHomologyFunctor`), so the obstruction to stating the intersection bound is the Hamiltonian diffeomorphism, as the docstring says.

**Sources and locators** (seeded sample and the README's flagged locators). `dsrs` line 53, p. 4: hypothesis (H) (connected oriented surface, transverse connected oriented closed one-dimensional submanifolds; compactness not assumed). Line 450, p. 15: Theorem 3.4 trace formula `μ=(m_x+m_y)/2`. Line 1282, p. 39: Definition 6.1, orientation-preserving immersion of the half-disc `D`, diameter `D∩ℝ` on `α`, semicircle on `β`, `du` injective also at the corners `±1`. Lines 1431–1443, pp. 43–44: Theorem 6.7 (`(i)⇒(ii)⇔(iii)`, all equivalent when `Σ` is simply connected) and Theorem 6.8 (uniqueness). Lines 2274–2298, pp. 69–70: Theorems 9.1 (mod-2 complex, `∂²=0`), 9.2 (isotopy invariance for noncontractible circles), 9.3 (agreement with analytic Floer homology). Lines 2391–2415, p. 74: Remark 9.11, the sign `ν(u)=±1` by the orientation of the `α`-arc, Theorems 9.1–9.2 remain valid, the integer version of Theorem 9.3 left to others: exactly as the README reports. Line 2944, p. 90: Theorem 12.1, bijection with `M_Floer(x,y;J)`, which line 2920 defines as index-one holomorphic strips up to time shift. Line 2984, p. 92: Theorem 12.2, surjectivity and the index formula with nonnegative weights and `ν_y≥1`. `charest` line 2612, p. 68: Theorem 4.1.4 (graph `G(v)⊃∂D`, surjective holomorphic `π_D`, simple `v_D`, `[v]=Σm_D[v_D]`); line 2628, p. 69: Theorem 4.1.5 (`n≥3`, generic `J`); line 2635, p. 69: Lemma 4.1.6 citing "lemma 3.2.2 of [BC]"; line 2744: §4.3 "Case n≤2"; lines 2858–2874, p. 76: `Ind ≤ 2k(r(C))−1−(n−1)N`; the printed page number 73 appears at line 2856 on that page, confirming the stated offset of three. `biran-cornea` line 637, p. 18: Lemma 3.2.2, `n=dim L≥3`, second-category `J_reg`. `konstantinov` lines 344–362, p. 8: Definition 2.2 (`m₀(p,E;J_p)=Σ P_∂u∈End(E_p)` over `𝔽₂`, `N_L≥2`) and Proposition 2.4 (independence of `J_p`, parallelness, symplectomorphism naturality). `fooo-polydisks` lines 964–982, p. 19: §6.1, (6.2) `Λ₀^a⊕⨁Λ₀/T^{λ_i}`, "not invariant under the Hamiltonian isotopy", (6.3) `Λ^a` invariant; lines 1014–1021, p. 20: Remark 6.3, composite of the two chain maps only chain-homotopy equivalent to the inclusion `T^λC→T^{λ−2‖H‖}C`. `ambrosioni` lines 229–237, p. 6 (§1.2 starts at line 222): monotonicity constant, `N_L≥2`, the Novikov field over `ℤ₂`. `auroux`, `ww-coprime`, `ww-corr` headers checked; they are read-for-background references with no target.

**Adversarial table.** One row per statement, values computed on both sides.

| Statement (README line) | Instances tried | Values computed | Result | Change |
| --- | --- | --- | --- | --- |
| Conventions `ι_(X_H)ω=−dH`, torus shear (39, 45) | `ω=dq∧dp`, `H=−(4π)⁻¹cos2πq` | `dH=½sin(2πq)dq`; `X=a∂_q+b∂_p` gives `ι_Xω=a dp−b dq=−dH` so `a=0`, `b=½sin2πq`; time-one map `(q,p)↦(q,p+½sin2πq)`; `β₀=(t,2t)↦(t,2t+½sin2πt)=β` | holds | none |
| Self-chord shear and degree (39, 46) | `n=1`, `h=±x²/2` | flow `(q,p)↦(q,p+th′)`, linearization `[[1,0],[th″,1]]`; `μ_ch=½sign h″=±½`; `|x|=½−μ_ch=0` or `1=ind h`; `(φ¹)⁻¹(zero section)=graph(−dh)` | holds | none |
| `CZ_HF(−H)+n=ind_Morse(H)` (39) | HeegaardFloer F1.4 lines 1961–1966 | HF: `ι_Xω=dH_HF`, `CZ=n−ind(H_HF)`; with `H_HF=−H_FK`, `CZ=n−(n−ind H_FK)=ind H_FK−n` | consistent | none |
| Degrees (47) | `k=0,1,2` | `2−k=2,1,0`; `|m₂(g,f)|=|g|+|f|` | holds | none |
| FK0.1 `S⁻¹Λ₀≅Λ_loc`, `C⟨r⟩` (103) | nonzero series `s`, `r=0` | finite-sublevel support gives a least `E_R`-value `−r`; `T^r s∈Λ₀`; `T^r` unit with inverse `T^(−r)`; `C⟨0⟩=C` | holds | none |
| FK0.1 Check `C_A` (107–109) | `A>0` | `dh(v)=T^(−A)T^Av=v`, `hd(b)=T^AT^(−A)b=b`, `dh+hd=ι_(0,A)`; `H⁰=Λ₀/(T^A)∋T^(A/2)≠0`; inverse of `T^r` would need exponent `−r<0` | holds | none |
| FK0.1 residue rings (99, 109) | `(g,−E(g))` | `E_R(g,−E(g))=0` for every `g`, so residue `R[G]`; before extension `ker E` | holds | none |
| FK0.1 dense proper direct sum (110) | `μ(G)` infinite | `Σ T^n e^{g_n}` with distinct degrees and `E(g_n)+n→∞` has finite sublevels, infinitely many degrees | holds | none |
| FK0.2 curved arity-one identity (122, 130) | one object `m₀=λe⁺`; two objects `λ₀,λ₁` | `m₁²(a)=m₂(a,λe⁺)−m₂(λe⁺,a)=λa−λa=0`; `d²(a)=m₂(a,m₀L₀)−m₂(m₀L₁,a)=(λ₀−λ₁)a` | holds | none |
| FK0.2 MC series signs (126, 131) | `n=2,3,4` | `(-1)^{C(n,2)}=−1,−1,+1`; pinned `maurerCartanSum` uses `negOnePowCast R (n.choose 2)` | agrees | none |
| FK0.2 Hom differential (124, 132) | degree-`p` right-linear `f` | `D²f(m)=f(m)w−f(mw)=0`; left-module `wm` on one side leaves `f(m)w−f(wm)` | holds, equals pinned `HomComplex.lean` lines 18–26 | none |
| FK0.3 composite losses (144) | arity 1, 2 | `C″₁=C′₁+C₁`; `C″₂=max(C′₁+C₂, C′₂+2C₁)` | holds | none |
| FK0.3 finite-loss pair not `Λ₀`-equivalence (145–146) | `C_A` vs `0`; `ι_(0,C)` | localized both acyclic; positive cohomologies `Λ₀/(T^A)` vs `0`; `ι_(0,C)` induces `T^C` on `Λ₀/(T^A)`, zero for `C≥A` | holds | none |
| FK0.4 `e⁺/f` extension (158) | unary identity | `m₁²(f)=m₁(e⁺−e_old)=0−0=0`; `B=b+λf`: `m₀^B=m₀^b+λm₁(f)=λe_old+λ(e⁺−e_old)=λe⁺` | holds | none |
| FK1.2 cap codimensions (188) | `−grad f` input, `+grad f` output | stable manifold of `−∇f` at `x` has dim `n−ind`, codim `ind`; output codim `n−ind` | holds | none |
| FK1.2a dictionary (194, 200–202) | `H=0`, `L₀⋔L₁`; `x(0)` variant | chords constant, flow identity, bijection with `L₀∩L₁`; `x(0)∈L₀∩(φ¹)⁻¹(L₁)=(φ¹)⁻¹(φ¹L₀∩L₁)` | holds | none |
| FK1.2a finite-complex lemma (196, 202) | zero complex; two generators `d=0`; `d` iso | `0≤0`; `2=2`; `0<2` | holds | none |
| FK1.2b cone differential (210) | arbitrary `(c,a)` | `d²(c,a)=(∂(∂c−f_#a)−f_#(−∂a), ∂∂a)=(−f_#∂a+f_#∂a,0)=0` | holds | none |
| FK1.2b torus `G_D` (227) | `L=α⊂T²` | `H₂(α)=0→H₂(T²)=ℤ→H₂(T²,α)→H₁(α)=ℤ↪H₁(T²)`, so `G_D=ℤ`; `E_D=1`; `c₁(TT²)=0` gives `μ_Z=0` | holds | none |
| FK1.2b cotangent cap sign (220, 228) | `T*S¹`, `ϕ=cos q`, cap `u(σ,t)=(πσ,−t sin πσ)` | `u*(dq∧dp)=−π sin(πσ)dσ∧dt`, `∫=−2`; formula `ϕ(π)−ϕ(0)=−2`; unsigned area `∫₀^π sin q=2` | holds | none |
| FK2.1 dimensions (246, 256–258) | `k=2,3,4`; `k=1` with 0 or 1 interior mark | `k−2=0,1,2` (point, interval, pentagon); `−1` unstable; `2+2·1−3=1`; `D_aug−2k=1−2=−1` | holds | none |
| FK2.1 painted dimension (248, 257) | `k=1,2`, `a=0` | `k−1=0,1` | holds | none |
| FK2.2 `vdim=μ_Z+d(x₀)−Σd(x_i)+k−2` (276, 284–286) | `k=1,2`; `k=0,μ=2`; recapping | `|x₀|=|x₁|+1`; `|x₀|=|x₁|+|x₂|`; `vdim=2+|x₀|−2=|x₀|`; recapping shifts `μ_Z` and one `d(x_i)` by `μ(β)` | holds | none |
| FK2.3 variation formulas (298, 302) | `γ′=Y_s(γ)` | Duhamel `δγ(ℓ)=DΦ_(ℓ,0)δγ(0)+∫₀^ℓDΦ_(ℓ,s)δY_s ds`; backward with `ξ(S)=0`: `ξ(0)=−∫₀^S DΦ_(0,s)δY_s ds` | holds | none |
| FK2.4 curvature signs and margins (312–316, 324–326) | `K=βH dt`, input `β:0→1`, output `1→0`; `ε=1`, `δ=3/4`, `k=2,3` | `R_K=β′H ds∧dt`; input `∫R=∫H∈(−ε,−δε)`, output `−∫H∈(δε,ε)`; sum `<ε−kδε`; `a=1/2`; `k=2`: `−1/2`, `k=3`: `−5/4`; Morse output `−3/2`; `δ=1/2` gives `a=0` | holds | none |
| FK2.4 primitive classification (312) | cyclic support word | one chord output and one chord input force the same ordered pair; a Morse output needs `≥2` chord inputs to return | holds | none |
| FK3.1 monotone Checks (360–362) | equator, latitude circle, `ℝPⁿ` | `ω(S²)=4τ=2τ·2`; hemispheres `2τ=τ·2`, `N_L=2`; latitude: two discs, equal `μ=2`, unequal areas; `ℝPⁿ`: `N_L=n+1` | holds; exact-brane clause see R05 | R05 |
| FK3.1 index table (356) | disc `n=1,μ=2,b=1,i=0`; sphere `n=1,c₁=2` | `1+2+1−3=1`; `2+4−6=0` | holds | none |
| FK3.1 anchor windows (346–350) | simple disc, interior injective point `z_*` | `u(ζ)≠u(z_*)` for `ζ≠z_*` and `du(z_*)≠0`; ratio bounded below off a small ball by compactness of `Σ̄`, near `z_*` by the immersion estimate, so some finite `K` works | holds | none |
| FK3.1a reduction bound (370) | `D_actual=1,0` | `charest` line 2874: `2k(r(C))−1−(n−1)N` from `Ind(D∂̄u)≤−(ℓ−2)+1`; `D_actual=0` gives `2k_r−2−(n−1)N` | agrees | none |
| FK3.2 Liouville collar (408) | `ι_Zω=θ`, `ω=dθ` | `L_Zθ=d(θ(Z))+ι_Zω=0+θ`; `Φ_s^*θ=e^sθ`; `r=e^s`: `θ=rα`, `Z=r∂_r`; `dr∘J` on `Z,R_α,ker α` = `0,−r,0` = `−rα` | holds | none |
| FK3.2 cotangent primitive (408) | `θ=−λ`, `Z=p∂_p` | `ι_{p∂_p}(dq∧dp)=−p dq=−λ=θ` | holds | none |
| FK4.2 cup sign (446, 452) | degrees `(p,q)=(1,1)` | `m₂(a₂,a₁)≃(−1)^{pq}AW(a₁,a₂)`, sign `−1`; Leibniz `d AW(a₁,a₂)=AW(da₁,a₂)+(−1)^pAW(a₁,da₂)` | chain map | none |
| FK5.1 chart Checks (468–470) | `(ℝ,ℝ,1,x²)`; `ℤ/2` trivial | `vdim=1−1=0`; `s−ε` has zeros `±√ε` of signs `+,−`, count `0≠1`; weight `1/2` | holds | none |
| FK6.1 equator curvature (506, 510) | rank one over `𝔽₂`; signed | `1+1=0`; `W=T^A(z+z⁻¹)` at `z=1,T=1` is `0`; `(ε₊+ε₋)T^A` | matches `konstantinov` Def 2.2 | none |
| FK6.1 / FK8.0 `U=diag(1,2)` (512, 562, 567) | four sign patterns | `W=T^A diag(ε₊+ε₋, 2ε₊+ε₋/2)`; `E₁₂W−WE₁₂=(w₂−w₁)E₁₂=(ε₊−ε₋/2)T^AE₁₂`; values `1/2, 3/2, −3/2, −1/2`; `(+,+)` gives `diag(2,5/2)` | holds | none |
| FK6.2 integer weights (520) | `w(f)=−1`, `w(e⁺)=0`, `N_L≥2` | `m₁(f)` weight `−1+2−1=0`, positive terms have weight `≥2`; `m_k(f,…,f)` weight `2−2k≤−2<−1` | holds | none |
| FK8.0 hemisphere dimensions (562, 566) | equator | one-marked quotient `1+2−2=1`; path family `2`; `2c₁(S²)=4` excludes sphere bubbles in a Maslov-two total | holds | none |
| FK8.1 `π₂` vanishing and simply connected path components (574, 580) | genus `≥1`, `α,β` essential, non-isotopic | `π₂(Σ)=0`, `π₁(α)↪π₁(Σ)` gives `π₂(Σ,α)=0`; `π₁(P(α,β))=ker(ℤ²→π₁Σ)`, zero since `α^m∼β^n` with `(m,n)≠0` would make the primitive curves freely homotopic | holds | none |
| FK8.1 torus intersections (584, 588) | `f(t)=2t+½sin2πt` | `f=1` iff `sin2πs=4s` (`s=t−½`): `s=0,±¼` only (concavity on `(0,¼)`, `g′<0` on `(¼,½)`); `f=0` only at `t=0`; `f<2` on `[0,1)`; `f′=2+π,2,2−π,2≠0` | exactly four transverse points | none |
| FK8.1 lune areas and signs (584, 589) | lifts `y=1` and `y=f` | `∫_{¼}^{½}(f−1)dt=(¼−½)−(1/16−¼)+(1/4π)(1+0)=1/(4π)−1/16>0`; point reflection preserves `α,β,ω` and swaps `¼↔¾`; counterclockwise half-disc boundary gives `a→b` with `α`-arc `+x` (sign `+`) and `c→b` with `−x` (sign `−`) | holds | none |
| FK8.1 cohomology (584, 590) | `d b=T^A(a−c)`, `|b|=−1` | `H⁻¹=0` (`T^A` non-zero-divisor); `H⁰=Λ₀³/(T^A(a−c))≅Λ₀²⊕Λ₀/(T^A)` by basis `(z,a−c,c)`; localized rank 2; `ℤ³/(a−c)≅ℤ²` | holds | none |
| FK8.1 equal-sign negative control (589) | `d b=T^A(a+c)` | basis `(z,a+c,c)`: `H⁰≅Λ₀²⊕Λ₀/(T^A)`, same rank and torsion; `ℤ³/(a+c)≅ℤ²` | refutes the Check | R01 |
| FK8.1 negative control `β₀` (584, 591) | `β₀=(t,2t)` | `2t∈ℤ` at `t=0,½`; straight lifts cross once per level, no bigon; `Λ₀²` | holds | none |
| FK9.0 bound (607–609) | rank-one fibres; `T*Q`, `H=h∘π` | `dim_F HF≤#chords`; Morse inequality `#Crit(h)≥Σb_j(Q)` | holds for branes; paraphrase see R04 | R04 |
| FK9.2 losses (643, 655–657) | single moving-end family | forward loss `C_H+C_extra`; composite `≃ι_(0,2(C_H+C_extra))`; FOOO `‖H‖`, `2‖H‖` (`fooo-polydisks` line 1016–1020); identity comparison `F₁=id`, `F_k=0` | holds | none |

## Not verifiable

- McDuff–Salamon, *J-holomorphic Curves and Symplectic Topology*, second edition, Proposition 2.5.1 and §3.2: paywalled book, cited by locator only (the README marks it uncertified). I did not look for a copy outside the sources service.
- Lazzarini, *Relative frames on J-holomorphic curves*: not fetched; the decomposition statement was checked against Charest Theorem 4.1.4 only, as the README cites it.
- HamiltonianSystems Layers 1–2 were read at the head of its open pull request through the roadmaps tool; it is not in the merge order, so its direction relative to FukayaTheory is not mechanically checked.
- Ownership against open pull requests whose files the brief does not give was checked only through the roadmaps grep.

## Source issues

- none
