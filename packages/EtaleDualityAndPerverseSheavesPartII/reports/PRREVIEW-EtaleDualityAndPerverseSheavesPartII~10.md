# Review of EtaleDualityAndPerverseSheavesPartII (pull request #1743 at 94b1e83)

**Verdict:** needs changes

This is an incremental re-review of the 64 lines changed since e083f44. The gate passes, and the movable dependency check reports no problem. Two blocking findings remain:
- **R01** is carried over. PurityForFlatCohomology still owns §§1.4–1.5, so local Lefschetz and local duality still have two owners.
- **R02** is new and comes from the last repair. The README treats Tau Ceti's `IsGRing` as "quasi-excellence for a noetherian local ring". It cites a theorem for this, but nothing in the plan proves that theorem. A completion route that avoids it uses only inputs that are already owned.

R03 and R04 are small corrections to text the diff added.

## R01 (P2) — Local Lefschetz and local duality on regular local rings still have two owners

**Location:**
- `TauCetiRoadmap/EtaleDualityAndPerverseSheavesPartII/README.md:23`: "PurityForFlatCohomology takes the local Lefschetz theorem from §7.3 … and owns none of these statements."
- `README.md:1580` (Downstream consumers): "PurityForFlatCohomology §1.6 consumes local Lefschetz (§7.3)".

**Claim:** §§5.7, 6.11, 6.12, 7.1 and 7.3 are owned here, and PurityForFlatCohomology owns none of them.

**Witness:** PurityForFlatCohomology's pull request is now at head adbbf28 (2026-11-09 00:07). In `TauCetiRoadmap/PurityForFlatCohomology/README.md` at that head:
- `:188–189` and `:3186–3187` say that this roadmap is "to import" §§1.4–1.5.
- `:1010` (§1.4) states (a) affine Lefschetz on principal punctured opens, (b) the normalised dualizing complex and (c) local duality. These are §§7.1/5.7, 6.11 and the regular case of §6.12 here.
- `:1063` (§1.5) states §7.3.
- `:1104` (the *Needs* of §1.6) cites its own §1.5.

The overlap is now larger. This head states `affineLefschetz_strictlyLocal` (`Suggested.lean:287`), and that roadmap's §1.4(a) is its principal-open, regular excellent case.

**Repair:** The operator settles this once for both pull requests. The mathematics supports the assignment set out in the previous report:
- **In PurityForFlatCohomology:**
  - Delete §§1.4–1.5 and the importer bullets at `:188–189` and `:3186–3187`.
  - Cite this roadmap's §5.7 (or §7.1), §§6.10–6.11, §6.12 and §7.3.
  - In the §1.6 *Needs* at `:1104`, replace "§§0.2, 1.1, 1.5" with "§§0.2, 1.1; EtaleDualityAndPerverseSheavesPartII §7.3".
- **In this folder:** no change.

I re-tested this on a scratch copy of that README at adbbf28, with only the `:1104` line edited.
- With `--movable`: `moved: PurityForFlatCohomology moved in the merge order from #218 to #386, right after its last supplier EtaleDualityAndPerverseSheavesPartII`, then `depcheck: 239 roadmaps, 2356 edges, 0 problem(s)`.
- Without `--movable`: the single line `UPWARD: PurityForFlatCohomology (#218) -> EtaleDualityAndPerverseSheavesPartII (#386) at README lines [1104]`.

A `moved:` line is not a defect.

## R02 (P2) — The native §5.7 statement reaches quasi-excellence through a theorem nobody owns

**Location:**
- `README.md:29` (Conventions): "For a noetherian local ring, quasi-excellence is the G-ring condition, Tau Ceti's `TauCeti.Excellence.IsGRing`: ILO I 5.5.1(ii) reduces …".
- `README.md:66` (From Tau Ceti): "By the Conventions it is quasi-excellence for a noetherian local ring, and the local affine Lefschetz signature of §5.7 uses it as its quasi-excellence hypothesis."
- `README.md:992–994`: the §5.7 route ("Equivalent to §5.6 …") and its *Needs*.

**Claim:** `affineLefschetz_strictlyLocal` assumes only `IsGRing A`. Its route goes through §5.6, which assumes quasi-excellence in the sense of SchemeAndStackFoundations §0.21 (Conventions, line 29). The README bridges the two with the J-2 half of ILO I 5.5.1, but no layer, supplier section or pinned declaration proves that half.

