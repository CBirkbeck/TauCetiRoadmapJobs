# Review of ExponentialSumsAndCircleMethodPartII (pull request #2138 at d01cb8f)

**Verdict:** needs changes

:robot: AI review (claude-opus-5-5). One P2 and four P3 findings; the mathematics, the sampled locators and every supplier citation check out (see Verified sound).

## R01 (P2) — The §11.12 compact-open obstruction can be stated at the pins but is missing from `Suggested.lean`

Location: `TauCetiRoadmap/ExponentialSumsAndCircleMethodPartII/Suggested.lean:26–29`: "End winding, the compact-open double-loop obstruction … (§§11.9–11.12, 13.2) lack the space of continuous maps from the complex projective line to the projective closure of `X` with prescribed germ at infinity, its topology and local lifts". README line 3 lists §11.12 as an end theorem. The description makes the same claim: "`Suggested.lean` states the two headline theorems that are statable at the pins".

Claim: §11.12 is not statable at the pins.

Witness: every carrier exists natively at the pin: `Projectivization.instTopologicalSpace` (`Mathlib/Topology/Algebra/Projectivization.lean:44`), compact-open `C(·,·)` with its subtype topology, `Asymptotics.IsBigO`, `FundamentalGroup`, `GenLoop (Fin 2)` (`Mathlib/Topology/Homotopy/HomotopyGroup.lean:98`) and `ContinuousMap.HomotopyEquiv`. The block below, put into a copy of this `Suggested.lean` before its final `end`, elaborates with `lake env lean` with no warning except `sorry`. It has no sorry'd data, no `set_option`, and every definition has a real body.

Repair: add this block (or an equivalent) under a `/-! ## Layer 11 … -/` comment. Name `PrescribedGerm` and `Hco` in README §§11.1–11.2 and `compactOpen_germ_obstruction` in §11.12 and in the README introduction (line 7). Remove §§11.9–11.12 from the docstring's list of statements that cannot be stated, keeping §13.2 (it needs singular/ℓ-adic compact-support comparison and the trace pairing), and update the description sentence quoted above. Tested: the block below.

```lean
/-! ## Layer 11: infinity germs and the compact-open obstruction -/

open Projectivization Asymptotics Filter Topology

/-- The affine cubic Fermat hypersurface `Σ x_j³ = 1` in `ℂ⁴⁰`. -/
def fermat : Set (Fin 40 → ℂ) := {x | ∑ i, x i ^ 3 = 1}

/-- Its projective closure `Σ x_j³ = x₀³` in `ℙ⁴⁰(ℂ)`, homogenizing coordinate `0`. -/
def fermatClosure : Set (Projectivization ℂ (Fin 41 → ℂ)) :=
  {p | ∑ i : Fin 40, p.rep i.succ ^ 3 = p.rep 0 ^ 3}

/-- The finite point `[T : 1]` of the projective line. -/
def finitePt (T : ℂ) : Projectivization ℂ (Fin 2 → ℂ) :=
  mk ℂ ![T, 1] (fun h => by simpa using congrFun h 1)

/-- The point `[1 : z]`; at `z = 0` it is `∞`. -/
def nearInfty (z : ℂ) : Projectivization ℂ (Fin 2 → ℂ) :=
  mk ℂ ![1, z] (fun h => by simpa using congrFun h 0)

/-- The prescribed-germ condition (7.1): finite points go to the affine part, and near `∞` the
map has a homogeneous lift `(z^d + O(z^(d+1)), x + O(z))`, with constants depending on the map. -/
def PrescribedGerm (d : ℕ) (x : Fin 40 → ℂ)
    (F : C(Projectivization ℂ (Fin 2 → ℂ), fermatClosure)) : Prop :=
  (∀ T, (F (finitePt T)).1.rep 0 ≠ 0) ∧
  ∃ w : ℂ → Fin 41 → ℂ,
    (∀ᶠ z in 𝓝[≠] 0, ∃ hw : w z ≠ 0, mk ℂ (w z) hw = (F (nearInfty z)).1) ∧
    (∀ i : Fin 40, (fun z => w z i.succ - x i) =O[𝓝[≠] 0] fun z => z) ∧
    (fun z => w z 0 - z ^ d) =O[𝓝[≠] 0] fun z => z ^ (d + 1)

/-- The compact-open prescribed-germ space `Hco` (subspace compact-open topology). -/
def Hco (d : ℕ) (x : Fin 40 → ℂ) : Type :=
  {F : C(Projectivization ℂ (Fin 2 → ℂ), fermatClosure) // PrescribedGerm d x F}

instance (d : ℕ) (x : Fin 40 → ℂ) : TopologicalSpace (Hco d x) := instTopologicalSpaceSubtype

/-- The leading vector `(1, ζ, 0, …, 0)`. -/
def leadVec (ζ : ℂ) : Fin 40 → ℂ := Pi.single 0 1 + Pi.single 1 ζ

/-- **Compact-open obstruction** (README §11.12): `π₁(Hco)` surjects onto `ℤ` by end winding, and
`Hco` is not homotopy equivalent to `Ω²X`, which is simply connected. -/
theorem compactOpen_germ_obstruction (ζ : ℂ) (hζ : ζ ^ 3 = -1) (x₀ : fermat) :
    (∃ g : Hco 2 (leadVec ζ),
        ∃ φ : FundamentalGroup (Hco 2 (leadVec ζ)) g →* Multiplicative ℤ,
          Function.Surjective φ) ∧
      ¬ Nonempty (ContinuousMap.HomotopyEquiv (Hco 2 (leadVec ζ))
        (GenLoop (Fin 2) fermat x₀)) := by
  sorry
```

