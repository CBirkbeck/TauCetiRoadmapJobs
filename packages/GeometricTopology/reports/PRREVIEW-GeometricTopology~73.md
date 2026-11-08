# Review of GeometricTopology (pull request #903 at 9f470e6)

**Verdict:** needs changes

This is a full review of `9f470e6`, which compacts `README.md` from 13,590 to 7,047 lines and turns 28 specific computations into named "Hypotheses". `Suggested.lean` is byte-identical to `8bd9871`. The merge from main moved the Tau Ceti pin in `lake-manifest.json` from `358314d` (7 Oct) to `2fd255d9` (4 Nov), which is 12,446 commits later. The gate fails (`tex=5`). Two new defects come from the compaction itself: a sign error and Check thinning. The named-hypothesis device produces one false hypothesis and several conditional targets whose hypothesis is their conclusion. At the new pin, four headlines that the module docstring calls "not statable" are statable, and several layers re-plan carriers that the pin already has.

## Previous findings

The review of `8bd9871` (r71) accepted the folder with no open finding. The finding it carried (R01 of r69/r70: the description names no order against #1517, #1791 and #1797) was settled by the repair report as "not actionable in this package". That reason still holds, because the description is not a file of the folder. The three conflicting heads are unchanged in `overlaps.md`. The finding is not raised again.

## R01 (P1) — Hypothesis 4.3.3 is false: the three-half-twist strip bounds the left-handed trefoil

**Location.** `TauCetiRoadmap/GeometricTopology/README.md:2210–2214`: "the map `((R+t cos(3s/2)) cos s, (R+t cos(3s/2)) sin s, t sin(3s/2))` … whose boundary, traversed for s from 0 to 4π, is the marked `T(2,3)` model of 4.11 and the realized closure of `σ₁³`".

**Claim.** The boundary of the strip is the positive trefoil, the closure of `σ₁³`. Section 4.2.8 pins `σ_i` as a positive crossing, and 4.11 pins `T(2,3)` as right-handed.

**Witness.** The xy-projection double points are at `s = π/3, π, 5π/3` (paired with `s+2π`). At `s = π/3` the over strand has tangent `−1.5ε e_r + R e_θ` and the under strand `+1.5ε e_r + R e_θ`, so `(over × under)·ẑ = −3εR < 0`. All three crossings are negative (writhe −3, confirmed numerically). The curve is therefore the closure of `σ₁⁻³`.

**Repair.** Change the third coordinate to `−t sin(3s/2)`; the numerical check of the reflected curve gives three crossings and writhe +3. Alternatively, keep the map and replace `σ₁³`/`T(2,3)` by `σ₁⁻³`/`T(2,−3)` throughout 4.3.3, including its canonical surface. The previous head stated the same identification as a target (old line 3830), so the target was false there too.

## R02 (P1) — §4.4.7 item 6 gives the positive two-band surface the negated Seifert matrix

**Location.** `README.md:2727–2729`: "Route: the two-disc/n-band surface has Seifert matrix `−B_(n−1)` (diagonal 1, superdiagonal −1) up to basis change".

**Claim.** That is the matrix of the positive model `L_n = closure(σ₁ⁿ)` in the native push-second convention. It contradicts `README.md:2061–2062` (the same model: "diagonal −1, superdiagonal 1") and the Conventions' trefoil matrix.

**Witness.** At `n = 3`, `[[1,−1],[0,1]]` has symmetrization `[[2,−1],[−1,2]]` (signature +2). `TauCeti.KnotTheory.trefoilSeifertMatrix = !![-1, 1; 0, -1]` (`TauCeti/KnotTheory/Alexander.lean:613`) has signature −2. Congruence preserves signature, so no basis change relates the two matrices.

**Repair.** Restore the previous head's wording (old line 4978): "Seifert matrix `V = −B_(n−1)`, where `B` has diagonal 1 and superdiagonal −1", that is, `V` has diagonal −1 and superdiagonal 1. The Conway formula of item 6 is unchanged by the repair, since `det(s⁻¹V − sVᵀ) = z² + 1` for both signs at `n = 3`.

## R03 (P1) — Conditional targets whose named hypothesis is the conclusion

**Location.**
- `README.md:3456–3466`: "Prove that neither F nor P determines the other on knots, assuming Hypotheses 4.6.1a and 4.6.1b". 4.6.1a is "equal P … and different Q"; 4.6.1b is "equal F and different P".
- `README.md:3496–3502`: "Prove σ(K)=−2 …", assuming 4.6.2b, which is "σ(V+Vᵀ)=−2".
- `README.md:3504–3509`: "prove ρ_K(l⁻¹,m)=ρ_K(l,m)", assuming 4.6.2c, which gives an explicit `ρ_K` visibly symmetric in `l ↔ l⁻¹`.
- `README.md:5775–5786`: "assuming Hypothesis 6.3, that it preserves neither the genus …", where 6.3 is "mutants … genus 2, … genus 3".

**Claim.** Each passage is stated as a target.

**Witness.** In each case the conclusion is the hypothesis, read through one definition. `Q = ev₁(F)`, so different Q means different F. The knot signature is `σ(V+Vᵀ)`. The hypothesised polynomial `(−2l⁻²−3−2l²)+(l⁻²+4+l²)m²−m⁴` is invariant under `l ↦ l⁻¹`. KT and the Conway knot are mutants with genera 2 ≠ 3. Nothing is left to prove.

**Repair.**
- Delete these four conditional targets and record each computed separation as a Check "(by evaluation)" on the object it tests, as the Scope says small computed values appear. For example, under 4.6.1 add "*Separation.* 8₈ and the mirror of 10₁₂₉ have equal P and different Q; 11a255 and 11a257 have equal F and different P".
- Keep the parts that do real work as targets: chirality of K from 6.2's signature theorem, the specialization maps of 4.4.5, and the concordance part of 6.3, which consumes Piccirillo.
- The data are right: the closure of `b=[1,1,1,−2,−1,−1,3,−2,3]` has Jones polynomial `t³−t²+t−1+t⁻¹−t⁻²+t⁻³` and Alexander polynomial `−t⁻²+2t⁻¹−1+2t−t²`, and 4.6.2c's `ρ_K` maps to `∇ = 1−2z²−z⁴` and to that Jones polynomial.

## R04 (P2) — Four headlines are statable at the pin `2fd255d9` but declared not statable

**Location.** `TauCetiRoadmap/GeometricTopology/Suggested.lean:39–41, 49`: "Li's rank-versus-genus theorem (Layer 9.2): there is no Heegaard genus; … the Weeks manifold …: there is no Weeks manifold; Property P, Property R …: there is no Dehn filling; … Kneser–Milnor …: there is no connected sum of manifolds". The README makes the same claims at `README.md:6034–6035` (Weeks) and `README.md:6486` (Li).

**Claim.** These carriers are missing at the pins.

**Witness.** At `2fd255d9` the pin has:
- `TauCeti.LiRankGenusTheorem` (`LowDimTopology/Heegaard/RankGenus.lean:138`);
- `TauCeti.GabaiMeyerhoffMilleyTheorem` (`Geometry/Manifold/Riemannian/Hyperbolic/Weeks.lean:77`);
- `TauCeti.DehnFilling` (`LowDimTopology/DehnSurgery/Filling.lean:164`);
- `TauCeti.IsPrimeManifold` and `TauCeti.IsIteratedConnectedSum` (`Geometry/Manifold/ConnectedSum/Prime.lean:217, 277`).

**Repair.** Add the following, which elaborate against the pin with `sorry` as the only warning (scratch files, tested):
- `theorem li_rank_genus_theorem : TauCeti.LiRankGenusTheorem.{u}`;
- `theorem gabai_meyerhoff_milley : TauCeti.GabaiMeyerhoffMilleyTheorem.{u}`;
- Kneser–Milnor existence: for `M` with `[T2Space M] [CompactSpace M] [ConnectedSpace M] [ChartedSpace (EuclideanSpace ℝ (Fin 3)) M] [IsManifold (𝓡 3) ∞ M] [TauCeti.Orientable (𝓡 3) M]`, there are `k` and `P : Fin k → Type u` with T2 charted instances, `∀ i, TauCeti.IsPrimeManifold 3 (P i)` and `TauCeti.IsIteratedConnectedSum 3 P M`. State uniqueness with it, up to order and diffeomorphism.
- Property P: for `K : TauCeti.SmoothCircleEmbedding (𝓡 3) S³` not `SmoothAmbientIsotopic` to `TauCeti.unknot` (as `singleton`s), `h : TauCeti.IsSolidTorusNeighborhood (⇑K) Φ`, `s` with `slopeEquiv h.framedBoundaryTorus s ≠ OnePoint.infty`, and `F : TauCeti.DehnFilling h s Y`, conclude `¬ SimplyConnectedSpace Y`.
- Property R the same way.

Add the four imports and correct the docstring:
- the cyclic surgery theorem keeps its entry only if no slope-distance carrier exists at the pin;
- Kondo's entry should say that the pinned unknotting number is the `GridLink` one;
- Cerf's entry should cite `TauCeti.CerfTheorem` and `TauCeti.SmaleConjecture.cerfTheorem` as the reason it is not stated separately.

Update `README.md:20` ("the fourteen of these"), 7.4 and 9.2 to match.

## R05 (P2) — Layers re-plan carriers and theorems that the pin `2fd255d9` already has

**Location.** `README.md:271`, "### From Tau Ceti (commit 2fd255d9)", lists none of the declarations below. The layers own them as targets:
- §1.4 (`:690`, "Define the connected sum … Prove that the result is independent");
- §3.3's disc theorem (`:1246`);
- §3.4's Cerf statement (`:1263`);
- §§5.1–5.3 (exterior, filling, cosmetic definitions, Mathieu, `:1275–1350`);
- §7.4 ("Define the Weeks manifold", `:6023`);
- §8.2 ("Define … prime", `:6128`);
- §§9.1–9.2 (Heegaard splitting, genus, `rank ≤ g`, `:6448–6478`).

**Claim.** These are owned here. The Scope adds that "None of these is planned again here".

**Witness.** At the pin:
- `TauCeti.ConnectedSum` (`ConnectedSum/Basic.lean:140`), `ConnectedSum.nonempty_diffeomorph_of_isOrientationReversingAt` (`Independence.lean:116`), `OrientedConnectedSum.nonempty_diffeomorph_sphere` (`Oriented.lean:295`);
- `SmoothEmbedding.exists_smoothIsotopy_of_det_chartAt_mul_pos` (`SmoothIsotopy/DiscTheorem.lean:78`);
- `TauCeti.CerfTheorem` (`Diffeomorphism/Cerf.lean:77`);
- `knotExterior`, `DehnFilling`, `IsChirallyCosmetic`, `MathieuChirallyCosmeticTheorem` (`Cosmetic.lean:316`);
- `IsWeeksManifold`;
- `IsPrimeManifold`;
- `HeegaardSplitting`, `heegaardGenus`, `rank_fundamentalGroup_le_heegaardGenus` (`Heegaard/FundamentalGroup.lean:322`).

**Repair.** List these under *From Tau Ceti* with their files. Rewrite the listed targets to consume them, keeping only what the pin lacks: for example, existence of Heegaard splittings, Haken's lemma, Mathieu's family for `k ≥ 1`, and the general-dimension surgery if `SphereSurgery.lean` does not already give it. Check §§1.5 and 6.1 likewise against `SmoothEmbedding/NormalSpace/` and `KnotTheory/Slice/TopologicalGenus`.

## R06 (P3) — The gate fails on TeX syntax

**Location.** `README.md:4541`, "3 ≢ 2^{±1}"; `README.md:4737`, "B(c) = σ₂^{c₁} σ₃^{−c₂} σ₂^{c₃} ⋯ σ₂^{c_n}".

**Claim.** The README is in house style.

**Witness.** My gate run reports `tex=5 … FAIL`, exit 1; every other check is 0.

**Repair.** Put both expressions in code spans: `` `3 ≢ 2^(±1)` `` and `` `B(c) = σ₂^c₁ σ₃^(−c₂) σ₂^c₃ ⋯ σ₂^c_n` ``.

## R07 (P3) — The compaction cut Checks below three in 110 of 126 layer sections

**Location.** Throughout. Sampled sections, with Check bullets at `8bd9871` in brackets:
- 1.3: 2 (4)
- 1.4: 1 (5)
- 1.6: 2 (5)
- 3.1: 1 (5)
- 5.1: 2 (4)
- 6.1: 2 (4)
- 10.1: 1 (4)
- 4.10.4: 1 (3)

**Claim.** Every definition keeps at least three discriminating Checks.

**Witness.** Counting `**Checks.**` bullets per subsection: 41 layer subsections have one, 69 have two and 16 have three or more. At `8bd9871`, 8 of 133 subsections had fewer than three.

**Repair.** Restore at least three discriminating Checks for each defined object, for example from the previous head's lists. Where the dropped Checks were the computations that are now named hypotheses, R03's repair turns those into Checks.

## R08 (P3) — "Hypothesis" is an undefined category, and some conclusions are used unconditionally

**Location.** The Conventions (`README.md:177–236`) define no named hypotheses, yet 28 occur (for example `:5507`, "Prove `u(8₃) = 2`, assuming Hypothesis 5.4.2"). `README.md:3395–3396` states without condition "the Kinoshita–Terasaka and Conway knots share both, and are told apart by their genera (Layer 6.3)". The Layer 6 Examples (`:5829–5830`) list "the Whitehead double of the trefoil as topologically but not smoothly slice".

**Claim.** Every statement is a target, a Check or a cited supplier.

**Witness.** A named hypothesis is none of these. 6.3 and 6.4 make the genera and the non-sliceness conditional, while 4.6 and the Examples assert them.

**Repair.** Add a Conventions bullet: what a named hypothesis is (a finite identification or computation about a specific diagram, not a target), and that every statement using it carries it as an explicit premise. Make the two unconditional uses conditional, or cite their owners.

## R09 (P3) — Hypothesis 6.4 does not fix which Whitehead double it means

**Location.** `README.md:5812–5814`: "The untwisted Whitehead double of the trefoil is not smoothly slice: its `τ`-invariant is `1`".

**Claim.** The hypothesis determines its object.

**Witness.** By Hedden's formula (`τ(D₊(K,t)) = 1` iff `t < 2τ(K)`), the negative-clasp untwisted double of the right-handed trefoil has `τ = 0`, and so does the positive-clasp double of the left-handed trefoil.

**Repair.** Name it as 4.11.3's `W = W_(+,0)(T)`, with `T = T(2,3)` right-handed.

## R10 (P3) — Two sampled sections cite no source for their theorems

**Location.** §4.2.9 (`README.md:1865–1923`): figure-eight amphichirality and invertibility, and the trigonometric model. §4.10.4 (`README.md:4676–4704`): the Whitehead component exchange.

**Claim.** Every claim has a locator.

**Witness.** Neither section contains an external citation; all references are internal (4.2.2, 4.4.2, 5.1, 4.11, 4.15).

**Repair.** Add a textbook locator for each classical symmetry (amphichirality and invertibility of `4₁`; interchangeability of the Whitehead link's components), or say in one clause that the section proves them from the stated constructions, with a source for the parametrization.

## R11 (P3) — Reeb stability is stated without orientability

**Location.** `README.md:6521–6524`: "if a transversely oriented codimension-one foliation of a closed connected `3`-manifold has a compact leaf with finite fundamental group, then that leaf is a sphere, the manifold is `S² × S¹`".

**Claim.** The theorem holds for closed connected 3-manifolds.

**Witness.** The product foliation of `ℝP² × S¹` is co-oriented and has a leaf `ℝP²` with finite `π₁`, and so does the sphere fibration of the nonorientable `S² ×̃ S¹`. Calegari's Theorem 4.5 (p. 142) assumes a spherical leaf, under his standing convention that manifolds are oriented and co-oriented.

**Repair.** Read "closed connected orientable `3`-manifold", matching the definition at `:6516`.

## R12 (P3) — Heading typo

**Location.** `README.md:3481`: "### 4.6.2 Mirror-symmetric polynomials and the chirality of9₄₂".

**Repair.** Insert the missing space ("of 9₄₂"). The anchor slug changes; no file links to it (`grep` of main and of the open heads' READMEs).

## Verified sound

**Gate, dependencies, build** (my runs on `9f470e6`):
- Gate: `set_option=0 … tex=5 … outside-folder=0 source-material=0 FAIL`, exit 1; tex is the only failure (R06). The worker's gate also reports `build=0`.
- Dependency check (`--depcheck … --movable`): `depcheck: 238 roadmaps, 2349 edges, 0 problem(s)`, with no UPWARD, CYCLE or `moved:` line.
- `git diff --stat origin/main...HEAD` outside the folder: empty.
- `lake env lean Suggested.lean`: exit 0, exactly 18 `declaration uses sorry` warnings.

**Lean signatures.**
- A scratch copy with `#check @…` for all 18 theorems printed types identical in content to the previous reviews', for example:
  - `sphere_theorem : ∀ (M : Type u_1) … [T2Space M] [SecondCountableTopology M], (∃ A, IsOrientedAtlas (𝓡 3) ⊤ A) → ∀ x, Nontrivial (π₂) → ∃ f, IsClosedEmbedding ⇑f ∧ IsLocallyFlat … ∧ ∀ y, ¬ f.Homotopic (const y)`;
  - `waldhausen_theorem` with both `horM`, `horN` and both Haken hypotheses;
  - `nonempty_homeomorph_sphere_of_simplyConnected` with `[CompactSpace M] [T2Space M] [SecondCountableTopology M] [SimplyConnectedSpace M]`.
- No section binder is lost; there are no `variable`s.
- Padding probe: no pinned declaration has the type of any headline. A `grep` for `theorem … : (AnnulusConjecture|SmaleConjecture|…|TriangulationConjecture)` finds only `triangulationConjecture_zero`, and no `IsSphereBoundsBall (sphere …)` lemma. So no headline closes with one library lemma, and none is padding.
- R04's added statements elaborate in scratch files with only `sorry` warnings.

**Pinned names.** All 216 backticked `TauCeti.*` names of the README resolve at `2fd255d9` (my sweep; 14 are module or scoped names). I opened `trefoilSeifertMatrix`/`figureEightSeifertMatrix` (`Alexander.lean:613, 630`), `CerfTheorem`, `LiRankGenusTheorem`, `GabaiMeyerhoffMilleyTheorem`, `DehnFilling`, `IsPrimeManifold`, `IsIteratedConnectedSum`, `MathieuChirallyCosmeticTheorem` and `hasPerfectCommutatorSubgroup_unknot`. The README's pin text "commit 2fd255d9" equals the manifest pin.

**Overlaps and citations.**
- `overlaps.md` reports no id dropped and none defined only by an open revision.
- Section ids old → new: `comm` of the heading numbers of `8bd9871` and `9f470e6` is empty both ways.
- The three legacy anchors that RealAnalyticGeometry, KhovanovHomology and RiemannianGeometry cite are mapped at `README.md:536–545`.
- `roadmaps resolve` finds nothing unresolved.
- Supplier roadmaps DifferentialGeometry, HopfRinow (Completed), TypeAHeckeAlgebras, ReductiveGroups and SuccessiveMinima are on main.
- I did not open sibling checkouts this round. The compaction adds no owned object (the Scope's Layer 1 bullet only adds 1.7/1.7.2 surfaces, which were already owned), so ownership against open pull requests rests on `overlaps.md` and the previous rounds.

**Seeded sample** (all 15 opened; locators in the bullets below and the table):
- §6.1: `livingston2005` line 130 (p. 4), Theorem 2.2 — the concordance classes form a countable abelian group under connected sum with the unknot as identity; its `−K` is the README's reversed mirror `−K̄`. Right.
- §10.1: Calegari, author's PDF, Theorem 4.5 on p. 142, Reeb stability for a co-oriented foliation with a spherical leaf. It supports the statement under orientability; see R11. Theorems 4.35 (Novikov–Rosenberg: irreducible, incompressible leaves, essential transversals) and 4.38 (Palmeira), and §4.6 "Novikov's theorem" (p. 161), match 10.2.
- §4.4.8: Hoste, arXiv 1907.03812, Theorem 1 (attributed to Minkus) is the alternating sum `Σ_k (−1)^k t^{ε₀+⋯+ε_k}` with `ε_i = (−1)^⌊ip/q⌋`, `0<p<q`, `p` odd, `q` the determinant. With the README's swap (`q*` odd, fold `q′=2p−q*` when `q*>p`) this is the README's `ε_i=(−1)^⌊iq/p⌋`, and its `s₀=0` shifts by one `t`, as stated. §4 is the Fox-calculus derivation.
- The other locators of the sample are in uncertified texts (*Not verifiable*). Their mathematics is checked in the table.

**Adversarial table** (values computed this round; "calc" means an exact Kauffman-bracket/Burau computation in scratch, calibrated on `σ₁³ ↦ t+t³−t⁴` and the Knot Atlas 3₁ and 6₁ PD codes).

| Statement | Instances | Values computed | Result |
| --- | --- | --- | --- |
| 1.3 gluing Checks | solid tori by id / swap; double of `[0,∞)` | `S¹×S²` (π₁ ℤ), `S³` (π₁ 1); `ℝ` noncompact | right |
| 1.4 connected sum | n=1; `T²#T²`; `ℂP²#±ℂP²` | ℝ#ℝ two lines, ℝ#S¹ a line, S¹#S¹ a circle; `χ = χ(M)+χ(N)−(1+(−1)ⁿ)` from Mayer–Vietoris, `T²#T²`: −2; forms diag(1,1) sig 2, diag(1,−1) sig 0 | right |
| 1.6 PL Checks | `x+x³`; interpolation of `n²` | second derivative `6x≠0` off 0; slopes `2n+1` unbounded | right |
| 1.7.1 Veronese and counts | unit `v`, `w⊥v`; word counts | `‖vvᵀ−I/3‖=√(2/3)`; `‖dQ_v w‖²=3‖w‖²`; frame ⊥ P; `V−E+F=2−2p−q−r`; two tetrahedra `7−12+8=3`; p=q=1: χ=−1, k=3 | right |
| 3.1 C¹-only Check | `θ+k⁻²sin kθ` | first derivative `1+k⁻¹cos kθ → 1`; second derivative sup 1 | right |
| 4.2.2 | `Mβ`, Jones (calc) | `Mβ=γ` (Burau, faithful on B₃); `V(γ)=t³+t⁶−t⁷+t⁸−t⁹+t¹⁰−t¹¹`, `V(β)=V(γ)(t⁻¹)` | right |
| 4.2.3 sampled | stevedore, five-strand unlink | `V(z)=t⁻²−t⁻¹+2−2t+t²−t³+t⁴` = KA 6₁ at `t⁻¹`; `w=(σ₁σ₂)(σ₃σ₄)(σ₁σ₂)⁻¹` in B₅ | right |
| 4.2.9 sampled | Hyp. 4.2.9, braid identities | double points `t_k=kπ/2−π/3`, heights ±√3/2, Gauss word 1231 4324, writhe 0 (numeric); `(x,−y,−z)K(t)=K(−t)`, axis at t=0,π; `h m(β) h⁻¹=β`, `ΔaΔ⁻¹=b` | right; no locator (R10) |
| 4.3 Checks | trefoil V, `P=diag(2,1)` | `−Vᵀ=[[1,0],[−1,1]]`; `PᵀVP=[[−4,2],[0,−1]]`, `det(Vᵀ−V)=4`; raw genus `(n−s+1)/2` | right |
| Hyp. 4.3.3 | strip boundary | 3 crossings, all negative, writhe −3; repaired map writhe +3 | false (R01) |
| 4.3.1, 4.3.2 Checks | `xy`, `x²+xy+y²`; one disc / two bands | Arf 0, Gauss sum 2; Arf 1, −2; annulus r=2 / Möbius k=1; interleaved g=1 r=1, nested g=0 r=3 | right |
| Hyp. 4.4.2 and cofactor | closure of `σ₁σ₂⁻¹σ₁σ₂⁻¹` | traversal O0 U1 O3 U0 O2 U3 O1 U2, signs +−+−; normalized matrix left kernel `(1,−t,1,−t)`; `D₄=−t³+3t²−t` | right |
| 4.4.4 | `V` four-band | `Δ=64t²−272t+417−272t⁻¹+64t⁻²`: Δ(1)=1, Δ(−1)=1089; LDL diag `4,−41/4,180/41,−121/20`, σ=0; `V−Vᵀ` symplectic | right |
| 4.4.7 | continuants; `C₄`; cinquefoil maps | `D₂=1−t+t²=F₃`; `C₃=z²+1`, `C₄=z³+2z`; `x=b⁻²a`, `y=a⁻¹b³` | right; item 6 matrix sign (R02) |
| 4.4.8 sampled | K(5,7); 14 Conway words; D | signs −++−, walk 0,−1,0,1,0, `P=3−t−t⁻¹`; all 14 `[c]` evaluate to the stated `p/q′`; `tat=ata=(−e₁,1)`; no 2-subset of the order-18 group generates it | right |
| 4.4.9 | `z=(xy)³` | `=(xyx)²`, abelianization 6, `λ₊=zx⁻⁶ ↦ 0` | right |
| 4.5 Checks | `T(3,4)`, Hopf (calc) | `t³+t⁵−t⁸`; `−t^{1/2}−t^{5/2}` | right |
| 4.5.1 | 3/4-strand formulas; threshold word (calc) | σ₁σ₂: 1; σ₁³σ₂: `t+t³−t⁴`; σ₁³σ₂σ₃ identity both sides `t⁴+t²−t−t⁻¹+t⁻²+t⁻⁴`; e=9, `Δ` as stated, `Δ(ζ)=36−13√5≈6.931`; Squier minors 1, 1/2; 1, 0.618, 0.236 | right |
| 4.5.2 sampled | support bound | weight `(−1)^{p+q}u^{p−q+r₊−r₋}`, `c≤n+r₊+r₋` ⇒ `[p−3q−n+1, 3p−q+n−1]`; σ₁²: bound [1,7] ⊇ {1,5}; empty word reaches ±(n−1) | right |
| 4.5.3 | `T(2,4)` (calc); W; Clifford kernel | `V(i;u₄)=√2` (Arf 1); `(1−t³)(1−t)=1−V_trefoil`; `F₃` kernel vanishes since `d₀d₁+d₁d₀=0` | right |
| 4.5.4 | trefoil states | h(0,2)=h(3,3)=1, h(1,1)=h(2,2)=3 (mirror as stated); bracket `−A⁵−A⁻³+A⁻⁷`; `ac+b=−a³` | right |
| 4.5.5 | b41, σ₁⁻⁹ (calc); `R_c` | `F` as stated, F(1)=1, F(−1)=49; `E` = Jones of σ₁⁻⁹, E(−1)=9; `R_c(1)=3+c`, `R_c′(1)=2+c`, `R_c(−1)=15−c` | right |
| 4.5.6 sampled | `g_i`, traces, roots | `tr g_i^{±1}=−1/δ`; eigenvalues `u³`, `−u`, d-th powers `−i` (k=2d, d odd); at k=3 `g_i↦−1`, σ₁σ₂ ↦ 1 | right |
| 4.5.7 | full twist; cubic knot | block weights 1/9, 1/9, trace `(−4+5)/9`; `(−i)⁴=1`, five-cycle | right |
| 4.6, 4.6.1 | trefoil P, F, Q; Hopf | `P=2v²−v⁴+v²z²`, at v=1: `t−1+t⁻¹`; recursion gives F as stated, `Q=2x²+2x−3`, Jones image `A⁻⁴+A⁻¹²−A⁻¹⁶`; mirror Hopf `a⁴F` | right; 4.6.1 target vacuous (R03) |
| 4.6.2 sampled | b (calc), ρ_K | `V=G`, `Δ=−t⁻²+2t⁻¹−1+2t−t²`; ρ_K ↦ `1−2z²−z⁴` and `G` | data right; σ and ρ targets vacuous (R03) |
| 4.6.5 | two-tangle algebra | `(1−μ²)N(ST)` identity expanded; adjacent `det=l⁻²(1−μ²)`; ports (03)(12), (01)(23), (02)(13) | right |
| 4.7–4.7.7 | colourings, labels | trefoil 18 six-colourings, (0,2,4) valid; `sts=tst`, `s²t=(14)`, ⟨s,t⟩=S₄; `(ab)²a=b(ab)²`, `⟨a³,b³⟩` of order 6; census 6+96+24=126; `det(W−tWᵀ)=A(1−t)²+t` | right |
| 4.8.3 | b (calc); deficits | 20 letters, e=0, `V(b)=V(T)V(T)(t⁻¹)`; `5n+2+n−4=6n−2=2(3n−1)` | right |
| 4.10, 4.10.3 | cf, switch triples | cf([2,0])=1/2, cf([0,0])=∞; nine triples `|p| ∈ {3,5,9,11,17,19,29}`; E: (29,6) → (1,2) | right |
| 4.10.4 sampled | Whitehead | cf([2,1,2])=8/3; reorientation `s₀s₁` invariant | right; no locator (R10) |
| 4.11.2 | `V_(ε,m)` | `S_εVS_εᵀ=[[−ε,1],[0,m]]`; `C_ε(−Vᵀ)C_εᵀ=V_(−ε,−m)`; `det(tV−Vᵀ)=t−εm(t−1)²`; `QV_(+,1)Qᵀ=[[1,1],[0,−1]]` = pinned matrix | right |
| 4.12, 4.12.1, 4.13 | Burau; `V₂` | `σ₁σ₂⁻¹=Δ⁻¹σ₂(σ₂σ₁)`; `[a²,b²]=(ab⁻¹)³`, `β₃=b(ab⁻¹)³b⁻¹`; `det(V₂−tV₂ᵀ)=−(1−t)⁴+t²`; solver β=(−1,2), α=(−1,3) | right |
| 5.1 sampled | exterior | `H₁=ℤ`; framing `λ+nμ`; empty link gives S³ | right; Rolfsen unread |
| 6.1 sampled | Livingston Thm 2.2 | line 130 as quoted; trefoil σ −2 vs mirror +2 | right |
| 6.4 | Hedden τ | positive-clasp RHT double 1; negative clasp 0 | ambiguous (R09) |
| 10.1 sampled | Calegari 4.5 | spherical leaf ⇒ `S²×S¹`; `ℝP²×S¹` | orientability (R11) |
| Headlines, 18 stated | `#check` | types as in the README; none proved at the pin | right |
| Headlines declared not statable | pin carriers | Li, GMM, Property P/R, Kneser–Milnor elaborate | statable (R04) |

## Not verifiable

- **Hirsch, *Differential Topology*** (§1.3 Ch. 8 §2; §1.4 Ch. 4 Thm 6.6; §3.1 Ch. 2 §1) is uncertified, so I read no text. Note that §1.4 cites Ch. 4 Thm 6.6 and §3.3 cites Ch. 8 Thm 3.1 for the disc theorem; the two locators may both be right but cannot be compared.
- **Palais 1960**, **Rourke–Sanderson Ch. 2** (§1.6), **Rolfsen Ch. 2 §E / Ch. 9 §F and Appendix C** (§§5.1, 4.4.8), **Lickorish's textbook**, and **Lickorish 1965** (§10.1, Annals) are not in the manifest or are paywalled; I did not fetch them.
- **Jones 1985** (§§4.5.2, 4.5.6; the README's erratum on Corollary 24): ams.org returned 403 and the Project Euclid page was empty. The README's counterexample is confirmed by computation (`Δ(ζ)≈6.931>6.5` for a four-braid knot), but the wording of Jones's Corollary 24 and Theorem 5 is unread. Jones 1983, Wenzl 1988 and Goodman–de la Harpe–Jones (§4.5.6) are paywalled.
- **Knot Atlas pages** (§§4.2.3, 4.4.8, 4.6.2) were not fetched. Their 3₁ and 6₁ data were reproduced from PD codes by computation.
- **Banchoff's and Levine's pages** (§1.7.1) are cited as illustrations only and were not fetched.
- **`kauffman1990`** is an image-only scan (already listed by the worker).
- I did not compare the `Suggested.lean` statements with the README beyond the 18 types and R04. The previous rounds' orientation and atlas analysis stands, since the file is unchanged.

## Source issues

- none
