# GATE-TemperleyLiebOperatorAlgebras~2: answers to the review of 44be852

The review (CBirkbeck, 2026-10-31T00:58Z) was written against `44be852`. The branch head was
`5d2764f`, which adds 1.8 and `CubicJonesTargets.lean`, so every README line number below refers
to `5d2764f` (two lines later than the review's for 1.5–1.7). Each defect pattern was also
repaired in 1.8. Repair commit: `c60e3157`. Only `TauCetiRoadmap/TemperleyLiebOperatorAlgebras/README.md` changed.
`Suggested.lean` did not change.

## H01 (CBirkbeck) — answered

The finding is correct, and it applies more strongly to `CubicJonesTargets.lean`: `factor` (lines 35–39) and `inversion` (lines 52–53) have `sorry` bodies, which is sorry'd data in the strict sense, and `model`, `fixedGenerator` and `braidUnit` depend on admitted propositions in the same way as `CliffordJonesTargets.lean`'s `evenProjection`, `model` and `coordinateInclusion`. The four companion files are outside the files this repair may edit, so they are unchanged. The README no longer refers to them (old 1.5–1.8 `*Needs:*` paragraphs → new itemised *Needs*), and it states every comparison in prose. The remaining fix is to delete the companion files, or to prove the five relation lemmas as the review describes and delete `factor`/`inversion`. The headline list does not include 1.5–1.8, so none of their statements belongs in `Suggested.lean`.

## H02 (CBirkbeck) — applied

README 570 and 948 (`blob/<sha>` links) → plain citations "GraphConnectivityAndFlows 1.1" (1.6 text and *Needs*) and "SpinGeometry G1 items 1 and 3" (1.7). Both suppliers now have their own subsections under `## Exact supplier contracts`. The gate reports `blob=0`.

## H03 (CBirkbeck) — applied

The two Mathlib pull-request links and the two Zulip links (README 769–772, 959–960) are deleted. What is consumed is now a Mathlib supplier contract: `Graph` (`Combinatorics/Graph/Basic.lean`), `Graph.restrict` (`Delete.lean:38`), `Graph.map` (`Maps.lean:39`), `Graph.toSimpleGraph` (`Simple.lean:100`), `SimpleGraph.ConnectedComponent`, and the Clifford API `ι`, `lift`, `map`, `even`, `equivEven`, `ι_sq_scalar`, `ι_mul_ι_add_swap`. The gate reports `prnum=0`.

## H04 (CBirkbeck) — applied differently

The source is identified and readable, so it is not recorded as uncertified. "Knot Theory physical p91/p92" is a reprint of V. F. R. Jones, *A polynomial invariant for knots via von Neumann algebras*, Bull. AMS 12 (1985), 103–111, from the AMS open archive. Printed p. 104 (JonesBullAMS1985 lines 57–83) covers the `A_n`, the Temperley–Lieb spin representation, the Potts–ice equivalence and the Powers state; printed p. 107 (lines 191–203) covers the Clifford algebras at `t = i`, and the cubic Clifford algebra and finite braid image at `t = exp(πi/3)`. 1.5–1.8 now cite these printed pages. `## References` gains entries for Jones 1985, Temperley–Lieb 1971 and Baxter–Kelland–Wu 1976 (both uncertified, cited by DOI), Galindo–Rowell (arXiv:1312.5557, Proposition 3.6 at GalindoRowell line 265) and Rowell–Wenzl (read as arXiv:1401.5329v4, Theorem 4.9 at RowellWenzl line 917). It also gains a separate entry for Iohara–Lehrer–Zhang, *The Jones quotients of the Temperley–Lieb algebras* (arXiv:1702.08128; Theorem 5.4 at IoharaLehrerZhang line 571, Proposition 5.5 at line 590). That is a different paper from the Iohara–Lehrer–Zhang entry already in the list, which 1.7's old link had silently pointed at.

## H05 (CBirkbeck) — applied

These passages are deleted: the scan commentary (old 536–543, "course scan's literal `ℂ^(2n+2)`"), the "prototypes"/"adopt as it lands"/"Historical sources" sentences (old 558–561, 773–780, 953–955, 1150–1152), the "certificate" and "checked finite slicing presentation" wording (old 648, 710–716, 744), and, in 1.8, the "multiplication/inversion and trace algorithms … finite enumeration … running time" passage (old 1124–1126, 1134–1135). The dimensions are now stated once, as a 1.5 Check (`2^m` spin, `4^m` GNS, `catalan m` cyclic, Jones's `A_n` = `TL_(n+1)`). The witnesses are now mathematical objects: a ribbon structure of genus zero, and a noncrossing partition on the outer face. All 1.5–1.8 text was rewritten, so the lost spaces are gone; a regex search for `(Layers?|Theorem|Proposition|Subfactors|degree|genus|circle|label)\d` returns nothing.

## H06 (CBirkbeck) — applied

Each of 1.5, 1.6, 1.7 and 1.8 now has prose definitions, an API bullet list, a `**Checks.**` list (5, 7, 6 and 6 bullets, each with computed values and the wrong model it excludes) and an itemised `*Needs:*`. `## Exact supplier contracts` gains Mathlib bullets (graphs, Clifford, `PMF`, `AlgHom.equalizer`, …) and the Tau Ceti spin-model names: `spinCup`, `spinCap`, `markovWeight`, `spinGenerator`, `spinRep`, `spinWeight`, `diagonal_spinWeight_mul_spinGenerator`, `commute_diagonal_spinWeight_spinRep`, `markovTrace_apply`, `Matrix.extendLast`. It also gains `BraidGroup`, `TemperleyLieb.jones`/`jonesUnit`/`jonesDelta`, `BipartiteRibbonGraph`, `facePerm`, `IsConnected.two_sub_two_mul_genus`, `CliffordAlgebra.basis`, `IsFactorSet`, `twistedMonoidAlgebra`, `HeisenbergGroup` and `LinearMap.BilinForm.IsAlt.exists_basis_toMatrix_eq_J`, all verified at the pin with their files. New supplier subsections: GraphConnectivityAndFlows, BelyiMaps, SpinGeometry, SpinRepresentations, VonNeumannAlgebras and GeometricTopology. TypeAHeckeAlgebras has no subsection because 1.5 consumes nothing from it; it now appears in the deferral list. Layer 1's Examples gain four bullets, its Dependencies list every new supplier, the Summary describes 1.5–1.8, and the deferral list gains six items.

## H07 (CBirkbeck) — applied

- "GeometricTopology4.5/4.7" → "GeometricTopology Layer 4", as on main; Layer 4 there has no Arf invariant or 25920-element group. The Arf interpretation at `t = i` and the identification of finite braid images with named groups are now listed as outside the roadmap.
- "VonNeumannAlgebras V1/V2's GNS, normal closures" → V0 (GNS), V2 (reference-vector tensors and slices), V4 (normal representations) and V10 (modular theory). V4 is used instead of the suggested V1 because the claim needs normal representations, not the bicommutant theorem.
- "Pauli" is dropped from the SpinGeometry contract; 1.7 owns the Pauli realisation.
- TypeAHeckeAlgebras is cited as "H3 and H4a" in the deferral list.

## H08 (CBirkbeck) — answered

The finding is correct: the four companion files import `Mathlib.<submodule>` lines and none imports `Mathlib`. `CubicJonesTargets.lean` adds six more such lines. The gate's import scan covers only `Suggested.lean`. These files are outside the files this repair may edit; the repair the review proposes is right, if the files are kept at all (see H01).

## H09 (CBirkbeck) — answered

The padding analysis is correct, and the same pattern recurs in `CubicJonesTargets.lean` (`fixed_dimension` and `braid_phase` are Checks; `inversion_weyl` restates an admitted definition). The companion files cannot be edited in this repair. On the README side, every statement the review lists as padding is now a Check or API bullet in prose, and no backticked name from a companion file appears in the README. The README therefore makes no README/Lean agreement claim about those files, and deleting them leaves the roadmap consistent.

## Adversarial pass on the changed statements

| Statement | Instances | Computed values | Result |
|---|---|---|---|
| `δ p_i = spinRep (−r) (e_i)` | native `spinCup`/`spinCap` at `q = −r` | cup(01)=1, cup(10)=r, cap(01)=r⁻¹, cap(10)=1 → block `[[r⁻¹,1],[1,r]]`; `/δ` = `[[1,r],[r,t]]/(1+t)` | holds |
| weight matrix `= δ^m D_t^(⊗m)` | `markovWeight` at `q = −r` | `(r⁻¹, r)` and `δ·(1,t)/(1+t) = (r⁻¹, r)` | holds |
| last-site slice `τ I₂` | `t = 4` | entries `(1/5)(4/5) = 4/25` twice, off-diagonal 0; `τ = 4/25` | holds |
| first-site slice | `t = 4` | `diag(16/25, 1/25)` | holds; added as Check |
| spin flip `t ↦ 1/t` | block `[[t,r],[r,1]]/(1+t)` | `= [[1,r⁻¹],[r⁻¹,t⁻¹]]/(1+t⁻¹)` | holds |
| `Z_Potts = Z_FK` | one edge, `q = 0, 1` | `Q²+Qv` → 0 and `1+v` | holds |
| bridge recursion | one edge | `(Q+v)·Z_(G/e) = (Q+v)Q`; with `Z_(G∖e) = Q²` it would be wrong | first draft wrote `G∖e`; corrected to `G/e` |
| Euler `ell = 2k+|A|−|V|−2g` | edgeless; edge; loop; two parallel edges | edgeless: `ell(∅) = 2n + 0 − n = n`; edge `{e}`: 1; loop: `2=2+1−1`; parallel `ell = 2,1,1,2` | holds |
| loop expansion | one edge | `δ²(δ² + v) = Q² + Qv` | holds |
| `Rot(I)=E`, `Rot(E)=I`, `Rot⁴ = Ad(W⊗W)` | exact rational computation at `r = 2`, random integer tensor | `Rot⁴ = (W⊗W)T(W⊗W)⁻¹` true, the reverse conjugation false, `Rot² ≠ id` on general `T` | holds; Check added (`T_(00,01)` scaled by `r⁻²`) |
| `A = C⁻¹`, `Σ A_ab C_ab = δ` | `C=[[0,1],[r,0]]` | `CA = I`; `r⁻¹ + r` | holds |
| `d_j² = −1`, `p_j² = p_j`, `p_j† = p_j` | Clifford relations | `(1+id)² = 2+2id` | holds |
| `c_a c_b = d_a ⋯ d_(b−1)` | `b = a+2` | `c_a c_(a+1) c_(a+1) c_(a+2) = c_a c_(a+2)` | exact (old text and my first draft said "up to sign"; corrected) |
| `T_m = (√2)^m s_m ∘ F_m` | `m = 2`, `x = e` | `2·√2·(1/2) = √2 = δ`; `x = 1`: `2 = δ²` | holds |
| `ker F_m = R_m` | both inclusions | `x ∈ R` ⇒ `s(F(x)F(x)†) = 0` ⇒ `F(x) = 0` | holds (1.8 version uses `†`, not surjectivity) |
| `dim Cl_m⁰`, `m = 0…5` | blocks | `1,1,2,4,8,16`; `dim Q_3 = 4 = 5−1` | holds |
| `g_j = −(1+d_j)/√2` | expansion | `u(i−1)(1+d)/2`, `u(i−1) = −√2`; eigenvalues `iu` (d=−i), `−u` (d=i) | holds |
| `g_j c_j g_j⁻¹ = −c_(j+1)` | direct | `(1+d)c_j(1−d)/2 = −c_(j+1)` | holds |
| braid image order `2^m m!` | `m = 2` | det-1 signed permutations: 4; times `{±1}`: 8 = order of `g_0` | holds |
| `F_m(jonesUnit a j) = (−a/u) g_j` | `a² = −u⁻¹` | `jonesDelta a = −(a²+a⁻²) = u+u⁻¹ = √2` (`√3` in 1.8); `a(1 − uE) = (−a/u)·g` | holds; new statement |
| `α = ω^(2B)` and `U_0U_1 = ωU_1U_0` | `B(e_0,e_1) = 1` | `α(e_0,e_1)/α(e_1,e_0) = ω²/ω = ω`; `α = ω^B` gives `ω²` | holds; Check added |
| radical of `B` for odd `N` | `ρ = (1,0,…,1)` | coefficient of `b_k` is `ρ_(k−1) − ρ_(k+1) = 0` for all `k` | holds |
| `dim C_N = (3^N+1)/2` and recurrence | `N = 0…5` | `1,2,5,14,41,122`; `4·41 − 3·14 = 122` | holds |
| block sizes/weights, `N = 2k+1` | `k = 0, 1` | `d_+² + d_−² + 9^k = (3^(2k+1)+1)/2`; weights sum to `3^k/3^(k+1) + 2/3 = 1`; `m = 4`: label weights `2/9, 6/9, 1/9` = `[1]·2, [3]·3, [5]·1` over `9` | holds |
| `g_j³ = −i` in 1.8 | eigenvalues | `i³ = −i`, `(−u)³ = −i` | holds |
| Galindo–Rowell comparison | `R` at `m = 3` | `R = (1+ωU+ωU²)/√3`; Galois `ω ↦ ω²` gives `−g_j` | holds |

Elaborated signatures: `Suggested.lean` is unchanged, so I compared its one declaration using the worker's `signatures.md`, which shows every binder of the README statement; I ran no new `#check`. Ownership: `roadmaps grep` over main and the open heads finds "Potts|Fortuin|random-cluster" and "Gaussian braid|quantum torus|cubic Clifford" only in this roadmap (GeometricQuantization's match is a prequantum torus, a different object). "Powers state" also appears in TypeAHeckeAlgebras on main (H4a, Hecke setting) and in VonNeumannAlgebras (ratio sets), and both are cited. No notion moved down.

## Build and gate

- `lake build TauCetiRoadmap.TemperleyLiebOperatorAlgebras.Suggested`: `Build completed successfully (8981 jobs)`, with the single warning `Suggested.lean:56:8: declaration uses 'sorry'`.
- Gate after commit: `gate TemperleyLiebOperatorAlgebras: set_option=0 blob=0 latex=0 tex=0 prnum=0 sorry-data=0 sorry-examples=0 residue=0 private-paths=0 imports=0 mathlib-subimports=0 no-import-mathlib=0 lean-lines=0 forbidden=0 dropped=0 readme-ids-missing=0 empty-sections=0 round-labels=0 long-fences=0 layer-ids=0 target-ids=0 depcheck=0 metadata=0 stray-files=0 dirty=0 outside-folder=0 source-material=0 OK`
- Dependency check: `depcheck: 204 roadmaps, 1399 edges, 0 problem(s)`, with no UPWARD, CYCLE or `moved:` line.
- `roadmaps resolve` on the README: no cross-roadmap citation and no Lean name found nowhere.
- Sources: JonesBullAMS1985 (AMS open archive, fetched with licence class `publisher-open`), IoharaLehrerZhang (arXiv:1702.08128), GalindoRowell (arXiv:1312.5557) and RowellWenzl (arXiv:1401.5329v4) were fetched and read at the cited lines. This job cannot edit the roadmap's `sources.toml` (none exists yet), so these four and the two uncertified DOIs still need to be recorded there. No text is missing, so no `needs-references.toml` is left.
