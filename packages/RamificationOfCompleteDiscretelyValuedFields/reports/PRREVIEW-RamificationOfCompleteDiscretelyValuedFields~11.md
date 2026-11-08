# Review of RamificationOfCompleteDiscretelyValuedFields (pull request #1410 at e40279d)

**Verdict:** needs changes

This is a full review: the folder changed by 428 lines since 42d223e. 42d223e is an ancestor of e40279d, and the pins (`lake-manifest.json`, `lean-toolchain`) are unchanged.

- **Gate.** I reran it at this head, and every check passes (`set_option=0 … depcheck=0 metadata=0 stray-files=0 dirty=0 outside-folder=0 source-material=0 OK`).
- **Dependency check.** `depcheck: 239 roadmaps, 2351 edges, 0 problem(s)`, with no UPWARD or CYCLE line. The roadmap is line 2 of the merge order, after JacobianChallenge.
- **Elaboration.** `lake env lean TauCetiRoadmap/RamificationOfCompleteDiscretelyValuedFields/Suggested.lean` exits 0. Its only output is eight `declaration uses sorry` warnings, at lines 66, 115, 134, 155, 201, 219, 243 and 268.
- **Outside the folder.** `git diff --stat origin/main...HEAD` lists no file outside the folder.
- **Gaps.** There is no `design/plan.json`, so no gaps are declared.

There are five findings: three P2 and two P3. R02 and R03 need no change in this folder: their repairs belong to the other pull requests.

## Previous findings (review at 42d223e)

- **R01 (P2), the §4a.1 headlines were absent: repaired.** `Suggested.lean` lines 180–256 now state:
  - `absoluteUpperRamificationGroup`;
  - `absoluteUpperRamificationGroup_zero`, with no hypothesis on `O`;
  - `map_restrictNormalHom_absoluteUpperRamificationGroup`, under DVR, `IsAdicComplete` and `PerfectField` on `O ∩ K`;
  - `topologicalClosure_iSup_absoluteUpperRamificationGroup`, which states `G_K^(0+) = P_K`. This is option (a) of the repair.

  README lines 708–718 name all four. The not-statable list (`Suggested.lean` lines 37–48) keeps only §4a.2's open-subgroup identity and §4a.3. The reason it gives for the first is wrong; see R01 below.
- **R02 (P2), ClassFieldTheory #1411 owns the absolute upper groups: not repaired.** #1411 is still at 71f458c, and the description still says "#1411 consumes its §4a.1 absolute filtration". It is raised again as R02.
- **R03 (P2), PadicExtensionFamilies #1713 builds `ψ_(L/K)`: not repaired.** #1713 is still at f85522c. It is raised again as R03.
- **R04 (P2), layer citations of LocalFieldsRamification: repaired.** README lines 26–29 now read "cited through the Tau Ceti declarations that prove its results, by name and by file …, and not by its layer numbers". No `Layer k` citation of LocalFieldsRamification remains: the only `Layer` hits are ReductiveGroups Layer 3 and PadicExtensionFamilies Layer 2.
- **R05 (P3), the Serre 1961 locator lacked "totally ramified": repaired.** README lines 730–733 now read "the paragraph after Proposition 3, printed p. 128, … for totally ramified extensions". The same qualifier is in the docstrings at `Suggested.lean` lines 84, 100 and 179.
- **R06 (P3), the separable-closure comparison was uncited: repaired.**
  - The proof, README lines 737–741: "Restriction `G_K → Gal(K^s/K)` … is Tau Ceti's isomorphism of topological groups `TauCeti.absoluteGaloisGroupRestrictEquiv`".
  - *Needs*, lines 793–794.
  - The Tau Ceti contract, lines 168–176.
  - A Check at lines 822–825.
- **R07 (P3), suppliers that nothing consumes: partly repaired.**
  - The README is repaired. Lines 1013–1018 now read "LocalFieldsRamification → this roadmap", with only consumed sections named, and no "Profinite" or "EtaleCohomology" remains.
  - The pull-request description is not repaired; see R05.

## R01 (P2) — §4a.2's open-subgroup identity is statable at the pins, and the docstring's reason is wrong

**Location.**
- `Suggested.lean` lines 38–42: "`G_L` is the open subgroup … of `G_K` fixing `L`, whereas the absolute filtration over `L` is built on Mathlib's `Field.absoluteGaloisGroup L`, which … is related to that subgroup only through a noncanonical isomorphism".
- README lines 259–264, which say the same.

