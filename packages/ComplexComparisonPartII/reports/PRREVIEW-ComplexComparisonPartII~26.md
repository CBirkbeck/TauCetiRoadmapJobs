# Review of ComplexComparisonPartII (pull request #848 at 6164bde)

**Verdict:** needs changes

This is an incremental re-review of the 13 README lines changed since `0dec244` (7 added, 6 removed). The changes are:

- the heading at :862, now "Algebraic-space, resolution, derived-module and scheme suppliers";
- ResolutionOfSingularitiesCharacteristicZero moved out of the AlgebraicModuliForArithmeticGeometry bullet into its own bullet (:875–876);
- the heading at :886, now "Compactification, finite and adic étale, and topological suppliers";
- the carrier of Worked example 2 (:5059–5061).

`Suggested.lean` is unchanged (`git diff 0dec244 HEAD` touches only the README), and no file outside the folder changed. The new carrier repairs the previous R02, but the parenthetical added with it introduces a new P3 (R02 below). The previous R01 is not addressed and is carried.

## R01 (P2) — The frame-torsor bijection, the holomorphic exponential sequence and the `c₁` identification still have two owners across the open heads

**Location:** `TauCetiRoadmap/ComplexComparisonPartII/README.md:146`: "C5.4 is the single owner, on every complex manifold, of the holomorphic-to-smooth forgetful adapter, the frame-torsor bijection from holomorphic line-bundle classes to `H¹(M,O_M^×)`, the holomorphic exponential sequence with its cocycle `δu`". The same claim is made at :90–93 and :5112–5116.

**Claim:** C5.4 is the only owner of these objects, and its consumers take them from C5.4.

**Witness:** in ComplexKahlerGeometry #1234 at `682823d`, README :731–735 says K4.P "owns … the holomorphic exponential sequence, the isomorphism `Pic_hol(M)≃H¹(M,𝒪×)`" and supplies them to C5.4, and :826 repeats this. K3Surfaces #1285 at `920b522` (:13–16, :184) gives that isomorphism to ComplexKahlerGeometry.

Both heads, and K3SurfacesAndSymplecticBoundedness #1375 at `c1d6da0` (:13, which says the same), are unchanged since the previous review. ComplexKahlerGeometry on main has no K4.P and no exponential sequence (grep of its README: no match). The other open ComplexKahlerGeometry heads (#1398, #1807, #1808, #1854) make no ownership claim; #1807 and #1808 only list this roadmap as a consumer. The pull-request description at this head still has no ownership paragraph. No repair report marks R01 `not actionable in this package`. The finding has been carried since r20.

**Repair:** unchanged. Add this paragraph to the merge-order block of the pull-request description. No file in the folder needs to change: this roadmap cannot take K4.P from a revision of a roadmap on main, so C5.4 has to be the owner.

> **Ownership.** ComplexComparisonPartII C5.4 is the single owner, on every complex manifold, of `Pic_hol(M) ≃ H¹(M,O_M^×)` with its tensor, dual and pullback laws, the holomorphic exponential sequence and the identification of its connecting map with the integral first Chern class. ComplexKahlerGeometry on main states none of them. ComplexKahlerGeometry #1234 drops K4.P's ownership claim (README :731–735, :826) and reads isomorphism classes of K4's line bundles directly. K3Surfaces #1285 replaces `gap:integral-topology` (README :15–16, :184, :434) by a citation of C5.4. K3SurfacesAndSymplecticBoundedness #1375 re-points README :13 to C5.4.

**Tested** on the refuting lines: with this paragraph, #1234 :731 and :826, #1285 :15, :184 and :434, and #1375 :13 are each named together with the edit that makes it cite the one owner. If the repair job cannot edit the description, it should mark R01 `not actionable in this package` with that reason, so that the board can hand it to a human instead of carrying it again.

## R02 (P3) — The K3 surface in Worked example 2's new parenthetical is not a control for the dimension clause

**Location:** `README.md:5060–5061`: "(the dimension excludes a K3 surface, which has arithmetic genus one, and `E × P¹`, which has `h¹(O) = 1`)".