**Witness:**
- **On main:** SchemeAndStackFoundations §0.21 (`README.md:1394–1430`) defines `IsQuasiExcellentRing R := IsGRing R ∧ IsJ2 R`. Its only local G-ring result is `regular_map_completion`, that A → Â is regular. It states no theorem that a local G-ring is J-2, and neither does its revision #1656 (§0.21 at `:1846`).
- **At the Tau Ceti pin:** no file mentions `IsJ2` or quasi-excellence (grep of `TauCeti/`: 0 files). `IsGRing` is at `TauCeti/RingTheory/RegularLocalRing/GRing.lean:57`.
- **In the source:** ILO14 line 722–725 (I 5.5.1, p. 13) needs this step, because ILO's 1.a) is a separate condition (Déf. 2.10, ILO14 line 560).

**Repair (all inputs owned):** route the native statement as the source does. ILO XV 1.2.5 (ILO14 lines 10365–10368, p. 220) uses only that X̂ → X is regular. Replace the second sentence of the route at `:992` with:

> For the native statement, the G-ring condition at the maximal ideal makes Spec Â → Spec A regular. Section 5.3, evaluated at the closed point, identifies H^q(U, ℤ/n) with H^q(U ×_A Â, ℤ/n) (ILO XV 1.2.5). Â is complete, hence henselian with the same separably closed residue field. It is excellent (SchemeAndStackFoundations §0.21, `excellent_examples`) and has dimension d. The first assertion for Spec Â and its affine open U ×_A Â is §5.6.

Make the matching edits elsewhere:
- **§5.7 *Needs* (`:994`):** add §5.3, SchemeAndStackFoundations §0.21, Mathlib `IsAdicComplete.henselianRing` (`Mathlib/RingTheory/Henselian.lean:154`) and Tau Ceti `TauCeti.AdicCompletion.ringKrullDim_eq` (`TauCeti/RingTheory/AdicCompletion/LocalRing.lean:52`).
- **Line 66:** say that the signature uses the G-ring condition, through regularity of A → Â. ILO I 5.5.1(ii) identifies this condition with quasi-excellence, but the route does not need that identification.
- **Line 29:** keep it only as an explanation.