## R02 (P3) — The roadmap is called "part II", but no part I exists

Location: `README.md:1` ("# Roadmap: exponential sums and the circle method, part II"), the folder name and the `TauCetiRoadmap.ExponentialSumsAndCircleMethodPartII` namespace.

Claim: a "Part II" extends an existing roadmap, and its introduction says where the base stops.

Witness: there is no `ExponentialSumsAndCircleMethod` folder on main (4ec889e), on the board, in `ORDER.txt` or among the 438 open roadmap pull requests (`roadmaps list`), and the README names no base roadmap. The port report already listed this as unresolved for a maintainer.

Repair: rename the roadmap without "part II" (folder, heading, namespace, merge-order line), for example `GeometricCircleMethod` / "# Roadmap: the geometric circle method for polynomial maps to hypersurfaces". If the rename is left to a maintainer, say so in the pull-request description.

## R03 (P3) — The §4.3 locator says BS20's proof of Proposition 2.6 uses the ceiling; it prints the floor

Location: `README.md:451`: "(BS20, §2, Lemma 2.4(3), p.903; used with the ceiling in §5, proof of Proposition 2.6, p.934; BS20 line 453.)"

Witness: BS20 line 1845 (p. 934) sets m₀=⌊kd/2⌋−1. The README's own §9.3 (line 1145) says "with ceiling in place of the printed floor". At L=9, ⌊9/2⌋−1=3, which misses A₅∖A₄ (b₅=1 gives rank H₄=5).

Repair: "(BS20, §2, Lemma 2.4(3), p.903; applied in §5, proof of Proposition 2.6, p.934, where the printed floor ⌊kd/2⌋ has to be replaced by the ceiling, see §9.3; BS20 line 453.)"

## R04 (P3) — The §7.1 Stacks line numbers belong to a chapter the manifest does not record

Location: `README.md:858`: "(STACKS, §12.24 (012K), Lemma 12.24.13 (0BK5), STACKS line 2964 and line 3202 (Homology).)"

Witness: the manifest's STACKS entry records only the More on Morphisms chapter. In that text, STACKS line 2964 is Lemma 37.22.6 (045T, Cohen–Macaulay base change) and line 3202 is a proof fragment. The cited lines are right in the separate Homology chapter text (012K at its line 2965, 0BK5 at line 3202), but that text is not in the manifest. The statements and tags themselves are correct.

Repair: drop the two line numbers, giving "(STACKS, Homology, §12.24 (012K), Lemma 12.24.13 (0BK5).)", because tags are stable locators. Alternatively record the Homology chapter's text under the existing STACKS key.