**Claim.**
- Both pinned libraries already provide the map from `G_L` onto the subgroup of `G_K` fixing `L`. The noncanonical choice is carried as an argument.
- So the open-subgroup identity, a headline in the Summary (lines 14–16) and the layer table (line 24), is statable but absent.
- The review at 42d223e accepted this reason. The two declarations below are new evidence against it.

**Witness.**
- Mathlib `Mathlib/FieldTheory/AbsoluteGaloisGroup.lean:59` defines `Field.absoluteGaloisGroup.mapOfAlgebra K L : G_K L →ₜ* G_K K`, given `[Algebra (AlgebraicClosure K) (AlgebraicClosure L)]`.
- Tau Ceti `FieldTheory/Galois/AbsoluteGaloisGroup/FiniteExtension.lean:252` defines `TauCeti.absoluteGaloisGroupExtend`, which is "the absolute Galois group of a finite extension inside that of `K`".

**Repair.**
1. Add the following after `subgroupOf_upperRamificationGroup`, with a docstring stating the identity, its source (Serre 1961 n° 3.1, Proposition 4 and the Remarque, p. 128) and the role of the embedding instances:

   ```lean
   theorem comap_mapOfAlgebra_absoluteUpperRamificationGroup (K : Type*) [Field K]
       (O : ValuationSubring (AlgebraicClosure K))
       [IsDiscreteValuationRing (O.comap (algebraMap K (AlgebraicClosure K)))]
       [IsAdicComplete (IsLocalRing.maximalIdeal (O.comap (algebraMap K (AlgebraicClosure K))))
         (O.comap (algebraMap K (AlgebraicClosure K)))]
       [PerfectField (IsLocalRing.ResidueField (O.comap (algebraMap K (AlgebraicClosure K))))]
       (L : IntermediateField K (AlgebraicClosure K)) [FiniteDimensional K L]
       [Algebra (AlgebraicClosure K) (AlgebraicClosure L)]
       [IsScalarTower K (AlgebraicClosure K) (AlgebraicClosure L)]
       [IsScalarTower L (AlgebraicClosure K) (AlgebraicClosure L)]
       (O' : ValuationSubring (AlgebraicClosure L))
       (hO' : O'.comap (algebraMap (AlgebraicClosure K) (AlgebraicClosure L)) = O)
       (M : FiniteGaloisIntermediateField K (AlgebraicClosure K)) (hLM : L ≤ M.toIntermediateField)
       (u : ℝ) (hu : -1 ≤ u) :
       (absoluteUpperRamificationGroup K O u).comap
           (Field.absoluteGaloisGroup.mapOfAlgebra K L).toMonoidHom =
         absoluteUpperRamificationGroup L O'
           (herbrandFun
             ((IntermediateField.fixingSubgroup (IntermediateField.restrict hLM)).subgroupOf
               ((O.comap (algebraMap M (AlgebraicClosure K))).decompositionSubgroup K))
             (O.comap (algebraMap M (AlgebraicClosure K)))
             (inverseHerbrandFun ((O.comap (algebraMap M (AlgebraicClosure K))).decompositionSubgroup K)
               (O.comap (algebraMap M (AlgebraicClosure K))) u)) :=
     sorry
   ```

2. Name the theorem in README §4a.2's third bullet (line 851).
3. Add `Field.absoluteGaloisGroup.mapOfAlgebra` and `IntermediateField.restrict` to the Mathlib contract and to §4a.2's *Needs*. Optionally add Tau Ceti's `TauCeti.absoluteGaloisGroupExtend` as the model of `G_L ≤ G_K`.
4. Delete the first bullet of the not-statable list (`Suggested.lean` lines 38–45). Rewrite README lines 259–264 so that only §4a.3 is named as not statable.

**Tested.**
- The block above, appended to a scratch copy of this head, elaborates with exit 0 and only `sorry` warnings.
- The one-tactic probe (`rfl | simp | infer_instance | aesop | norm_num | (ext; simp)`) leaves it open.
- On `ℚ_3 ⊂ ℚ_3(ζ_3) ⊂ ℚ_3(ζ_9)` at `u = 3/2`, the shift is `φ_H(ψ_G(3/2)) = φ_H(5) = 3`. Both sides restrict to `1` at the level `M`, as row 33 shows.

## R02 (P2) — ClassFieldTheory #1411 still owns the absolute upper groups that §4a.1 owns

