# GATE-EllipticModularityEffectiveComparisons~2: answers to the human review of `2a7d458`

The review (CBirkbeck, 2026-11-06T06:32:34Z) contains one finding, F01, and a list of previous
findings. R01 in that list repeats F01, and R02 records a repair. F01 makes three distinct points:
the duplication and the human choice it forces, the conditional edit of `README.md` line 1689, and
the claim that some sections set this folder apart and could become a Part III. These are H01–H03;
R02 is H04. The copy of the review supplied to this job is cut off inside the verification table,
at the §4.22 row. The visible part makes no further request.

No file was changed, so there is no commit.

## H01 (CBirkbeck) — answered

The duplication is confirmed at the current heads, and it cannot be repaired inside this folder. EllipticCurveModularityPartII is still open at `d2cbd93` and sits at merge-order line 186, against line 269 for this folder. The declaration blocks of `localTerms`, `martinValue` and `newDimension` in the two `Suggested.lean` files (this folder's lines 49–78, its lines 61–90) diff to nothing. `lemos_uniform_surjectivity` (line 265) is its `lemos_surjectivity` (line 251) with `GeometricallyNonCM`/`CyclicIsogenyDegree` in place of `NonCM`/`HasCyclicIsogeny` and `p.Prime` in place of `[Fact p.Prime]`. The headline table in the previous round's report still holds line for line, because neither Lean file has changed.

Both consumers still name EllipticCurveModularityPartII as owner:
- ErdosProgressionPowers, `README.md` lines 74, 554–561, 909, 925, 1098, 1178 and 2204–2205 (the review's 73/553/908 are off by one);
- AdelicImagesAndModularCurves, lines 99, 204, 412 and 1780–1802.

The only fix the planning rules allow is to import Layers 0–5 from EllipticCurveModularityPartII by section. That would leave this folder no target of its own (see H03). So the choice the review describes is the only one: close this roadmap, or revise EllipticCurveModularityPartII, re-point both consumers and move this folder above line 187. Every part of that choice lies outside this folder.

## H02 (CBirkbeck) — answered

Not applied, because the condition ("if this folder is kept") has not been decided. Deleting only the sentence "ErdosProgressionPowers cites EllipticCurveModularityPartII, which plans the same six results …" (`README.md` line 1689) would make the paragraph false. The paragraph would then present ErdosProgressionPowers as a consumer of Layers 0–5 here. In fact ErdosProgressionPowers names EllipticCurveModularityPartII §§1.4–1.8, 2.2, 4.7, 5.4–5.5 and 6.18 as its supplier (its lines 909, 925, 1098, 1178), and at merge-order line 187 it sits above this folder's line 269, so that edge would point upward. If the folder is kept, the whole Downstream consumers paragraph must be rewritten at the same time as ErdosProgressionPowers is re-pointed and the merge order is moved.

## H03 (CBirkbeck) — disputed

Each section that the review counts as this folder's own is a step inside a target that EllipticCurveModularityPartII (`README.md` at `d2cbd93`) already owns:
- §§4.10–4.14 (X₀(d)(ℚ) is cuspidal for d = 39, 65, 91, 125, 169). Each d is a divisor-minimal forbidden degree: its proper divisors {1,3,13}, {1,5,13}, {1,7,13}, {1,5,25} and {1,13} all lie in the Mazur–Kenku list. Their exclusion is therefore part of its §5.0b, which proves exclusion of "every divisor-minimal forbidden composite degree" (line 555).
- §5.1 (singleton Y₀(r)(ℚ) at r = 19, 43, 67, 163, with j = −96³, −960³, −5280³, −640320³) is the route of its §5.0a `noncm_prime_isogeny_degrees`, which proves that these four degrees force geometric CM through "the exact prime-level rational points" (line 541).
- §5.4a (J₀(p)♯ and the Heegner–Gross vectors) is the "Gross-vector nonvanishing criterion" of its §6.0f (line 741).
- §5.16a (moving the specialization cusp to ∞) is the step of its §6.9 route at which a denominator point meets an arbitrary cusp, while formal immersion is stated at ∞ (lines 885, 897).
- §5.25a (the witness bound) is its §6.17 normalizer-character ramification theorem and exceptional-prime divisibility (lines 1008–1010): the same quotient character, unramified outside S, with trace zero off the Cartan.

These sections also cannot form a Part III of EllipticCurveModularityPartII. A Part III must come later than line 186 in the merge order, but these sections are inputs to its §§5.0a, 5.0b, 6.0f, 6.9 and 6.17, so supplying them from a Part III would be an upward edge. Read in the other direction, §§4.10–4.14 and the j-values of §5.1 follow at once from its §§5.0a–5.0b and add no new mathematics. Where these sections are more detailed, that detail belongs in a revision of EllipticCurveModularityPartII itself.

## H04 (CBirkbeck) — answered

R02 is confirmed at this head. `README.md` contains 53 `gap:` tokens: optimized-elliptic-weight-two 9, weight-two-local-reduction 4, mixed-cusp-charts 5, chen-winding-comparison 3, positive-characteristic-support 4, all-embedding-frobenius 2, modular-rank-zero 22, quantitative-abelian-periods 4. Each slug has its header in the supplier contracts. The word "contract" survives only at line 34 (the heading), line 847 (the native declarations) and line 1689 (ErdosProgressionPowers' contract name); lines 19 and 393 contain "contraction". `git diff 5778fc4 HEAD` is 46 insertions and 46 deletions, all in `README.md`.

## Build, gate and dependency check

- `lake build TauCetiRoadmap.EllipticModularityEffectiveComparisons.Suggested`: "Build completed
  successfully (9205 jobs)". The only warnings are the 14 "declaration uses `sorry`", at lines 79,
  84, 93, 104, 118, 135, 182, 188, 194, 201, 238, 246, 256 and 265.
- Gate (head `2a7d458`, tree clean): `gate EllipticModularityEffectiveComparisons: set_option=0
  blob=0 latex=0 tex=0 prnum=0 sorry-data=0 sorry-examples=0 residue=0 private-paths=0 imports=0
  mathlib-subimports=0 no-import-mathlib=0 lean-lines=0 forbidden=0 dropped=0 readme-ids-missing=0
  empty-sections=0 round-labels=0 long-fences=0 layer-ids=0 target-ids=0 depcheck=0 metadata=0
  stray-files=0 dirty=0 outside-folder=0 source-material=0 OK`
- `--depcheck --movable`: `depcheck: 241 roadmaps, 2362 edges, 0 problem(s)`. There is no UPWARD,
  CYCLE or `moved:` line.

## Lean signatures

`Suggested.lean` is byte-identical to `5778fc4`: `git diff 5778fc4 HEAD -- …/Suggested.lean` is
empty. It has no `variable`, `include` or `set_option` line, and every binder sits in its
declaration's own signature, so no section hypothesis can be dropped. The `#check @name`
elaboration of the 24 declarations was not rerun this round, for two reasons. First, the job's
signature file is unavailable, because that elaboration stopped on a missing Tau Ceti object file.
Second, the Lean commands this job may run do not include elaborating a scratch file. The
comparison of the 24 elaborated types with the README in the previous round therefore still
applies, unchanged.

## Ownership and citations

Ownership was checked by object over main and the open heads (index of 2026-11-06T08:16:23Z). The
objects searched were Lemos's theorem, Martin's newspace bound, Kenku's levels, Kraus's thresholds,
Bilu–Parent–Rebolledo's split-Cartan theorem, generalized Jacobians, and the Bennett–Siksek
removed-prime bound.
- The only other owner is EllipticCurveModularityPartII.
- ErdosProgressionPowers and AdelicImagesAndModularCurves consume it.
- EffectiveDiophantineMethods and ArakelovGeometryAndAbelianHeights cite Bilu–Parent–Rebolledo only
  as an input or a height comparison.
- The "Kraus" hits on main (EllipticCurves) are Kraus's minimal-model criteria, a different object.

The citation resolver found no unresolved cross-roadmap citation or Lean name. No citation was
added or changed, and `needs-references.toml` was not written.

## Adversarial pass

No README or Lean statement was added or changed. The rows below check the computed facts on which
the answers above rely.

| Statement | Instances tried | Values on each side | Result | Change |
| --- | --- | --- | --- | --- |
| H03: §§4.10–4.14 levels are divisor-minimal forbidden degrees | d = 39, 65, 91, 125, 169; also 26, 35, 50 (§4.16); allowed set {1,…,19,21,25,27,37,43,67,163} | proper divisors {1,3,13}, {1,5,13}, {1,7,13}, {1,5,25}, {1,13}; {1,2,13}, {1,5,7}, {1,2,5,10,25}: all allowed, and d itself forbidden, so all eight are minimal. The least minimal forbidden degrees are 20, 22, 23, 24, 26, 28 | all inside the scope of the "divisor-minimal" clause of EllipticCurveModularityPartII §5.0b | none |
| H03: §5.1 j-values | −96³, −960³, −5280³, −640320³ | −884736, −884736000, −147197952000, −262537412640768000, equal to the §5.1 table | the CM conclusion is EllipticCurveModularityPartII §5.0a's; the values add no new target | none |
| H03: Part III direction | merge-order lines | EllipticCurveModularityPartII 186 < ErdosProgressionPowers 187 < this folder 269; a Part III sits at a line > 186, while its §§5.0a, 5.0b, 6.0f, 6.9 and 6.17 consume the steps | a Part III supplier would be an UPWARD edge | none |
| H01: identical Lean definitions | `localTerms`, `martinValue`, `newDimension` blocks (comments stripped) | this folder lines 49–78 against its lines 61–90: diff empty | duplicate confirmed | none |
| H02: line 1689 with the second sentence deleted | the consumer claim that would remain | ErdosProgressionPowers names EllipticCurveModularityPartII §§1.4–1.8, 2.2, 4.7, 5.4–5.5, 6.18 (its lines 909, 925, 1098, 1178) and sits at line 187 < 269 | the remaining sentence would be false, so the edit is held back | none |
| H04: gap tokens | every `gap:` in `README.md` | 9+4+5+3+4+2+22+4 = 53 = 8 headers + 45 references | R02 repair confirmed | none |
