# Review of TeichmullerGeometry (pull request #1169 at 417bd27)

**Verdict:** accepted

This is an incremental re-review of the 21 lines that changed since `9e49e59`. All of them are in `TauCetiRoadmap/TeichmullerGeometry/README.md`. `Suggested.lean` is byte-identical to `9e49e59`, and no file outside the folder changed. The previous finding is repaired. The repair introduced no new problem, and the changed passages contain no defect. This report has no findings.

## Previous findings

- R01 — repaired:
  - §2.2 (line 427) now ends with "the conformal automorphism group `Aut(X)`, which Layer 5.6 identifies with the stabilizer of `[(X, m)]` in `Mod⁺(Σ)`".
  - §3.3 (line 497) now proves "the local form of the coarse quotient map `π`".
  - §8.5 (line 839) derives `K_X` and the criterion. The Check moved to line 846.

## Verified sound

### Mechanical checks at `417bd27`

- **Gate.** The brief's gate command exits 0:

  ```text
  gate TeichmullerGeometry: set_option=0 blob=0 latex=0 tex=0 prnum=0 sorry-data=0 sorry-examples=0 residue=0 private-paths=0 imports=0 mathlib-subimports=0 no-import-mathlib=0 lean-lines=0 statement-hygiene=0 forbidden=0 dropped=0 readme-ids-missing=0 empty-sections=0 round-labels=0 long-fences=0 layer-ids=0 target-ids=0 depcheck=0 metadata=0 stray-files=0 dirty=0 outside-folder=0 source-material=0 OK
  ```

  The worker's run also reports `build=0`.
- **Dependency check.** The brief's command exits 0 and prints no UPWARD, CYCLE or `moved:` line:

  ```text
  depcheck: 238 roadmaps, 2320 edges, 0 problem(s)
  ```

- **Elaboration.** `lake env lean TauCetiRoadmap/TeichmullerGeometry/Suggested.lean` exits 0. Its only diagnostics are 21 "declaration uses `sorry`" warnings.
- **`#check @name`.**
  - One scratch file holds all 55 entries of `signatures.md`. The 52 declarations elaborate.
  - The two errors are the docstring words `groups` and `group`; `and` resolves to Lean's `and`.
  - The file is unchanged since `9e49e59` (`git diff` is empty), so the binder comparison and the padding probe of the earlier reports still apply.
- **Folder and diff.**
  - The folder holds `README.md`, `Suggested.lean` and `metadata.toml`.
  - `git diff --stat origin/main...HEAD` outside the folder is empty.
  - No heading changed, so no id is dropped (`dropped=0`).
- **Overlaps and citations.**
  - `overlaps.md` reports no conflicting pull request and no dropped id.
  - The 15 entries of `citations.md` are this roadmap's own names, declared in `Suggested.lean`. They are on lines 217–264, which this change does not touch.

### Changed passages checked

- **Scope, line 14.** It says this roadmap owns the local form of the coarse quotient map, and that its kernel is Orbifolds O2 item 3's ineffective kernel read on the topological action.
  - Orbifolds on main, line 173, defines that kernel by "arrows inducing the identity germ".
  - In the action groupoid `Teich(Σ) ⋊ Mod⁺(Σ)`, the arrow `(g, x)` induces the identity germ exactly when `g ∈ K`. The clause stating how this roadmap's kernel differs is accurate.
- **Mathlib supplier, line 62.**
  - `ProperlyDiscontinuousSMul.exists_nhds_image_smul_eq_self` is at `Mathlib/Topology/Algebra/ConstMulAction.lean:572`.
  - Its binders (lines 563–570) are `[ProperlyDiscontinuousSMul Γ T]`, `[T2Space T]`, `[LocallyCompactSpace T]` and `[ContinuousConstSMul Γ T]`.
  - Its conclusion is `∃ U ∈ 𝓝 x, ∀ γ, ((γ • ·) '' U ∩ U).Nonempty → γ • x = x`. The README's paraphrase matches.
