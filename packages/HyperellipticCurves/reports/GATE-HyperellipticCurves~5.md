# GATE-HyperellipticCurves~5: answers to human review

The thread to answer has one comment with one point: H01.

## H01 (mycaule) — applied

The overlap is real. `LeanPool/HyperellipticCurves/` at `f8b9b72` has 189 modules plus its root module, so its `Imports.lean` imports 190. Before this change the README cited none of it, and the Provenance section said "None of the three has invariants of binary forms …".

`TauCetiRoadmap/HyperellipticCurves/README.md` now has:
- **Provenance, lines 2573–2635:** a new LeanPool/lean-pool entry mapping that directory to milestones 0.1, 0.2–0.3, 0.4/0.6, 5.1–5.2 and 3.5.
- **Provenance opening, lines 2467–2484:** reworded from three repositories to four.
- **Not owned here, lines 109–112:** a new bullet that gives the "counts of rational points on disks" (Chabauty–Coleman theory) to EffectiveDiophantineMethods Layer 4, §4.13.

### What was checked (verified against the lean-pool text at `f8b9b72`)

Every module named below was read at that commit; none was built or run.

**Licence and toolchain**
- Root `LICENSE`: Apache-2.0.
- `lean-toolchain`: `leanprover/lean4:v4.35.0`. This repository's pin is `v4.36.0-rc2`.

**Root module `LeanPool/HyperellipticCurves.lean`**
- Docstring: adapted from MichaelStollBayreuth/HyperellipticCurves at `a541f71`.
- Source given as doi:10.1112/S0010437X06002168. Crossref resolves this to Stoll, *Independence of rational points on twists of a given curve*, Compositio Math. 142 (2006), 1201–1214.
- It says the 189-module closure models the Jacobian "by the ideal class group of the affine coordinate ring, rather than by an algebraic variety".
- No module of the 190 contains `import TauCeti`.

**0.1: `ForMathlib/Resultant.lean`**
- `Polynomial.discrOfDegree` (line 214) is the Sylvester determinant with the sign of `Polynomial.discr`.
- Lemmas present:
  - `discrOfDegree_map` (231);
  - `discrOfDegree_add_two` (258), the degree drop with hypothesis `natDegree f ≤ n + 1`;
  - `discrOfDegree_one` (226), value `1`;
  - `discrOfDegree_eq_zero_of_natDegree_add_two_le` (284).
- Grep finds no `GL₂`/`homog` covariance and no root formula in the file.

**0.2–0.3: `Curve/Basic.lean`**
- The structure `HyperellipticCurve` (lines 67–77) has `[Invertible (2 : R)]` and fields `genus`, `f`, `natDegree_le`, `isUnit_discr`.
- Also used: `map`, `two_mul_genus_add_one_le`, `natDegree_eq_or_eq`, `separable_f`, `ofSeparable`.

**0.4 and 0.6: `Curve/HypRing.lean`, `Curve/IntegralClosure.lean`**
- `HypRing` and `HypField` are `QuadraticAlgebra`s.
- `iota` is `starAlgEquiv`, with `iota_y`.
- `irreducible_Ysq_sub_f` (line 70) needs odd degree.
- `instIsIntegralClosure` (107) needs `[NeZero 2] [Fact (Squarefree f)]`.
- `HypRing.instIsDedekindDomain` (120) additionally needs `[Fact (Odd …)]`.
- `ChabautyColeman.genus f := f.natDegree / 2` (`Disks/CurvePoint.lean` 56).

**5.1–5.2: `Curve/Jacobian.lean`, `Curve/MumfordReduction.lean`**
- `HypJac := ClassGroup (HypRing K f)` (line 42).
- `aj` (114) and `aj_inv` (118).
- `exists_mk0_mumfordIdeal_reduced` (320) and `mumfordIdeal_reduced_unique` (383): `u` monic, `v.degree < u.degree`, `2 * u.natDegree < f.natDegree`, `u ∣ v² − f`.
- Grep finds no two-torsion, Selmer, Kummer or descent declarations. The one `FoldDescent` module is a valuation-separation lemma.

**Count: `Count/Main.lean`**
- `chabauty_coleman_odd_hyperelliptic` (line 377) concludes `S.encard ≤ T.card + 2 * r`.
- Its hypotheses are `2 * r + e + 1 < p`, `HypJac.rank K₀ C₀.f ≤ r` and `r < C₀.genus`.
- Section variables (354–361): complete DVR, `CharZero`, `IsAlgClosed (ResidueField O)`, `Invertible 2`, `[C.IsOdd]`, a field `K₀` of characteristic 0 with an algebra map to the fraction field.
- `IsUniformizer π p e` (`ForMathlib/LocalRing.lean` 85) means `p` lies in the maximal ideal and `p ∣ π^e`, so the ramification is at most `e`.

### Ownership