Alternatively, state ILO I 5.5.1 as a target of this roadmap, with its own *Needs* (§0.21 `IsJ2`, Nagata's openness criterion).

**Test of the repair:** let A be a strictly henselian G-ring DVR (K̂/K separable) and U = η. Regular base change gives H^q(K, ℤ/n) ≅ H^q(K̂, ℤ/n). Both sides are ℤ/n(−1) at q = 1 and 0 for q ≥ 2, which agrees with the §5.7 Check at `:998`. The §5.3 Check at `:920` already records this identification for excellent A.

## R03 (P3) — Two new §5.7 Checks: sharpness is claimed for n = 1, and x names both a coordinate and the closed point

**Location:**
- `README.md:998`: "The bound is sharp: H¹(η, ℤ/n) = ℤ/n(−1) is nonzero at q = d = 1".
- `README.md:1002`: "For X = Spec k⟦x, y⟧ … U = X − {x} the punctured spectrum … H³(U, ℤ/ℓ) ≅ H⁴_x(X, ℤ/ℓ)".

**Claim:** the first Check holds for every n, and the second names its open unambiguously.

**Witness:**
- **Line 998:** the signature admits n = 1, because `IsUnit (1 : A)` holds. The Check at `:1006` says that for n = 1 "every group vanishes", so H¹(η, ℤ/1) = 0, not nonzero.
- **Line 1002:** x is a coordinate. X − V(x) = D(x) is an affine open, and on it the theorem gives H³ = 0, not ℤ/ℓ(−2).

**Repair:**
- **Line 998:** write "for n ≥ 2, H¹(η, ℤ/n) = ℤ/n(−1) ≠ 0 at q = d = 1". For n = ℓ = 2 this gives ℤ/2 ≠ 0.
- **Line 1002:** call the closed point s: "U = X − {s} … H³(U, ℤ/ℓ) ≅ H⁴_s(X, ℤ/ℓ) ≅ ℤ/ℓ(−2)".

## R04 (P3) — The module docstring gives a wrong reason for not stating §5.5

**Location:** `Suggested.lean:31–34`: "the trait theorem with its strict-local consequence (README §5.5), need dimension functions, constructible étale sheaves with their higher direct images".

**Claim:** §5.5 cannot be stated without dimension functions and constructible sheaves.

**Witness:** README §5.5 (`:946`) concerns cohomology of ℤ/n on an affine open of a strictly local scheme, essentially of finite type over a trait. In a scratch file I elaborated exactly that statement at the pins with `lake env lean`. It uses `IsDiscreteValuationRing R`, `Algebra.EssFiniteType R A`, `HenselianLocalRing A`, `IsSepClosed` on the residue field, `IsAffineOpen U`, `IsUnit (n : R)` and `Sheaf.H` of the constant sheaf. The only warning is the `sorry`. Only the supplied trait theorem (LefschetzPencilsAndVanishingCycles §6.2) needs dimension functions.

**Repair:** §5.5 is a step in the proof of §5.6, not a headline. So do not add it to `Suggested.lean`; correct the reason instead. Reword lines 31–34 to say:
- Gabber's theorem over a quasi-excellent scheme (README §5.6) and the trait theorem it is reduced to (LefschetzPencilsAndVanishingCycles §6.2) need dimension functions and constructible étale sheaves with their higher direct images; §5.6 also needs scheme-level quasi-excellence.
- The strict-local consequence (README §5.5) is an intermediate step of that proof.
- The local form (README §5.7) is stated below.

## Previous findings

- R01 — not repaired: `README.md:23` is unchanged. PurityForFlatCohomology at adbbf28 still states §1.4 (`:1010`) and §1.5 (`:1063`), and names this roadmap as their importer (`:188–189`, `:3186–3187`). Raised again as R01.
- R02 — repaired: `Suggested.lean:287–296` states `affineLefschetz_strictlyLocal` with the proposed signature. §5.7 (`README.md:990`) names it, line 66 cites `TauCeti.RingTheory.RegularLocalRing.GRing`, and the docstring bullet is narrowed. The repair introduced R02 and R04 of this report.
- R03 — repaired: `README.md:1390` reads "*Needs:* §5.7; Mathlib `IsRegularLocalRing`."; ArcTopologyAndDescent stays where it is used, in §7.2 (`:1406`).

## Verified sound

**Gate and dependency check** (run on this head):
- Gate: `set_option=0 … depcheck=0 metadata=0 stray-files=0 dirty=0 outside-folder=0 source-material=0 OK`, exit 0. The worker's gate also reports `build=0`.
- Required dependency check, complete output: `depcheck: 239 roadmaps, 2355 edges, 0 problem(s)`. There is no UPWARD, CYCLE or `moved:` line.
- `git diff --stat origin/main...HEAD` outside the folder lists 0 paths.

**Elaboration and signatures:**
- `lake env lean` on `Suggested.lean` exits 0 in 14.6 s. The only warnings are seven "declaration uses `sorry`" (lines 71, 94, 187, 231, 268, 287, 302).
- I put `#check @name` for all 10 declarations in one scratch copy and elaborated it once. Nine types are as the previous report recorded them.
- The new `affineLefschetz_strictlyLocal` keeps every binder: `HenselianLocalRing A`, `IsSepClosed (ResidueField A)`, `TauCeti.Excellence.IsGRing A`, `ringKrullDim A = ↑d`, `IsUnit ↑n`, `IsAffineOpen U` and `d < q`. Its conclusion is `Subsingleton (… constantSheaf … (ULift.{u,0} (ZMod n))).H q`. This matches `README.md:990`. Nothing changed.
- Padding probe on it: `infer_instance` fails with `synthInstanceFailed`, and `simp` makes no progress. `¬ IsUnit ((0 : ℕ) : A)` in a local ring closes by `simp`, so n = 0 is excluded.

**Headline inventory:**
- Stated (7):
  - Cohen–Gabber in equal characteristic, equivariantly, and in mixed characteristic prime to ℓ;
  - partial algebraization in both settings;
  - local affine Lefschetz (new);
  - Gabber's strict-local cd bound.
- Not statable, each named in the docstring with its missing carrier: as in the previous report.
- No statable headline is absent.

**Changed passages, checked against the texts:**
- **Conventions (line 29) against the source:**
  - ILO14 lines 482–487 (I 2.3: condition 2.a) at closed points is "G-ring").
  - ILO14 line 560 (Déf. 2.10: quasi-excellent is 1.a) + 2.a)).
  - ILO14 lines 667–670 (Théorème 5.3.1, p. 12: 2.a) passes to every A_p).
  - ILO14 lines 722–725 (Proposition 5.5.1, p. 13: for noetherian local rings, quasi-excellent iff 2.a)).
  - The paraphrase is accurate; only its use is R02.