- **§3.3, line 497.** Row M1 checks the criterion in both directions.
  - `K` is normal in `G`: if `k` is the identity on `U`, then `gkg⁻¹` is the identity on `gU`, which contains `gx = x`.
  - `V = ⋂_{g∈G} g(int U ∩ W)` is open and `G`-invariant, and `K` acts trivially on it. It satisfies `γV ∩ V ⊆ γU ∩ U = ∅` for `γ ∉ G`.
  - `G/K` acts effectively on `V`, because an element trivial on `V` is trivial near `x`.
  - Each hypothesis of the Mathlib lemma has a source the *Needs:* line lists:
    - Hausdorff: §2.3;
    - local compactness: §2.1's charts from a polydisc;
    - continuity of each mapping class: §3.2;
    - proper discontinuity: §3.3 itself.
- **Duplication by object.**
  - Mathlib's `IsQuotientCoveringMap.isCoveringMapOn_of_properlyDiscontinuousSMul` (`Mathlib/Topology/Covering/Quotient.lean:262`) covers only the image of points with `MulAction.stabilizer G e = ⊥`.
  - In genus two every stabilizer contains `h`, so that lemma covers no point there. §3.3 is not a restatement of it.
  - `roadmaps grep` finds no other roadmap stating this criterion. The patterns were `exists_nhds_image_smul_eq_self`, "local homeomorphism exactly (at|when)" and "acts trivially near … branched".
- **§2.2, line 427.**
  - The new sentence points forward to Layer 5.6 for the stabilizer identification and proves nothing from Layer 5.6. §2.2's *Needs:* line (435) still covers what §2.2 proves.
  - Check 3 (line 433), on `y² = x⁶ − 1`, is row M6. It agrees with §0.4 Check 3 (line 331) and §0.5 Check 2 (line 357).
- **§8.3, *Needs:* line 822.** It now lists §0.0e. The text uses §0.0e at line 814: "read in the half-plane model by §0.0e".
- **§8.5, line 839, and *Needs:* line 849.** Rows M4 and M5 check the new statements and Checks.
  - §7.3 is the new *Needs:* edge. Line 731 proves `Teich(Σ)` contractible, which gives the connectedness of `Teich(S_2)` that line 839 uses.
  - §7.3 needs only §§7.1, 7.2 and 2.3, and Layer 7 consumes Layers 0 to 5, so there is no cycle.
- **Consumers of the changed ids.**
  - `roadmaps grep` finds no roadmap citing this roadmap's §2.2 or §8.5.
  - GroupActionsOnRiemannSurfaces at its head cites §3.3 at line 1159, and only for proper discontinuity, which §3.3 still states.
  - QuaternionArithmetic cites only §9.1.

### Seeded sample

- **In scope.** Only one sampled target falls in or is cited by the change: §7.3, the new *Needs:* edge of §8.5.
  - What §8.5 consumes from §7.3 is contractibility (line 731).
  - Its straight-line homotopy `((1−s)ℓ_i + s, (1−s)t_i)` stays in `(0,∞)^(3g−3) × ℝ^(3g−3)`: at `s = 1` it is `(1, …, 1; 0, …, 0)`, and every length stays at least `min(ℓ_i, 1) > 0`.
  - §7.3's locators are under Not verifiable.
- **Also used by the change.** §0.4's marking relation and §0.2's identification of `Diff₀` with isotopy to the identity are used by §2.2 Check 3.
  - They agree with row M6.
  - Neither changed, and r19 checked them.
- **Out of scope.** The other sampled targets are untouched and are not cited by the changed text: §§0.0h, 0.3, 0.4a, 1.2, 4.4, 4.5, 6.1, 7.4, 7.5, 9.2, 10.1 and 10.4. Their earlier checks stand (rows 7, 8, 14, S5, S9, S14, C2, C3).

### Adversarial table

Rows M1–M8 cover the changed statements, with values computed in this review. Every other row is carried from the previous report (r20, at `9e49e59`), whose statements this change leaves untouched. M1–M5 replace r20's rows N2 and N3, whose statements moved to §§3.3 and 8.5.