**Location.**
- README lines 99–107: "The absolute upper ramification groups `G_K^u` of a nonarchimedean local field … are §4a.1's".
- `Suggested.lean` line 180 (`absoluteUpperRamificationGroup`).
- The description: "#1411 consumes its §4a.1 absolute filtration".

**Claim.**
- At #1411's head, 71f458c and unchanged, ClassFieldTheory Layer 7 still defines `absoluteUpperRamificationGroup K n` on local fields.
- It also claims, as its own targets, its finite projections and `G_K^0` = inertia. These are §4a.1's statements at integer depths.
- So the object has two owners, and the two files now declare theorems with the same short names in different namespaces.

**Witness.** `roadmaps show ClassFieldTheory --pr 1411`:
- README line 178: "owned here (Layer 7, `absoluteUpperRamificationGroup`)";
- README lines 1449–1458;
- `Suggested.lean` line 1459: `noncomputable def absoluteUpperRamificationGroup (n : ℕ)`.

**Repair.** No change in this folder. In #1411:
1. Replace "are owned here (Layer 7, …)" with a citation of RamificationOfCompleteDiscretelyValuedFields §4a.1.
2. Delete `isClosed_absoluteUpperRamificationGroup`, `absoluteUpperRamificationGroup_normal`, `absoluteUpperRamificationGroup_antitone`, `map_restrictNormalHom_absoluteUpperRamificationGroup` and `absoluteUpperRamificationGroup_zero` as targets.
3. Keep the definition only as far as its reciprocity headline needs it, with a docstring identifying it with §4a.1's `G_K^n`.

Until then, the description should say that #1411 *is to cite* §4a.1.

**Tested.** On `ℚ_2 ⊂ ℚ_2(ζ_8)`, both definitions give `G`, `{1, 5}` and `1` at `n = 1, 2, 3` (row 19).

## R03 (P2) — PadicExtensionFamilies #1713 still constructs §4a.2's non-Galois `ψ_(L/K)`

**Location.** README lines 103–107 (Scope) and §4a.2, lines 837–854.

**Claim.**
- This roadmap claims the function, its independence of `M`, its tower law, the subgroup identity and the integral formula. It is merge-order line 2, against line 394 for #1713, so it is the right owner.
- #1713 (f85522c, unchanged) still constructs the same function and does not cite this roadmap.

**Witness.** `TauCetiRoadmap/PadicExtensionFamilies/README.md` at #1713:
- lines 275–276: "The non-Galois Herbrand construction is §2.0 here";
- lines 712–725: the definition `ψ_{L/K} := φ_{M/L} ∘ ψ_{M/K}`, independence of `M`, the tower law, the subgroup identity and the integral formula.

**Repair.** No change in this folder. In #1713, replace §2.0's construction and the sentence at line 276 with a citation of RamificationOfCompleteDiscretelyValuedFields §4a.2. Its Checks may stay there as consumer Checks.

**Tested.** On `ℚ_3 ⊂ ℚ_3(ζ_3) ⊂ ℚ_3(ζ_9)`, both definitions give `ψ_(L/K)(u) = 2u` (rows 28 and 33).

## R04 (P3) — The graded-norm Check over `F_p` is false as worded

**Location.** README lines 619–622: "whereas over `F_p` an additive polynomial with kernel of order `p` is not surjective on residue points."

**Claim.**
- An additive polynomial over `F_p` acts on `F_p` as `λ ↦ (Σ aᵢ) λ`. So it is either zero or bijective there, whatever the order of its kernel over `F̄_p`.
- The Check holds only because, for this extension, the kernel lies in `F_p`.

**Witness.** Over `F_3`, take `P(λ) = λ³ − 2λ`.
- Its kernel `{0, ±√2}` has order `3`.
- On `F_3`, `P(λ) = −λ`, which is bijective.

**Repair.** Replace the clause with: "whereas over `κ = F_p` its kernel, the image of `G_1/G_2` under the graded character, consists of `p` points of `F_p`, so on `F_p`-points the graded norm is zero and misses the `p − 1` nonzero classes."

**Tested.** The §3a.1 Check computes the graded character of the generator of `y^p − y = t⁻¹` as `−1 ∈ F_p`. So the kernel is all of `F_p`, and the map on `F_p` is `0` (row 40).

## R05 (P3) — The description's dependency and merge-order paragraphs are stale

**Location.** The pull-request description, *Dependencies*:
- "the completed roadmaps LocalFieldsRamification, ProfiniteProPGroups and ProfiniteCohomology on main; EtaleCohomologyFoundations §F.3a (§4a.1's tame inertia)";
- *Merge order*: "#1411 consumes its §4a.1 absolute filtration".