- **Mathlib row (line 58):**
  - `IsAffineOpen` (`Mathlib/AlgebraicGeometry/AffineScheme.lean:249`).
  - `constantSheaf` (`Mathlib/CategoryTheory/Sites/ConstantSheaf.lean:64`).
  - `Sheaf.H` (`Mathlib/CategoryTheory/Sites/SheafCohomology/Basic.lean:57–58`): Ext from `(constantSheaf J _).obj ↧(ULift ℤ)`. Since U is terminal in its small étale site, this is H^q(U_ét, F), as stated.
- **Tau Ceti paragraph (line 66):** `IsGRing` (`GRing.lean:57–62`) is "noetherian, and `RegularAlgebraMap` of `R_p → R̂_p` for every prime". It is the only Tau Ceti import (`Suggested.lean:4`).
- **Docstring bullet on dimension functions:** at the pins Tau Ceti has `TauCeti/RingTheory/StrictHenselization/`, `IsGRing`, `RegularAlgebraMap` and `TauCeti.AlgebraicGeometry.Scheme.IsRegular` (regular schemes, `Scheme/Regular/Scheme.lean:68`). No file at either pin defines quasi-excellence, excellence, J-2 or regular morphisms of schemes. The bullet is accurate.
- **§5.3 *Needs* (line 916):** SchemeAndStackFoundations §2.15 on main (`:3867`) has `etale_cohomology_limits`. The dropped §2.12 (Nisnevich) and §2.16 (Tsen, proper hypercoverings) are not used by the route.
- **§5.7 *Needs* (line 994):** §2.15 has `hochschildSerre_galois_covering`.
- **Locators in §5.7:** ILO XV 1.2.2 (ILO14 line 10350, p. 219), 1.2.4 (line 10362, p. 220) and Exposé 0 Cor. 8 (line 396, p. 5) are correct.
- **Seeded sample:** none of the 15 seeded targets falls in the changed passages. The diff touches the Conventions, the Mathlib and Tau Ceti contracts, the §5.3 and §7.1 *Needs*, and §5.7. The README flags no locator as unverified.

**Cross-roadmap citations in changed text:**
- LefschetzPencilsAndVanishingCycles §0.10 at #873 (`:701`).
- SchemeAndStackFoundations §§0.21, 2.15 on main (`:1394`, `:3867`).
- The leads in `scratch/citations.md`:
  - PerfectoidQuotientsPartII is a board package at `ORDER.txt` line 217, earlier than this roadmap at 386.
  - The six EtaleCohomologyFoundations names each occur in its README on main.
- `scratch/overlaps.md` lists no dropped id and no other pull request changing this roadmap.
- `roadmaps grep` for "affine Lefschetz", `affineLefschetz` and "1.2.4" over main and the open heads finds only PurityForFlatCohomology §1.4(a) (R01) and the differential-geometric RiemannianGeometry.

**Declared gaps:** the diff does not touch the five gap contracts. The previous check carries over.

**Adversarial table.** The rows for changed statements are computed this round. Rows marked "r9" are carried from the previous report, because the diff leaves those statements untouched.