| # | Statement | Instances | Values computed | Result | Change |
|---|---|---|---|---|---|
| M1 | §3.3: `π` is a local homeomorphism at `x` iff `K = G`; branched otherwise, `|G/K|`-to-one at points of `V` with trivial stabilizer in `G/K` | `SL₂(ℤ)` on `ℍ` at generic `τ`, `i`, `ρ = e^(2πi/3)`; `ℤ/2` on `ℝ` by `x ↦ −x`; trivial `ℤ/2` action; `G = 1` | generic `τ`: `G = K = {±I}`, `|G/K| = 1`, local homeomorphism; `i`: `|G| = 4`, `|K| = 2`, fibre `{w, −w}`, 2-to-1; `ρ`: `|G| = 6`, `|G/K| = 3`, 3-to-1; `x ↦ −x`: `K = 1` (no neighbourhood of `0` fixed), `π = |·|` is injective on no neighbourhood of `0` and 2-to-1 off `0`; trivial action: `K = G`, `π = id`; `G = 1`: local homeomorphism | true | none |
| M2 | §3.3 Check 4 | `w = (z−i)/(z+i)` at `z = 0.3+1.2i, 2+0.5i, −1+3i`; matrix orders | `|w(−1/z) + w(z)| = 0` at all three, so `S` acts as `w ↦ −w`; `S^4 = I` with `S² = −I`; `ST = [[0,−1],[1,1]]` has order `6` and `|ST(ρ) − ρ| ≈ 4·10⁻¹⁶`; `−I` fixes all of `ℍ`, so a trivial-stabilizer criterion fails at every point | true | none |
| M3 | Mathlib supplier (line 62) and its use in §3.3 | binders at `ConstMulAction.lean:563–570` | four instance binders `ProperlyDiscontinuousSMul`, `T2Space`, `LocallyCompactSpace`, `ContinuousConstSMul`; each supplied (§3.3, §2.3, §2.1, §3.2); conclusion gives `γ • x = x` from `γU ∩ U ≠ ∅` | true | none |
| M4 | §8.5: `K_X = 1` for `g ≥ 3`, `K_X = ⟨h⟩` for `g = 2`; criterion `Aut(X) = 1` resp. `⟨h⟩` | `g = 3` hyperelliptic; `g = 2` cases `(h, r) = (0,6), (1,3), (2,0)`; generic quartic | `g = 3`: nontrivial `F` has codimension `≥ g + h − 2 ≥ 1`, the hyperelliptic `F` has dimension `−3 + 8 = 5 < 6`, so `K_X = 1`; `g = 2`: `(0,6)`: `2 = |K|(−2 + 3)`, `|K| = 2`; `(1,3)`: right side `≥ 3|K|/2 ≥ 3 > 2`; `(2,0)`: `|K| = 1`, excluded; quartic `Aut = 1`: local homeomorphism | true | none |
| M5 | §8.5 Checks 4 and 5 | genus two `Aut = ⟨h⟩`; Bolza; genus-three hyperelliptic | `|Aut/K_X| = 2/2 = 1`, `48/2 = 24`, `2/1 = 2`; a count by `|Aut|` gives `2`, `48`, `2`; the same `⟨h⟩` is unbranched in genus two and branched in genus three; agrees with §2.1 Check 1 (row N1) and with M1's `|G/K|` count | true | none |
| M6 | §2.2 sentence and Check 3 | `X : y² = x⁶ − 1`; `h(x, y) = (x, −y)` | genus `(6 − 2)/2 = 2`; `X/⟨h⟩ = ℙ¹`, so `h` has no invariant class in `H₁(X) ≅ ℤ⁴` and acts as `−1`, so `m⁻¹hm ∉ Diff₀(Σ)` (§0.5); marking-compatible self-arrows of `(X, m)`: `{id}`; all self-isomorphisms: at least `{id, h}`; `h` is an arrow `(X, m) → (X, h ∘ m)`, matching §0.4 Check 3 | true | none |
| M7 | Scope line 14: Orbifolds O2 item 3 | Orbifolds on main, line 173 | kernel there = arrows inducing the identity germ; here = elements of `G` that are the identity near `x`; equal for the action groupoid; the difference (topological action, no Lie-groupoid presentation) is stated | true | none |
| M8 | *Needs:* edits (lines 506, 822, 849) | §3.3 + §2.1, §2.3, Mathlib; §8.3 + §0.0e; §8.5 + §7.3 | each added item is used in its text (lines 497, 814, 839); no added edge points to a later layer; §7.3 needs §§7.1, 7.2, 2.3; depcheck 0 problems | true | none |
| N1 | §2.1 Check 1 | as in r20 | `2/2 = 1`, `48/2 = 24`, `2/1 = 2`, `1/1 = 1` | true (r20) | none |
| N4 | ModularForms §10B citation | `ℙ¹`, `D = −2P`; genus one | `χ = −1`; `χ = 0` | true (r20) | none |
| N5 | Epstein 6.4 a) locator and scope | closed disc with `z̄` | degree `−1` on `S¹` against `+1` | true (r20) | none |
| N6 | Downstream consumers (lines 994–998) | dropped-id searches | 0 matches | true (r20) | none |
| 1 | `image_boundary` (§0.0b) | half-plane, disc against sphere | `∂D² = S¹ ≠ ∅ = ∂S²` | true (r20) | none |
| 2 | `exists_pl_approximation_open`, `_halfPlane` | `φ = 1/(1+‖x‖)`, `1/q` | `φ ≥ 1/(2+‖x‖)` on `B(x,1)`; `inf 1/q = 0` | true (r20) | none |
| 3 | `isotopic_of_homotopic_closedSurface`, `isotopicRel_of_homotopicRel` | disc with `z̄`; Klein bottle | hypotheses fail on the disc; `(x+t/2, y)` commutes with `τ` | true (r20) | none |
| 4 | schema words, `StandardSurface.eulerChar` | `aa⁻¹`, `aa`, `aba⁻¹b⁻¹` | `χ = −2, −1, 0` | true (r20) | none |
| 5 | classification, `homeomorph_iff_invariants`, `homeomorph_unique` | `T²`, `S₂`, Klein bottle, annulus | invariants pairwise distinct | true (r20) | none |
| 6 | `Surface.genus`, `eulerChar_eq_two_sub_two_mul_genus` | `S²`, `T²`, `S₂`, Klein bottle | `χ = 2, 0, −2`; Klein bottle excluded | true (r20) | none |
| 7 | §0.0g branched covers, `riemannHurwitz` | `zⁿ`; `S² → ℝP²` | `2 = 2n − 2(n−1)`; `2 = 2·1` | true (r20) | none |
| 8 | `MappingClassGroupFull`, `toTop_bijective` (§0.0h) | disc; tetrahedron | 2 classes; 2 against 24 | true (r20) | none |
| 9 | `OuterAut` | `S₃`, `Q₈`, `ℤ`, `ℤ²` | `1`, `6`, `2`, `GL₂(ℤ)` | true (r20) | none |
| 10 | `dehn_nielsen_baer` | `T²`, `S²` | `GL₂(ℤ)`; `2` against `1` | true (r20) | none |
| 11 | `exists_diffeomorph_mapOfEq_eq` | shear | `(x, x+y)` | true (r20) | none |
| 12 | `baer_epstein_smooth` | antipodal map of `S²` | degree `−1` | true (r20) | none |
| 13 | `mcg_sphere_full`, `mcg_torus_full` | `−I₃`; `−I₂`; swap | `−1`; `+1`; `−1` | true (r20) | none |
| 14 | `measurable_riemann_mapping` (§7.4) | `μ = a`, `0`, `z̄` | `f_z̄ = a f_z` | true (r20) | none |
| 15 | `nielsen_realization` | `T²` with `⟨−I⟩`; Dehn twist | lift of order 2; no finite lift | true (r20) | none |
| S1 | §0.0c | tetrahedron, 3-simplex, seven-vertex torus | `2`, `1`, `0` | true (r20) | none |
| S3 | §0.1 | `g = 2` | `g = 2` | true (r20) | none |
| S4 | §0.2 | `S¹`; reparametrisation | `π₀ = ℤ/2` | true (r20) | none |
| S5 | §0.4a | `diag(1,−1)`, `diag(−2,1)` | `−z̄`; `−2z̄`; `log 2` | true (r20) | none |
| S8 | §2.3 | `T²` | `ℍ`; `ℍ/GL₂(ℤ)` | true (r20) | none |
| S9 | §4.5 | `K₀ = −1`; genus 2 | `0`; `∫K = −4π` | true (r20) | none |
| S10 | §5.5 | chains of `2g+1`, `2g` curves | 2 against 1 boundary circles | true (r20) | none |
| S11 | §7.4 | Beurling transform | multiplier of modulus 1 | true (r20) | none |
| S12 | §8.1 | `ML(T²)` | `i = 1`; twist `+ℓ` | true (r20) | none |
| S13 | §8.5 case analysis (unchanged part) | `g = 3`; `g = 2` cases | codim `1`; `|K| = 2` | true (r20) | none |
| S14 | §9.2 | Bolza | `48·π/12 = 4π` | true (r20) | none |
| S15 | §11.1 | Klein quartic | `336 = 168(g−1)` | true (r20) | none |
| C1 | Conventions; §4.3 | `x²` | `Δ⁺(x²) = −2` | true (r20) | none |
| C2 | §10.1 | `(2,3,7)`, `(2,3,8)` | `1/42`, `1/24` | true (r20) | none |
| C3 | §§7.1, 7.5 | `B = 2 asinh 1`; `k = ½` | `≈ 1.7627`; `≈ 0.5493` | true (r20) | none |