**Claim.**
- The README consumes nothing from ProfiniteProPGroups, ProfiniteCohomology or EtaleCohomologyFoundations.
- §4a.1 now uses Mathlib's `ValuationSubring.inertiaSubgroup`.
- #1411 defines its own absolute upper groups (R02).

**Witness.** Searching the README for "Profinite", "EtaleCohomology" and "ProPGroup" finds nothing. Its dependency order (lines 1013–1018) names only LocalFieldsRamification, ReductiveGroups, SchemeAndStackFoundations, AdicSpacesPartII and ReductiveGroupsPartII.

**Repair.** Make the *Dependencies* paragraph read: "Mathlib and Tau Ceti at the pins; LocalFieldsRamification (through Tau Ceti); ReductiveGroups Layer 3, SchemeAndStackFoundations §0.24, AdicSpacesPartII §R0.19.9 and ReductiveGroupsPartII §RG2.0.4, all on main." Make the merge-order sentence say that #1411 is to cite §4a.1.

**Tested.** After the edit, every roadmap the description names has a consumed section in the README's supplier contracts.

## Verified sound

**Adversarial pass.** There are 40 rows, all computed at this head. Notation:
- `Z8` is `ℚ_2(ζ_8)/ℚ_2`, with `#G_0..#G_4 = 4, 4, 2, 2, 1`.
- `Z9` is `ℚ_3(ζ_9)/ℚ_3`, with `#G_0..#G_3 = 6, 3, 3, 1`.
- `S3` is `ℚ_3(ζ_3, ∛3)/ℚ_3`, with `G_0 = S_3`, `G_1 = G_2 = G_3 = C_3` and `G_4 = 1`.
- `AS` is `y^p − y = t⁻¹` over `k((t))`.
- `I2` is `F_2(s)((t))(y, w)` from the §3a.2 Check, with `L₁ = K(y)` and `H = Gal(M/L₁)`.
- `CpCp` is the §3a.1 monogenicity example `F_p(s,u)((t))(z₁, z₂)`.