This roadmap does not own the count. EffectiveDiophantineMethods, at its open head (#1046), has Layer 4 "Chabauty–Coleman and residue discs":
- §4.1: residue discs;
- §4.9: annihilating differentials;
- §4.13: Coleman's bound `#X(ℚ) ≤ #X̃(𝔽_p) + 2g − 2` for `p > 2g`.

That roadmap is line 189 of the merge order and this one is line 384, so the citation goes upward to a supplier. The README already cited it, at 5.2 (§3.23).

Nothing is newly owned here. The LeanPool material is cited as prior art, as README "Porting existing work" asks; it is not a supplier. For ownership against open pull requests, the cited sections were read at #1046's head through `roadmaps show`.

### Adversarial pass on the added statements

| Statement | Instances tried | Values computed | Result | Change |
| --- | --- | --- | --- | --- |
| `discrOfDegree f n = formDiscr n f` for `natDegree f ≤ n` (both are the degree-`n` universal discriminant at the coefficients, by `discrOfDegree_map`) | `X² − 1`, `n = 2` | `discr = 0² + 4 = 4`; README 0.1 Check: 4 | agrees | none |
| (same) | constant `2`, `n = 2` | `coeff(1)² · discrOfDegree 2 1 = 0 · 1 = 0`; 0.1 Check: 0 | agrees | none |
| (same) | constant `2`, `n = 1` | `discrOfDegree_one` gives 1; 0.1 Check: `1`, not `4` | agrees, including the `n = 1` guard | none |
| (same) | `X`, `n = 2` | `1² · 1 = 1`; binary form `XZ` has `b² − 4ac = 1` | agrees | none |
| `HyperellipticCurve R` is a smooth `Model R g` with `h = 0` when 2 is a unit | `y² = x³ − x`, `g = 1` | `formDiscr 4 = lc²·disc = 4`; `2⁴·4 = 64 = Δ` (0.3 Check) | agrees | none |
| (same) | `R` with `2 = 0` (`𝔽₂`) | excluded by `[Invertible 2]` | stated: "no characteristic 2" | none |
| `separable_f`, `two_mul_genus_add_one_le` and `ofSeparable` give both directions of `isSmooth_iff_separable` for `h = 0` | `deg f = 2g+1` and `2g+2` | `ofSeparable` genus `(deg f − 1)/2` is `g` in both cases; `4f` separable iff `f` is | agrees | none |
| (same) | `x⁵ − t` over `𝔽₅(t)` | squarefree, not separable; `ofSeparable` needs separable, and `ofSquarefree` needs `PerfectField` | negative control of 0.3 respected | none |
| Field and Dedekind claims are limited to odd degree, `f` squarefree, `2 ≠ 0` | `f = x²` | `y/x` satisfies `Z² = 1` and is not in `A` | excluded by squarefree; stated | none |
| (same) | `f = x² + 1` (even degree) | `irreducible_Ysq_sub_f` needs odd degree | stated "for `f` of odd degree" | none |
| `D ↦ D − (deg D)·∞` identifies `Cl(A)` with `J(K)` when `f` is separable of degree `2g+1` and `2 ≠ 0` | `g = 0`, `f = x` | `A ≅ K[y]`, `Cl = 1`, `J = 0` | agrees | added "separable" and "`2 ≠ 0`" (first draft said squarefree) |
| (same) | `y² = x³ − x` over `ℚ` | reduced Mumford classes `u ∈ {1, x, x − 1, x + 1}`, `v = 0`, give 4 classes; `#E(ℚ) = 4` | agrees | none |
| Count: `#S ≤ #T + 2r` with `2r + e + 1 < p` | McCallum–Poonen Ex. 1, `g = 2`, `r = 1`, `p = 7`, `e = 1` | `7 > 4`; bound `8 + 2 = 10`; Coleman (EDM §4.13): `8 + 2g − 2 = 10` | consistent; `2r ≤ 2g − 2` because `r < g` | none |
| (same) | `e = 1`, `r = 1` | needs `p ≥ 5`; Coleman needs `p > 2g = 4` | consistent | none |
| `map` along the residue map keeps the discriminant a unit (3.5, one direction) | `y² + y = x⁵` at 2 | outside the type: `h ≠ 0` and `2 = 0`; stated "`h = 0`, odd residue characteristic" | scoped | none |
| "None of the four has …" | lean-pool has the binary-form discriminant | old wording "invariants of binary forms" would be false for the fourth repository | fixed | now "the genus-2 invariants of Layer 2" |
| Not owned: Chabauty–Coleman goes to EDM Layer 4, §4.13 | EDM §4.12 (`r₀ < g` finiteness), §4.13 (good-prime bound) | the sections exist at #1046's head with these contents | agrees | none |

`Suggested.lean` is unchanged, so no Lean statement changed. The worker's `signatures.md` reports 0 of the 35 declarations losing a section binder. A `#check @name` scratch file was not elaborated, because this job may run only the two given Lean commands.

### Untrusted text

The review comment contains no instructions.

## Build

`lake build TauCetiRoadmap.HyperellipticCurves.Suggested`: `Build completed successfully (18502 jobs)`. The only warnings are `declaration uses 'sorry'`. `Suggested.lean` is unchanged since `ea85c21`; the commit touches only the README.

## Gate

`gate HyperellipticCurves: set_option=0 blob=0 latex=0 tex=0 prnum=0 sorry-data=0 sorry-examples=0 residue=0 private-paths=0 imports=0 mathlib-subimports=0 no-import-mathlib=0 lean-lines=0 statement-hygiene=0 forbidden=0 dropped=0 readme-ids-missing=0 empty-sections=0 round-labels=0 long-fences=0 layer-ids=0 target-ids=0 depcheck=0 metadata=0 stray-files=0 dirty=0 outside-folder=0 source-material=0 OK`

Depcheck: `depcheck: 250 roadmaps, 2380 edges, 0 problem(s)`, with no UPWARD, CYCLE or `moved:` line.

`roadmaps resolve` on the README: "Cross-roadmap citations found nowhere: None". "Lean names found nowhere: None".

Commit: `9c4193b8 HyperellipticCurves: review repairs (LeanPool hyperelliptic provenance; Chabauty–Coleman ownership boundary)`. Not pushed.

No source was added to `sources.toml`; this roadmap has none, and the job may edit only README and Suggested.lean. The Stoll paper is named only as the source the lean-pool module gives, not as a citation for a claim of this roadmap. No `needs-references.toml` entry was needed.