**Claim:** the parenthetical credits the dimension clause with excluding a K3 surface, and gives the K3's arithmetic genus as the reason it would otherwise get in. But the carrier no longer mentions arithmetic genus. Its second clause, `dim H¹(E, O_E) = 1`, already excludes every K3 surface. So the K3 does not test the dimension clause, and a reader is led to think `h¹(O_K3) = 1`. That conflation of `p_a` with `h¹(O)` is the one the previous R02 removed.

**Witness:** take the Fermat quartic `X ⊂ P³`. From `0 → O_P³(−4) → O_P³ → O_X → 0` one gets `h¹(O_X) = 0` and `h²(O_X) = h⁰(K_X) = 1`. So `p_a = χ(O_X) − 1 = 2 − 1 = 1`, but `dim H¹(X, O_X) = 0 ≠ 1`. If "of dimension one" were dropped, `X` would still be excluded.

**Repair:** replace the parenthetical with "(the dimension excludes `E × P¹`, which has `h¹(O) = 1`; the value of `h¹(O)` excludes `P¹` and a genus-two curve, which have `h¹(O) = 0` and `2`)".

**Tested:** each control now fails exactly the clause the text attributes to it.

- `E × P¹` is proper, smooth, connected and has a `ℂ`-point. By Künneth, `h¹(O) = h⁰(O_E)h¹(O_P¹) + h¹(O_E)h⁰(O_P¹) = 0 + 1 = 1`, and its dimension is 2. It fails only the dimension clause.
- `P¹` (`h¹(O) = 0`) and `y² = x⁵ − 1` (`h¹(O) = 2`) both have dimension one. They fail only the `h¹` clause.
- `y² = x³ − x`, with its point at infinity, satisfies every clause.

## Previous findings

- R01 — not repaired: README :146 still reads "C5.4 is the single owner, on every complex manifold, of … the frame-torsor bijection". #1234 at `682823d` :731–735 still supplies the segment "to ComplexComparisonPartII C5.4". The description has no ownership paragraph.
- R02 — repaired: :5059–5060 now reads "a proper smooth connected `ℂ`-scheme of dimension one with `dim H¹(E, O_E) = 1` and a marked `ℂ`-point". The parenthetical added alongside it is this report's R02.

## Verified sound

### Gate, dependency check and Lean

- **Gate.** My run on `6164bde` exited 0, and the worker's `gate.md` records the same result:

  ```text
  gate ComplexComparisonPartII: set_option=0 blob=0 latex=0 tex=0 prnum=0 sorry-data=0 sorry-examples=0 residue=0 private-paths=0 imports=0 mathlib-subimports=0 no-import-mathlib=0 lean-lines=0 statement-hygiene=0 forbidden=0 dropped=0 readme-ids-missing=0 empty-sections=0 round-labels=0 long-fences=0 layer-ids=0 target-ids=0 depcheck=0 metadata=0 stray-files=0 dirty=0 outside-folder=0 source-material=0 OK
  ```

- **Dependency check** (`--movable`), in full. It printed no UPWARD, CYCLE or `moved:` line. This roadmap is at `ORDER.txt:39`. Its suppliers among the changed lines are ResolutionOfSingularitiesCharacteristicZero (:18) and AlgebraicModuliForArithmeticGeometry (:34), both earlier.

  ```text
  depcheck: 239 roadmaps, 2332 edges, 0 problem(s)
  ```

- **Elaboration.** `lake env lean` on `Suggested.lean` exits 0. Its only warnings are four `declaration uses sorry`, at :116, :127, :154 and :172.
- **Signatures.** I elaborated `#check @` for all four declarations in one scratch copy (exit 0). After whitespace normalisation the types are identical to `scratch/signatures.md`. No binder is lost: `[FiniteDimensional ℂ E]`, `[CompleteSpace F]`, `IsManifold 𝓘(ℂ,E) ⊤ M` and `LocallyContractibleSpace ↑T` are all present.
- **Unchanged Lean file.** Since the file is unchanged, the account from r20 carries: 4 of the 67 headline targets are stated, the other 63 are named in the docstring with the carrier each lacks, and the one-tactic probes close none of the four.
- **Outside the folder.** `git diff --stat origin/main...HEAD -- . ':!TauCetiRoadmap/ComplexComparisonPartII'` is empty.
- **Hygiene.** The 13 changed lines contain no process word, pull-request number, LaTeX or copied passage, and no locator. None of the 39 leads in `scratch/citations.md` falls on a changed line: the nearest, at :911, :926 and :927, are unchanged bullet text verified in earlier rounds. `scratch/overlaps.md` lists no dropped id and no other pull request changing this roadmap.