| # | Statement | Instances tried | Values computed | Result | Change |
|---|---|---|---|---|---|
| 1 | Hilbert (Lean 66) | `Z9` | `Σ(#G_i − 1) = 5 + 2 + 2 = 9`; disc exponent of `ℚ(ζ_9)` is `3·(6 − 2 − 1) = 9`, `f = 1` | agrees | none |
| 2 | same | `Z8` | `3 + 3 + 1 + 1 = 8`; disc exponent of `ℚ(ζ_8)` is `4·(6 − 3 − 1) = 8` | agrees | none |
| 3 | same | `G = 1` | invariants give `A ≅ B`; `differentIdeal = ⊤ = 𝔪^0`, `Σᶠ = 0` | agrees | none |
| 4 | same, separability dropped | `CpCp`, `p = 2` | `differentIdeal = (f₁′(z₁) f₂′(z₂)) = (t^(2(p−1)))`, so `d = 2`; every `i(σ) = 1`, `Σ = p² − 1 = 3` | hypothesis needed | none |
| 5 | `herbrandFun` (Lean 85) | `Z8` | integrand `1` on `(0,1]`, `1/2` on `(1,3]`, `1/4` after: `φ(1) = 1`, `φ(3) = 2`, `φ(7) = 3` | agrees with Checks | none |
| 6 | same, below `−1` | unramified quadratic | integrand `2` on `(−2,−1]`: `φ(u) = 1 + 2u` there, `φ(−2) = −3`, `ψ(−2) = −3/2` | statements restricted to `≥ −1` | none |
| 7 | `upperRamificationGroup` (Lean 101) | `Z8`, `v = 3` | `G^3 = G_7 = 1`, while `G_3 = {1, 5}` | wrong model `G_v` excluded | none |
| 8 | Herbrand (Lean 115) | `S3`, `H = C_3` | `v = 0`: `S_3 ↦ C_2 = (G/H)_0`; `v = 1/2`: `ψ_G = 1`, `G_1 = C_3 ↦ 1`; `ψ_(G/H)(1/2) = 1`, `(G/H)_1 = 1` | agrees | none |
| 9 | same | `Z8`, `H = {1, 7}`, `v = 2` | `G^2 = G_3 = {1,5} ↦ G/H`; `√2 ↦ −√2` moves by `v(2√2) = 3`, so `(G/H)_2 = G/H`, `φ = id` on `[0,2]`, `(G/H)^2 = G/H` | agrees | none |
| 10 | same, separability dropped | `I2` | all `i(σ) = 2`: `G^(1/2) = G_1 = G ↦ G/H`; `(G/H)_1 = 1`, `ψ_(G/H)(1/2) = 1`, `(G/H)^(1/2) = 1` | hypothesis needed | none |
| 11 | tower (Lean 134) | `Z9`, `H = C_3`, `u = 5` | `φ_G(5) = 9/6 = 3/2`; `φ_H(5) = 9/3 = 3`; `φ_(G/H)(3) = 3/2` | agrees | none |
| 12 | same | `S3`, `H = C_3`, `u = 5` | `φ_G(5) = 11/6`; `φ_H(5) = 11/3`; `φ_(G/H)(11/3) = 11/6` | agrees | none |
| 13 | same, separability dropped | `I2`, `u = 1` | `φ_(M/K)(1) = 1`; `φ_(L₁/K)(φ_(M/L₁)(1)) = φ_(L₁/K)(1) = 1/2` | hypothesis needed | none |
| 14 | Hasse–Arf (Lean 155) | `Z9` | jump `j = 0`: `6 ∣ 0`; `j = 2`: `6 ∣ 3 + 3`; non-jump `j = 1`: `6 ∤ 3` (excluded by `hj`) | agrees | none |
| 15 | same | `Z8` | `j = 1`: `4 ∣ 4`; `j = 3`: `4 ∣ 4 + 2 + 2`; non-jump `j = 2`: `4 ∤ 6` | agrees | none |
| 16 | same, commutativity dropped | `S3` | `j = 3`: `3 + 3 + 3 = 9`, `6 ∤ 9` | `IsMulCommutative` needed | none |
| 17 | same, not totally ramified | `ℚ_9(ζ_3)/ℚ_3`, `G = C_2 × C_2` | `G_0 = C_2`, `G_1 = 1`; only `j = 0`: `2 ∣ 0` | agrees | none |
| 18 | same, infinite residue field | `AS` over `F̄_p((t))` | `G_0 = G_1 = C_p`, `G_2 = 1`; `j = 1`: `p ∣ p` | agrees | none |
| 19 | `absoluteUpperRamificationGroup` (Lean 180) | `ℚ_2`, level `Z8`, `u = 1, 2, 3` | `ψ = 1, 3, 7`; images `G_1 = G`, `G_3 = {1,5}`, `G_7 = 1` | agrees with Check; same values as #1411's | R02 |
| 20 | `_zero` (Lean 201) | `O = AlgebraicClosure K` (trivial) | `O ∩ M = M`, `𝔪 = 0`, `G_0 = Ideal.inertia G ⊥ = 1` (faithful); `σ` acts on the residue field `K̄` as itself, so inertia `= 1` | agrees | none |
| 21 | same | `ℚ`, `O` over `ℤ_(5)`, `M = ℚ(i)` | conjugation swaps `(2+i)`, `(2−i)`: `D_M = 1`, both sides restrict to `1` at `M`; `⋂ restrict⁻¹ D_M = D(O)` by the `q`-power argument | agrees | none |
| 22 | same | `Frac W(F̄_p)` | residue field of `O` is `F̄_p`, fixed by every `σ`: inertia `= D(O) = G_K`; every level is totally ramified, `G_0 = Gal(M/K)` | agrees | none |
| 23 | same | `ℚ_p`, Frobenius lift `F` | at `ℚ_p(ζ_(p²−1))` `G_0 = 1` and `F|_M ≠ 1`; on the residue field `F` is `x ↦ x^p ≠ id` | `F` outside both sides | none |
| 24 | same, inseparable `x` | `F_p((t))`, `x = t^(1/p)` | `x^p = t ∈ K`, `(σx − x)^p = σt − t = 0`, so `σx = x` | the `q`-power step is sound | none |
| 25 | finite projections (Lean 219) | `ℚ_2`, `Z8`, `u = −1, 3/2` | `G_K^(−1) = G_K ↦ G = G_(−1)`; `ψ(3/2) = 2`, `G_2 = {1, 5}` | agrees | none |
| 26 | same, perfectness dropped | `I2` | image of `G_K^(1/2)` lies in `Gal(M/L₁)`, order `2`; `Gal(M/K)^(1/2) = G_1`, order `4` | hypothesis needed (docstring) | none |
| 27 | same | `M = ⊥` | both sides are trivial subgroups of `Gal(K/K) = 1` | agrees | none |
| 28 | `0+` (Lean 243) | `Frac W(F̄_p)`, level `K(ζ_p)` | `G_1 = 1`, so both sides map to `1`; `G_K^0` maps onto `C_(p−1)` | `G^(0+) ≠ G^0` | none |
| 29 | same | `ℂ((t))` | every level is tame, `G_1 = 1`: right side `1`; `G_K^w = 1` for `w > 0`, closure `1` | agrees | none |
| 30 | same | `AS` over `F̄_p((t))`, level `K(y)` | `φ(w) = w` on `[0, 1]`, so `Gal^w = G_1 = C_p` for `0 < w ≤ 1` | both sides map onto `C_p` | none |
| 31 | subgroup identity (Lean 268) | `S3`, `#H = 2`, `u = 1, 2` | `ψ_G(1) = 2`, `G_2 ∩ H = 1`, `φ_H(2) = 1`, `H^1 = H_2 = 1`; `ψ_G(2) = 6`, `φ_H(6) = 3`, `H^3 = H_6 = 1` | agrees | none |
| 32 | same | `H = G`; `H = 1` | `G^(φ_G(ψ_G(u))) = G^u`; both sides `⊤` of the trivial group | agrees | none |
| 33 | §4a.2 open-subgroup identity (R01 statement) | `ℚ_3 ⊂ ℚ_3(ζ_3) ⊂ Z9`, `u = 1, 3/2` | `ψ_(L/K)(1) = φ_H(2) = 2`, `G_2 ∩ H = H = H^2`; `ψ_(L/K)(3/2) = φ_H(5) = 3`, `G_5 ∩ H = 1 = H_5 = H^3`; unshifted `H^(3/2) = H_2 = H` | agrees; shift needed | R01, R03 |
| 34 | §4a.2 integral formula (README 852) | `S3`, `L = ℚ_3(∛3)` | `[S_3 : C_3 H] = 1` on `(0, 3/2]`, `[S_3 : H] = 3` after, `f = 1`: `ψ = u`, then `3u − 3` | agrees with Check | none |
| 35 | §4a.3 base change | `Z9` | `e = 6`, `d = 9`, `d/e = 3/2`; upper jumps `φ(0) = 0`, `φ(2) = 6/6 = 1` | agrees | none |
| 36 | sampled: Breve `E` | `ℚ_p`; `F_q((t))`; `√p` | `K′ = W(F̄_p)[1/p]`, `p` stays a uniformizer; `Σ aₙtⁿ` with `[F_q(aₙ) : F_q]` unbounded is in `F̄_q((t))` but in no `F_(q^n)((t))`; `v(√p) = 1/2 ∉ ℤ` | agrees | none |
| 37 | sampled: perfect-residue package | `AS`; `ζ_p` over `Frac W(F̄_p)`; `Z8` | `d = (p−1) + (p−1)`; `G_0 = C_(p−1)`, `G_1 = 1`, `d = p − 2`; lower `1, 3` ↦ upper `φ(1) = 1`, `φ(3) = 2` | agrees | none |
| 38 | sampled: residue enlargement | `κ[[t]] → κ̄[[t]]`; `F_(p²)/F_p`; tame `e` | `t` stays a uniformizer; `F_(p²) ⊗ F̄_p ≅ F̄_p × F̄_p` splits; the Eisenstein polynomial stays Eisenstein, `#G_0 = e`, `G_1 = 1` | agrees | none |
| 39 | sampled: proalgebraic units | `E = F`; `AS` | `V = 1`; `π₀(V) ≅ H/[H,H] = C_p` (serre1961 lines 630–639) | agrees | none |
| 40 | sampled: graded norms | tame `C_e`; `AS`; `λ³ − 2λ` over `F_3` | `ψ(s) = es`, depth-0 kernel `μ_e`, `π₀(V_s) = G_(es) = 1` for `s ≥ 1`; `ψ(1) = 1`, `ψ(2) = p + 1`, `π₀(V_1) = C_p`, `π₀(V_2) = G_(p+1) = 1`; `λ³ − 2λ = −λ` on `F_3` with kernel of order `3` | targets agree; F_p clause false as worded | R04 |