| Statement | Instances tried | Values on each side | Result / change |
| --- | --- | --- | --- |
| `affineLefschetz_strictlyLocal` (§5.7, new) | d = 0; k⟦t⟧ with U = η; U = ∅; n = 1, 0 | **d = 0:** Spec A is one point, U ∈ {∅, X}, H^q = H^q(κ) = 0 for q ≥ 1. **k⟦t⟧ (a G-ring by `IsGRing.of_isAdicComplete`), U = η:** H¹ = ℤ/ℓ(−1) ≠ 0 at q = 1 = d (not claimed); H^q = 0 for q ≥ 2. **U = ∅:** the site is trivial, all groups 0. **n = 1:** zero sheaf. **n = 0:** excluded; it would fail, since H²(η, ℤ) ≅ H¹(η, ℚ/ℤ) ≠ 0. | Holds; sharp. |
| same, without each hypothesis | punctured k⟦x,y⟧; ℤ_p with ℓ = 2; valuation ring with Γ = ℤ + ℤ√2 | **Not affine:** H³(U) ≅ H⁴_s = ℤ/ℓ(−2) ≠ 0 at q = 3 > 2. **Residue 𝔽_p not separably closed, U = Spec ℚ_p:** H²(ℚ_p, ℤ/2) = Br(ℚ_p)[2] = ℤ/2 ≠ 0 at q = 2 > 1. **Not noetherian, d = 1:** H²(K, ℤ/ℓ) = ∧²(ℤ/ℓ)² ≅ ℤ/ℓ ≠ 0. | Each hypothesis is needed. |
| Conventions: local `IsGRing` = quasi-excellent | field; k⟦t⟧; char-p DVR with K̂/K inseparable; ℤ_(p) | **Field:** G-ring (Artinian) and quasi-excellent. **k⟦t⟧:** both. **Inseparable DVR:** neither. **ℤ_(p):** both. | Agrees with ILO I 5.5.1(ii); unowned use (R02). |
| §5.7 Checks (new) | n = 1, 2 at η; V(x) vs closed point | **η:** H¹(η, ℤ/2) = ℤ/2 ≠ 0, but H¹(η, ℤ/1) = 0. **Opens:** H³(D(x)) = 0 vs H³(X − {s}) = ℤ/ℓ(−2). | Fix wording (R03). |
| §5.5 statability (docstring) | elaboration at the pins | DVR, `EssFiniteType`, `HenselianLocalRing`, `IsAffineOpen`, `Sheaf.H`: elaborates, `sorry` the only warning. | Reason wrong (R04). |
| §5.3 (*Needs* changed) | completion of a strictly henselian G-ring DVR, U = η | H¹(K) = H¹(K̂) = ℤ/n(−1); H^q = 0 for q ≥ 2 on both sides. | Holds; *Needs* correct. |
| §7.1 (*Needs* changed) | d = 1 with f = π; f = 0 | **d = 1:** H^i(η) = 0 for i > 1, from §5.7 alone. **f = 0:** empty open. No completion is used. | Holds. |
| §§1.1, 1.2, 1.4, 1.5, 1.6, 1.7 (Lean) | r9: d = 0; cusp at p = 2, 3; μ₂ and char 2; identity, t ↦ x^p, μ_ℓ models; field and power series; ℤ_p⟦x⟧ | As computed in r9, e.g. **cusp p = 2:** rank 3 with x² ≠ 0; **t ↦ x^p:** p·x^{p−1} ∈ (p), so rejected. | Unchanged; hold. |
| `cohomologicalDimension_le_of_strictlyLocal` (§5.8) | r9: d = 1, 2, 0 | **d = 1:** H¹(η) ≠ 0 at q = 1 = 2d − 1. **d = 2:** H³ ≠ 0 at q = 3. **d = 0:** H⁰ ≠ 0 at q = 0 = 2d, excluded by `0 < d`. | Unchanged; sharp. |
| §§0.3, 0.5, 0.6, 2.2, 3.3, 5.1, 5.4, 5.6, 6.2, 6.5, 6.10, 6.11, 6.12, 7.2, 7.3, 8.4, 8.5 | r9 instances | r9 values. Examples: **§6.11, d = 2:** RΓ_x(Λ(2)[4]) = Λ in degree 0. **§5.4:** rule (1) gives 1, 0 and rule (2) gives 0, −1. **§8.5 over 𝔽_p:** H⁰ = H¹ = ℤ/ℓ. | Unchanged; §7.3 is R01. |

## Not verifiable

- **Ill03** (Théorème 2.4) and **Epp73** (Theorem 1.9) are settled as uncertified, and I did not read them. Neither is cited in the changed passages.
- I did not compare the published Astérisque pagination with ILO14 arXiv v1. The README uses the arXiv v1 printed pages, and I checked those.

## Source issues

- none