### Changed passages

- **Heading :862 and its list.** The section has four bullets, and the heading names each:
  - AlgebraicModuliForArithmeticGeometry (:864): algebraic spaces;
  - ResolutionOfSingularitiesCharacteristicZero (:875): resolution;
  - DerivedModuleAlgebra §1.E.1 with EnhancedDerivedSheaves E1.9 (:877): derived modules;
  - SchemeAndStackFoundations (:882): schemes.

  This settles the previous review's remark on :862. Topical supplier headings are also used on main (for example "Generic approximation and descent suppliers" and "Cotangent and deformation suppliers"), so the departure from a "From <X>" heading is house practice.
- **Heading :886 and its list.** The section has eight bullets:
  - EtaleCohomologyFoundations §§G.1–G.3 (:888): compactification;
  - EtaleCohomologyFoundations §§F.0–F.4 (:893–918): finite and adic étale;
  - EnhancedDerivedSheaves §§0.1–0.4 with EtaleCohomologyFoundations §§0.7–0.8 (:925): the étale enhancement;
  - UniversalCovers, RealAlgebraicGeometry and AlgebraicTopology (:931): topological.
- **ResolutionOfSingularitiesCharacteristicZero bullet (:875–876).** On main:
  - its Layer 5 is principalization and embedded resolution (§5.1 at :791, §5.2 at :801);
  - its Layer 6 is "SNC compactification and Cartier separation", with §6.2 at :893 and §6.4 at :935;
  - its Downstream consumers paragraph (:1216) exports "SNC coordinates and SNC compactification" to ComplexComparisonPartII C−1.4.

  The §§1.3, 6.2 and 6.4 citations at :148, :204 and :1165 resolve to the same headings. The text is unchanged apart from the split.
- **Worked example 2.** The rest of the example still holds on the new carrier. A proper smooth connected curve over `ℂ` with `h¹(O) = 1` and a `ℂ`-point is an elliptic curve. Serre duality gives `h⁰(Ω¹) = h¹(O) = 1`, and `F¹H¹_dR = H⁰(Ω¹)`. See row N33.

### Ownership against open pull requests

I resolved each of the following at its head:

- ComplexKahlerGeometry #1234 (`682823d`), #1398 (`1038b16`), #1807 (`64a16e1`), #1808 (`a96d197`) and #1854 (`30817b1`);
- K3Surfaces #1285 (`920b522`) and K3SurfacesAndSymplecticBoundedness #1375 (`c1d6da0`);
- GeometricQuantization #1186 (`be6ed5f`): its :20, :217 and :719 consume C5.4, consistently with this README's :5112.

Only #1234 and #1285 conflict (R01).

### Seeded sample

None of the fifteen seeded targets falls on a changed line. Worked example 2 cites `properDeRhamBetti`, `kaehlerHodgeDecomposition`, `multiplicativePeriodInterface` and `familyMorphismInterface`, none of which is in the sample. The locator verification of the seeded targets in r20, r21, r23, r24 and r25 carries.

### Adversarial table

New rows, computed this round:

| # | Statement (changed) | Instances | Values computed (left / right) | Result |
| --- | --- | --- | --- | --- |
| N33 | Worked example 2 carrier, :5059–5061 | `y² = x³ − x` with `∞`; Fermat quartic K3; `E × P¹`; `y² = x⁵ − 1`; `P¹` | **Curve:** dim 1, `h¹(O) = 1`, `h⁰(Ω¹) = 1`, `H¹ = ℤ²` with form `[[0,1],[−1,0]]` (det 1), so it is included. **`E × P¹`:** dim 2, `h¹(O) = 0 + 1 = 1`, excluded by the dimension alone. **K3:** dim 2, `χ(O) = 1 − 0 + 1 = 2`, `p_a = 1`, `h¹(O) = 0`, excluded by both clauses. **Genus two:** dim 1, `h¹(O) = 2`, excluded. **`P¹`:** `h¹(O) = 0`, excluded | The carrier holds (previous R02 repaired). The K3 control does not test the dimension clause → R02 |
| N34 | Heading :862 against :864–885 | its 4 bullets | algebraic-space → AMAG; resolution → ResolutionOfSingularities; derived-module → DMA/EDS E1.9; scheme → SSF: 4 of 4 | Holds |
| N35 | Heading :886 against :888–937 | its 8 bullets | compactification → ECF G; finite and adic étale → ECF F.0–F.4 and EDS/ECF 0.x; topological → UniversalCovers, RAG, AT: 8 of 8 classified | Holds |
| N36 | ResolutionOfSingularities Layers 1–6, :875–876 | main README | §5.1 principalization (:791), §5.2 embedded resolution (:801), §6.2 SNC compactification (:893). `ORDER.txt` puts it at 18, before 39 | Holds |

Rows carried from `PRREVIEW-ComplexComparisonPartII~25.md` (and the reviews it cites) for statements this diff leaves untouched:

| Row | Statement | Key values |
| --- | --- | --- |
| N28 (r25) | Mathlib `monodromyFunctor` contract | the fibre of `z ↦ z²` over 1 is `{1, −1}`; the loop maps to the transposition, of order 2; `2·3 ≡ 1 (mod 5)` |
| N29 (r25) | UniversalCovers classification | the trivial 2-sheet cover is the 2-point functor; `ℂ* ⊔ {pt}` has 2 components; the doubled origin has `π₁ = 1` |
| N30 (r25) | C5.4 metric sentence | `M([0,1]) = c` for `g = c²dx²`; `M(δ_a) = 1`; the long line is excluded |
| N32 (r25) | `topologicalCoefficientComparison` | `H⁰ = 0` for monodromy `−1` over `𝔽₃` |
| N25–N27 (r24) | G1 test forms; UniversalCovers Stages 0–2; `riemannExistence` | `rank V_1 = 2` on `ℝ²`; deck group `ℤ/n`; `ℂ[ε]/(ε²)` gives `FinSet` |
| N19, N21–N23 (r23) | RealAlgebraicGeometry; HF3a; DerivedDeRham; Crystalline | 5 cells for `X² − 1`; `H¹_c(ℝ,𝔽₃) = 𝔽₃`; `d(x^p) = 0` over `𝔽_p` |
| N16–N18 (r22), N1–N13 (r21) | ModularCurves §0B; C-1, C1 and C6 examples | `(ℤ/n)ᴰ ≅ μ_n`; `H¹(ℂ*,ℤ/n) = ℤ/n`; `h⁰(O(−1)) = 0` |
| 1–4 (r20) | the four `Suggested.lean` headlines | `ℓ²` refutes Montel without `FiniteDimensional`; `h = −id` on `ℓ²`; `(z₁dz₂ − z₂dz₁)/2`; the Warsaw circle |
| 11 (r20, r24) | `realComplexCurrentComparison` signs | `(−1)^(2−2+1) = −1`, `(−1)^(2−1+1) = +1` |
| 20 (r20) | C5.4 bijection (R01) | `δ[O(1)] = +1`; Enriques `δ[K]` is nonzero 2-torsion; `[O(p−q)] ≠ 1` with `δ = 0` (:3879) |
| 5–19, 23–29 (r20) | seeded and C1–C5 targets | as tabulated in r20 |

## Not verifiable

These are carried from r20–r25. No changed line cites a source.

- **Kato**, *Logarithmic structures of Fontaine–Illusie* (C5.5): no legal copy found.
- **Dimca**, *Sheaves in Topology* (part of `topologicalCoefficientComparison`): paywalled (Springer).
- **Hironaka**, *Triangulations of algebraic sets*, and **Bochnak–Coste–Roy**, Thm. 9.2.1 (part of `complexAlgebraicTopology`): no open host found.
- **Kleiman's published numbering "9.6.16"** (C3.2e): the AMS chapter is paywalled. The arXiv Theorem 6.16 was verified in r20.

## Source issues

- none