**Signatures.**
- In a scratch copy, I elaborated `#check @` of the eight declarations together with the R01 statement. The types match `signatures.md`.
- The file has no `variable` block, so no binder can be lost.
- `signatures.md` also lists an entry `of` at line 44 ("Unknown identifier `of`"). It is a tool artefact: the extractor read the phrase "theorem of §4a.2" in the module docstring as a declaration.
- Each generality matches the README:
  - Hilbert, Herbrand, the tower formula and Hasse–Arf: DVRs `A` and `B`, `Algebra.IsInvariant`, `FaithfulSMul G B` and a separable residue extension, with no completeness assumed;
  - `IsMulCommutative G` in Hasse–Arf only;
  - `_zero`: no hypothesis on `O`;
  - the finite projections and `0+`: DVR, `IsAdicComplete` and `PerfectField` on `O ∩ K`;
  - the subgroup identity: any finite `G` acting on any local ring.

**Padding.**
- In a scratch copy I replaced every `sorry` with `first | rfl | simp | infer_instance | aesop | norm_num | (ext; simp)`. All eight declarations stay open ("unsolved goals" at lines 75, 125, 144, 166, 205, 232, 256 and 272).
- The four definitions have real bodies, and each is needed by a stated headline.
- `_zero` needs the `q`-power argument and the levelwise identification. The `0+` statement needs the finite projections. Neither is a one-tactic consequence.