## R05 (P3) — Three headings refer to the source or use jargon instead of naming the mathematics

Location: `README.md:1542` "### 11.12 Compact-open interpretation of Lemma7.2 fails in the main range" (also missing a space); `README.md:1236` "### 10.3 Original sharp comparison target, explicitly gated"; `README.md:1678` "### 13.2 Conjecture 7.1 fails for the compact-open germ space in the Fermat example".

Witness: the house rule is that a roadmap's organisation is named by its mathematics. "Original … explicitly gated" says how the target came about rather than what it states.

Repair: "### 11.12 The compact-open germ space is not homotopy equivalent to Ω²X"; "### 10.3 Comparison in the sharp range under the sharp minor-arc hypothesis"; "### 13.2 Trace perfection fails for the compact-open germ space in the Fermat example". Keep the BS20 Lemma 7.2 and Conjecture 7.1 locators in the body text.

## Verified sound

**Gate, build and dependencies.** I re-ran the push gate on this head: every scanner is 0 and the result is OK. The worker's `gate.md` also records build=0. My own `lake env lean` of `Suggested.lean` gives only the two `sorry` warnings (lines 109 and 135). The dependency check prints `depcheck: 235 roadmaps, 2132 edges, 0 problem(s)`, with no UPWARD or CYCLE line. Nothing outside the folder changes.

**Lean form.** The header is `module` / `public import Mathlib`, the most common form on main (30 roadmaps). There is no `set_option` and no sorry'd data. All 6 definitions have real bodies and each is needed by one of the two headlines. I compared the 8 elaborated `#check @` types against the README: no binder is dropped, and `hrange` elaborates as `↑k − 1 < ↑(d/(k−1)) * (↑n/2^k − ↑k + 1)` in ℚ, which is tδ>k−1.

**Padding probe.** I tried `simp`, `omega`, `positivity` and `exact le_refl _` on both theorems in scratch copies. None closes either (`simp` leaves goals open), so neither is padding.

**Supplier citations resolved (all present at the cited place).**
- On main: SchemeAndStackFoundations §§0.2, 0.3, 0.7, 0.8, 0.9 and 5.12 (`bezout_inequality`); its open revision keeps these ids. EtaleCohomologyFoundations F.0.1, F.0.2, 0.6, 0.7, F.1, F.2.4–F.2.7, F.3, F.4.1–F.4.6 and F.5–F.6; its open revision keeps all 18 ids. AlgebraicTopology Stages 4, 6 and 8, which its README maps to Layers 4, 6 and 8 at line 876. DGFloer Layer 1 item 1 and Layer 2 items 2–3 (the open revision keeps them as §1.1 and Layer 2 items 1–3). ClassicalArithmeticCompletion §6.44.
- At open heads earlier in the order: FourierDeligneTransform §§2.2, 2.4, 2.5, 2.8, 3.4, 5.3 and Conventions (Lang torsor, nondegenerate ψ). EtaleDualityAndPerverseSheaves §0.4 (bold target *Top-degree compactly supported cohomology of a variety*), §0.6, §§3.2–3.8, 4.1, 4.3, 4.6 and 4.7 (hypersurface formula). InverseGaloisAndArithmeticFundamentalGroups IG.5.1 and IG.5.7 (bold targets *Ordered and unordered configurations* and *Finite-cover criteria for full monodromy image*) and IG.0.T4. DeligneWeightsAndPurity §§8.1 and 8.8. SieveMethodsAndPrimePatterns §5.4 (bold target *Uniform algebraic point counts*). LefschetzPencilsAndVanishingCycles §§5.1, 5.8 and 5.10. AlgebraicTopologyPartII §§2.1, 3.5, 4.1, 4.2, 5.1 and 5.4.

**Declared gaps.** gap:sf-fibre-strata and gap:lpv-universal-monodromy are precise, minimal and declared in both plan.json and the README. The plan's other ten gap slugs are no longer used: the README cites existing sections instead (the FourierDeligneTransform, EtaleDualityAndPerverseSheaves §0.4 and AlgebraicTopologyPartII sections above), and owns the symmetric-lattice shrinking in §1.5. GeometryOfNumbersAndQuadraticArithmeticPartII line 8 excludes polynomial lattices over Laurent-series fields, so there is no second owner. Announcing those ten gaps would be moot; this is not a finding.