### Ownership against open pull requests

- The new owned item is the local form of the coarse quotient map. It was searched by object on main and at the open heads.
- The closest roadmaps by vocabulary are PlanarTopology, GeometricTopology, SurfaceTopology, ArithmeticFuchsianGroups and FuchsianOrbifolds. None of them states it.
- FuchsianOrbifolds Layer 1 keeps the elliptic quotient charts for discrete subgroups of `PSL₂(ℝ)` on `ℍ`, where the action is effective. This roadmap cites that layer and does not restate it.

### Remarks on untouched and supplier text (no change requested)

- **Layer 3 Dependencies (line 514).** It does not name Mathlib's new input, nor the local form among what Layer 3 supplies to Layer 8. The paragraph is a summary that never listed every Mathlib declaration, so it is not wrong.
- **FuchsianOrbifolds at its head `f997c5f`, line 814.** It still says this roadmap's Layer 10 consumes the equality case of item 1. §10.1 uses only the inequality.
- **ComplexCurveModuli on main, lines 45 and 47.** They still cite "ModularForms10B(i)–(iv)". This roadmap does not copy those labels.

## Not verifiable

- **§7.3's locators**: Imayoshi–Taniguchi §3.2, Farb–Margalit §10.6 and Hubbard 2006 Chapter 7.
  - The sources service found no legal copy of Farb–Margalit: the DOI `10.1515/9781400839049` lands on a publisher page in no licence class, and the authors' page copy returned HTTP 403.
  - Imayoshi–Taniguchi and Hubbard are not openly available.
  - The only fact the change consumes from §7.3, contractibility, was checked mathematically above.
- **The untouched passages keep the previous report's list.** These are cited by locator only:
  - Douady–Earle 1986;
  - Ahlfors–Bers 1960;
  - Wolpert 1979;
  - Moise 1977;
  - Massey 1977;
  - Munkres 1966;
  - Hirsch (uncertified);
  - Kerckhoff 1983 (waived).

## Source issues

- none