**Headlines.**
- Stated:
  - Hilbert's formula (§3a.1);
  - `φ`, `ψ`, the upper numbering, Herbrand's theorem and tower transitivity (§3a.2);
  - lower-numbering Hasse–Arf (§3a.3);
  - `G_K^u`, `G_K^0` = inertia, the finite projections and `G_K^(0+)` = `P_K` (§4a.1);
  - the finite-level subgroup identity (§4a.2), which also covers §3a.2's intersection formula.
- Absent but statable: §4a.2's open-subgroup identity (R01).
- Correctly named as not statable:
  - §4a.3: the completion of a maximal unramified extension of a general complete DVR field is a heavy construction;
  - §3a.3's quasialgebraic and proalgebraic targets: there are no perfect quasialgebraic groups at the pins.

**Library declarations.** All 62 qualified Lean names the README backticks resolve by `#check @` at the pins, importing the 23 Tau Ceti modules that declare them (exit 0). Opened by hand:
- Mathlib:
  - `RingTheory/Valuation/RamificationGroup.lean`: line 28 (`decompositionSubgroup` is `MulAction.stabilizer`), 39 (the `MulSemiringAction` on `A`) and 49 (`inertiaSubgroup` is the kernel of `toRingAut` on the residue field);
  - `FieldTheory/AbsoluteGaloisGroup.lean`: line 42 (`absoluteGaloisGroup` deriving the Krull topology) and 59 (`mapOfAlgebra`);
  - `FieldTheory/Galois/Profinite.lean:148` (`restrictNormalHom_continuous`, needing only `[Normal k L]`);
  - `AlgEquiv.restrictNormalHom_surjective`, which needs `Normal K (AlgebraicClosure K)` and so holds for imperfect `K`;
  - `RingTheory/DedekindDomain/Different.lean:481` (`differentIdeal`: `IsIntegrallyClosed A`, `IsDedekindDomain B`, `IsTorsionFree A B`);
  - `IsKrasner.of_completeSpace_of_normal` (complete ultrametric `K`, `Normal K L`).
- Tau Ceti:
  - `RingTheory/LocalRing/RamificationGroup.lean:260` (`ramificationGroup_zero_eq_inertiaSubgroup`, for any `Algebra K L` and valuation subring) and `:750` (`subgroupOf_ramificationGroupReal`);
  - `FieldTheory/Galois/AbsoluteGaloisGroup/Basic.lean:340`, `:346` and `:374`;
  - `FieldTheory/Galois/AbsoluteGaloisGroup/FiniteExtension.lean:135–136` (`[FiniteDimensional K L]`, `σ : L →ₐ[K] SeparableClosure K`) and `:252`;
  - `NumberTheory/LocalField/Herbrand/Basic.lean:104–107` and `:255–264`: `herbrand` and `inverseHerbrand` assume `IsNonarchimedeanLocalField` on both fields, `ValuativeExtension`, `Module.Finite` and `IsGalois`. So the general `herbrandFun` here is not a duplicate.
- Neither pin contains `absoluteUpper*`.