**Library declarations opened at the pins (file:line, as the README cites them).** `MvPolynomial.eval₂Hom` Eval.lean:158, `MvPolynomial.pderiv` PDeriv.lean:61, `homogeneousComponent` Homogeneous.lean:512, `Matrix.rank` Rank.lean:134, `LaurentSeries` LaurentSeries.lean:101, `RatFunc.inftyValuation` Valuation.lean:83, `fwdDiff` ForwardDiff.lean:40, `Ideal.height_le_spanRank_toENat_of_mem_minimalPrimes` KrullsHeightTheorem.lean:185, `Nat.forall_exists_prime_gt_and_modEq` PrimesInAP.lean:463, `legendreSym.quadratic_reciprocity` :107 and `at_two` :60, `CategoryTheory.Abelian.SpectralObject` Basic.lean:41, `ContinuousMap.curry` CompactOpen.lean:430, `nonempty_inter_closedPoints` JacobsonSpace.lean:105, `LocallyOfFiniteType.jacobsonSpace` FiniteType.lean:112, `AddCircle.windingNumberIso` :49 and `windingNumber_eq_div` :61, and the Tau Ceti `Circle.fundamentalGroupMulEquiv` :334 and `_expLoop` :431. 20 declarations, all present with the stated meaning.

**Duplication audit.** There is no Hankel matrix, function-field lattice, successive minima over 𝔽_q((T⁻¹)), polar count or germ space at either pin. Tau Ceti's `fwdDiff` iterates use a single increment, so they do not duplicate §8.1. `roadmaps grep` for Browning–Sawin, the geometric circle method, Hankel rank, closed-point detection, the affine dimension theorem and count-to-dimension found no second owner. AlgebraicTopologyPartII's scope leaves mapping-space comparisons to their analytic owners. The overlaps tool reports no dropped ids and no other open pull request touching this folder.

**Seeded sample, checked against the text (15 of 15 hold).** Where pdftotext prints ">" for "⩾", I read the sign from gs renders of BS20 pp. 894, 913, 934, 939 and 944.
- 1.1: BV15 Lemma 2.8, BV15 line 530, p. 12; LR14v2 Thm 1.1 (line 124), Thm 2.1 (line 144), Prop 2.3 and its proof (lines 169, 231). The slicing proof runs in the original coordinates.
- 2.1: BS20 line 639; the choice of ℓ is implicit in Cor 2.9.
- 3.3: BS20 lines 1141 and 1232; Lemma 4.2.
- 4.1 and 4.4: Definition 2.3 and Lemma 2.4(4), BS20 lines 459–475.
- 5.1: Lemma 3.3, line 818. The README's form is the stalk-vanishing statement its proof gives.
- 5.5: Lemma 3.5, line 967, including the Koszul swap.
- 7.2: Prop 2.5(2), line 559.
- 7.4: Prop 4.1 and Lemma 4.3, lines 1323 and 1389, plus the eigenvalue argument at lines 1513–1517.
- 8.5: lines 1831–1835.
- 9.4: lines 1848–1887. The printed chain bounds the wrong side; see Source issues.
- 10.6: lines 219–233.
- 11.7, 11.10 and 12.2: original statements whose BS20 setting (lines 2149–2194) is cited as such. I checked their mathematics in the table.

**Adversarial table** (values computed on both sides).

| Statement | Instances | Values | Result |
|---|---|---|---|
| `minor_arc_polar_count` (§8.9) | k=3, n=1, d=m=2, b 3=1 (α=T⁻⁴) | polarCount: ∂-condition on (u,v)=(a+bT,c+eT) is be=0, count Q²(2Q−1)=2Q³−Q²; RHS (k−1)ⁿQ^(4−1)=2Q³; rank H₂=3>2 (anti-diagonal minor −1) | holds |
| same | b=0 over 𝔽₅; f=Y³ over 𝔽₃ | 625>250 but rank 0 ≤ 2 excluded; 81>54 but `k<ringChar` fails | hypotheses needed |
| same, exponent | ℕ-subtraction | n⌊m/(k−1)⌋ ≤ nkd/(2(k−1)) ≤ dn(k−1) for k≥2 | no truncation |
| same, x and lower terms | x∉{f₀=0} | `residuePhase` uses coefficients r≤kd−1 only; degree-k part in a is f₀(A(T)), x-free | any x valid, as README says |
| `polarCount` = N(α) | char>k | k!·M(a,y¹,…) linear in a, zero function iff coefficients T⁻¹…T⁻ᵈ of αΨ_j vanish | holds |
| `mapping_geometrically_irreducible` (§10.8) | n=40, k=3, d=2 | t=1, δ=3, tδ=3>2, D=74 | in range |
| same | n=24, k=3, d=2 | tδ=1, not >2 | excluded (BS20's printed (1.1) would admit it) |
| same, redundancy | hd, hn | tδ>k−1>0 forces t≥1 (d≥k−1) and δ>0 (n>2ᵏ(k−1)) | harmless |
| §1.5 shrinking | q=5, γ=0, a=c=s=1; γ=T⁻², a=4, c=1, s=1 | 5≤5·1; q³ ≤ q^(1+1)·q | holds, equality |
| §1.3 count | diag(T⁻²,T), s=−1 | deg c₁<3, c₂=0: q³ = max(1,q³)·max(1,1) | holds |
| §1.4 | diag(T,T⁻²) | minima q⁻², q; adjoint q⁻¹, q² | holds |
| §2.1 / §2.2 | p=5, ℓ=19; ℓ=2, p=13 | 19≡−1, order 2; 2⁶≡−1 mod 13, order 12 | holds |
| §3.3 | Y₁(Y₁−1); Fermat | f₀=Y₁² singular, excluded; X̄ smooth and connected | holds |
| §3.4 phase | Y₁³−Y₂³+1, d=1, x=(1,1) | b₁(a³−c³+1)+3b₂(a²−c²)+3b₃(a−c) | matches |
| §4.1/§4.3 (R03) | L=9, b₅=1 | H₄ 5×5 anti-identity, det +1, rank 5>4; H₅ has 4 rows; printed m₀=3 misses m=4 | README right, locator wrong |
| §4.4 | b=(1,2,4), L=3, m=1 | 1/(T−2)=T⁻¹+2T⁻²+4T⁻³, exact | holds |
| §5.1 | m′<m, ∂₁f₀(P)≠0 | deg F=d−m+m′+(k−1)d, leading coefficient ∝ λ | holds |
| §5.4 | BS20 p.913 | E[−2n(d−m)](−n(d−m)) versus printed [+2n(d−m)] | README right |
| §5.14 | degree bookkeeping | a−(m+2nd−mn) = a+m(n−1)−2nd | matches BS20 Lemma 4.4 |
| §6.3 | Fermat cubic over 𝔽₂₅ | #Z=801, primitive trace 150=6·25; ranks 6+10=16=2⁴ | holds |
| §6.5 | (k,n₁)=(3,3), (4,3) | N₁=6, 21 by the EtaleDualityAndPerverseSheaves §4.7 formula | holds |
| §7.4 | p=7, ℓ=2, n=5, k=3 | ord₇2=3 odd; column eigenvalues (−1)ᵐ, d₁ from +1 to −1 | vanishes |
| §7.1 (R04) | two stages | d₁ bidegree (1,0); finite filtration meets 0BK5 | holds |
| §8.5 | Spec 𝔽_{q²} | no 𝔽_q-point, a 𝔽_{q²}-point | 𝔽_q alone insufficient, as stated |
| §8.7 | f₀=Y³; a²; a³ | Ψ=6uv, V_Ψ two lines (dim 1, degree 2); −2ay; +6auv | holds |
| §8.10 | Spec 𝔽_{q²} | counts 0,2,0,2,…; r=2j forces c≥0 | holds |
| §9.4 | k=3, d=4, n=24 | B(4)=168+20=188, B(5)=168+24=192; conservative cutoff 192, printed 188 | conservative right |
| §10.2/§10.5 | n=40, k=3, d=2 | range i>−4; bands [−37,−37], [−75,−74]; i=−1 in none, so H_c^147=0 | holds |
| §10.6 | n=40 | 1−2·38·37=−2811; a nonzero d_r needs m≥r(n−3)+2≥76>d | holds |
| §10.9 | f=Y₁^(k−1)Y₂+ΣY_jᵏ+1 | only common zero of ∇f₀ is 0 (char>k); n=2 gives 1=0 | holds |
| §11.7 | s=0, 1, 3r/2 | σ=1, 1, −1; a^3(1+ζ³)+1=1; \|a_s(T)\|=\|T\|^d | holds |
| §11.10 | F, F·F, F·F̄, constant | winding −1, −2, 0, 0; tube lemma on I×S¹ | holds |
| §11.12 (R01) | Fermat cubic in ℂ⁴⁰ | X≃∨2⁴⁰S³⁹, π₂=π₃=0, so π₁Ω²X=0, versus π₁Hco↠ℤ | holds; statable |
| §12.2 | \|w−1\|<1/2, t, χ∈[0,1] | \|1+(1−tχ)(w−1)\| > 1/2; w=−1 has \|w−1\|=2 | holds |
| §12.3 | X=S², constant β | fibre Map_*(S²,S²), components ℤ=π₂S² | holds |

## Not verifiable

- Lee's thesis, Lemma 3.3.5, which BS20 quotes for the strict-ball count in §1.3. I did not read it. The README cites it only through BS20 line 2063, and the count was checked by computation above.
- Ownership was checked against the open roadmap pull requests whose heads this brief supplies, plus `roadmaps grep` over all 438.

## Source issues

- **Gap** in BS20 at end of §5, proof of Proposition 2.6, p. 934: the source says c(m)+4(m+1) ⩾ c(m)+4(k−1)⌊m/(k−1)⌋+4 and concludes vanishing above the smaller side; it should keep the remainder 4(r+1), m=(k−1)q+r, giving the cutoff 2dn+4(k−1)−4tδ; affects a stated result.
- **Error** in BS20 at end of §5, proof of Proposition 2.6, p. 934: the source says the minor arcs are the strata d≤m≤⌊kd/2⌋−1; it should say ⌈kd/2⌉−1, since for odd kd the stratum A_⌈kd/2⌉∖A_⌊kd/2⌋ is nonempty; affects the proof.
- **Misprint** in BS20 at proof of Lemma 3.4, p. 913: the source says Rϱ_!ℚ_ℓ = ℚ_ℓ[2n(d−m)](−n(d−m)), twice; it should say ℚ_ℓ[−2n(d−m)](−n(d−m)), as the projection-formula line below uses; affects nothing.
- **Gap** in BS20 at Proposition 2.5(3) and Proposition 4.1, pp. 905 and 922: the source states odd-page vanishing assuming only a smooth leading form and char>k; it should also assume n⩾3 and (k,n)≠(3,3),(3,4), which Lemma 4.3 needs; affects a stated result.
- **Error** in BS20 at Lemma 7.6, p. 944: the source assumes n⩾2; it should assume n⩾4, since for n=3 and N>0 Ω²X has infinitely many components while the product predicts dim H⁰=1; affects a stated result.
- **Gap** in BS20 at Theorem 1.1, condition (1.1), and Corollaries 1.4/2.9, pp. 894 and 907–908: the source allows ⌊d/(k−1)⌋(n/2ᵏ−k+1) ⩾ 1; it should require >1, since degree i=0 must lie in i>−4(tδ−1) (fails at k=3, n=24, d=2); affects a stated result.
- **Gap** in BS20 at the deduction of Theorem 1.1 after Theorem 2.7, p. 906: the source spreads out over the ring generated by the coefficients of f and calls Spec K its generic point; it should also adjoin the coordinates of P, and Spec K only maps to the generic point; affects the proof.
- **Gap** in BS20 at Lemma 7.2, pp. 940–941: the source leaves the topology of Hom_{d,P}(ℂ,X) unspecified and deforms by convex combinations without a uniform germ bound; it should fix a topology with uniform control, since for the compact-open topology an end-winding loop gives π₁↠ℤ in the cubic Fermat example; affects a stated result.