**Cross-roadmap citations resolved** (main 35809b2):
- ReductiveGroups Layer 3, line 234;
- SchemeAndStackFoundations §0.24, line 1565;
- AdicSpacesPartII §R0.19.9, line 7793;
- ReductiveGroupsPartII §RG2.0.4, line 852 (`Breve E`, discreteness, residue field, uniformizers, Frobenius);
- LocalGaloisGroups, `Completed/LocalGaloisGroups/README.md` lines 29 and 106 (maximal pro-`p` quotient);
- `Completed/LocalFieldsRamification`, cited by Tau Ceti declarations only;
- PadicExtensionFamilies Layer 2, #1713 line 704. This is a consumer citation.

All suppliers are on main. `roadmaps resolve` and `roadmaps overlaps` report nothing.

**Ownership against open pull requests** (`roadmaps grep` over the open heads and main).
- These cite §§3a–4a as consumers without defining their objects:
  - ArithmeticGaloisRepresentations #856, lines 459 and 2707;
  - FiniteFlatGroupsAndIntegralPadicHodgeTheory #879;
  - PadicPeriodRings #940, lines 9, 32 and 299;
  - FilteredLocalGaloisGroups #1795, lines 139–150;
  - FieldOfNorms #1812;
  - SmallRamificationAndAbelianVarietyBaseCasesPartII #1835.
- #1795's `Suggested.lean` lines 20–22 still say §4a.1 has no declaration. That is now out of date on its side.
- The second owners are #1411 (R02) and #1713 (R03).
- No readable `Suggested.lean` declares a fully qualified name of this file. #1411's names are in `TauCetiRoadmap.ClassFieldTheory`.

**Sources: the seeded sample**, all checked against the cached texts.
- serre1961: printed page = PDF page + 103.
- **The perfect-residue Herbrand package:**
  - serre1961 n° 3.1, totally ramified: lines 860–863, p. 126;
  - Propositions 1–2 and the corollaries: lines 875–891, pp. 126–127;
  - formula (5) and properties a–d′: lines 897–926, p. 127;
  - (8), Proposition 3, the infinite-extension paragraph, Proposition 4 and Kawada's Remarque: lines 927–950, p. 128;
  - n° 3.4–3.5, below;
  - brinon-conrad Exercise 1.4.4(3), lines 382–386, printed p. 10 (header line 360), for `p`-adic fields (Definition 1.3.1, line 259).
- **Residue enlargement** (ega3, printed page = PDF page + 3):
  - (10.3.1), lines 637–639, p. 20;
  - (10.3.1.5) and the completion remark, lines 733–737, p. 23.
- **Proalgebraic units:**
  - serre1961 §1, n° 1.1–1.6, lines 74–365, pp. 106–113;
  - n° 2.1, lines 557–572, p. 118;
  - Proposition 1 with its Corollary, Proposition 2 with its Corollary and the Remarque: lines 585–621, p. 119;
  - Proposition 3 with its Corollary: lines 630–639, p. 120.
  - serre1960 (printed page = PDF page + 1):
    - Definition 2 of n° 1.2, line 162, p. 8;
    - Proposition 10 of n° 1.4, line 313, p. 11;
    - Propositions 6–7 of n° 2.4, lines 546 and 575, pp. 17–18;
    - Proposition 10 of n° 2.5 with Corollaries 1–2, lines 625–636, p. 19;
    - Propositions 1–2 of n° 5.1, lines 1246–1261, p. 35.
- **Graded norms:** serre1961:
  - Proposition 6 (a)–(b) with (20), lines 1092–1099, p. 132;
  - Proposition 7 with (22)–(23) and Corollaries 1–3, lines 1148–1184, pp. 134–135;
  - Proposition 8 (i)–(iii), lines 1187–1192, p. 135;
  - Corollary 1, lines 1224–1232, p. 136.
- **Agreement with `Breve E`:** brinon-conrad Exercise 1.4.4(2)–(3), lines 378–386, p. 10; the proof of Lemma 13.1.6, lines 8587–8589, p. 201.

The README flags no locator as unverified.

## Not verifiable

- Serre, *Local Fields* (`serre-local-fields`) is settled in the manifest as uncertified (paywalled). I relied on these locators without reading them:
  - II §2, Proposition 3;
  - III §6, Proposition 12;
  - IV §1, Propositions 1, 2 and 4;
  - IV §3, Propositions 14 and 15 and Exercise 3;
  - V §7, Theorem 1.
- serre1961 line 1197 (proof of Proposition 8(i), p. 135) reads "corollaire 2 de la proposition 3". The bound used is Corollary 2 of Proposition 7. The cached text is Numdam's OCR layer, and I could not render the page image, so I cannot tell a printing slip from an OCR error.

## Source issues

- none
