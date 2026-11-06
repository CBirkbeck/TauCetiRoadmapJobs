# Review of McKaySkewGroup (pull request #223 at 5466217)

**Verdict:** accepted

Incremental re-review of the 5 lines changed since `17924c7` (the head the previous review read): two README passages, both the Ito–Nakamura citation (`README.md:1972` and the [IN99] References entry at `README.md:2190–2193`). `Suggested.lean` is unchanged. The change repairs the previous report's only finding (R01, the page of a differently paginated copy) and introduces no new problem. The gate passes at this head; the dependency check is clean; the Lean file elaborates at the branch's pin with `sorry` as the only warning. No finding remains.

## Previous findings

- R01 — repaired: `README.md:1972` now reads "Ito–Nakamura [IN99, Theorem 9.3] for finite `Γ ⊂ SL₂(ℂ)`" and the References entry reads "Theorem 9.3 (p. 204 of the copy on the second author's web page, paginated 169–249)"; both match the copy read (witnesses under Verified sound).

## Verified sound

**Head, change set, gate, dependency check.** Head `5466217495b3a0a517e5b074381c4c3cf7cb0278`, worktree clean; `git diff --stat origin/main...HEAD -- . ':!TauCetiRoadmap/McKaySkewGroup'` is empty (no file changed outside the folder). `git diff 17924c7..HEAD --name-only` lists `TauCetiRoadmap/McKaySkewGroup/README.md` only (3 insertions, 2 deletions, exactly the diff in the brief). The folder holds `README.md`, `Suggested.lean`, `metadata.toml`. Rerun of the gate at this head (text scanners and the dependency check; the worker's run at the same head adds `build=0`):

```
gate McKaySkewGroup: set_option=0 blob=0 latex=0 tex=0 prnum=0 sorry-data=0 sorry-examples=0 residue=0 private-paths=0 imports=0 mathlib-subimports=0 no-import-mathlib=0 lean-lines=0 forbidden=0 dropped=0 readme-ids-missing=0 empty-sections=0 round-labels=0 long-fences=0 layer-ids=0 target-ids=0 depcheck=0 metadata=0 stray-files=0 dirty=0 outside-folder=0 source-material=0 OK
```

Rerun of the dependency check:

```
depcheck: 241 roadmaps, 2362 edges, 0 problem(s)
```

No UPWARD, CYCLE or `moved:` line; the merge order lists McKaySkewGroup at line 297, after KacMoody (line 3), its only open-pull-request supplier.

**The pins.** Unchanged from the previous report: the branch's `lake-manifest.json` records Tau Ceti `a91d3aaf` and Mathlib `6b7abb3c`, and the worktree's package checkouts are at exactly those commits; `origin/main` records Tau Ceti `2fd255d9` and Mathlib `1b1ccf4b`. The Lean file did not change, so the previous report's table of every cited declaration at both pins stands.

**Elaboration at the branch's pin.** `lake env lean TauCetiRoadmap/McKaySkewGroup/Suggested.lean` from the worktree: exit 0 in 41 s, exactly nine `declaration uses sorry` warnings at lines 87, 96, 106, 142, 153, 188, 322, 339, 388 (the nine sorried theorems), no other warning or error. The imports are `import Mathlib` plus nine `TauCeti.*` modules (lines 1–10), the same as at `17924c7`. No declaration changed, so the previous reports' `#check @name` comparison of the 26 declarations and the one-tactic padding probe (none of the nine bodies closes) stand.

**The changed passages against the source.** The IN99 text in the sources cache is the copy from the second author's web page (the manifest entry `IN99` in `packages/McKaySkewGroup/sources.toml` records `fetched_from` as the `~nakamura` page, `licence_class = "author-page"`, `status = "certified"`; Nakamura is the second author). Its 81 scan pages carry running heads `170` at scan page 2 (`IN99 line 39`), `175` at scan page 5 (`line 218`), `204` at scan page 36 (`line 1240`), `248` at scan page 80 (`line 2784`) and `249` at scan page 81 (`line 2818`): so scan page 1 is page 169, the copy is paginated 169–249, and page 204 = 169 + 35 is scan page 36. Theorem 9.3 is at `IN99 line 1263–1265`, the first theorem on that page, stating for a finite subgroup `G ⊂ SL(2,ℂ)` of order `n` that the unique irreducible component of `Hilb^n(𝔸²)^G` dominating `𝔸²/G` is a crepant, equivalently minimal, resolution. The References entry's "p. 204 of the copy on the second author's web page, paginated 169–249" is therefore exact, and the published range `151–233` is kept for the chapter itself, as the entry's venue. `README.md:1972` cites the theorem number alone, which is the same in both paginations. No other line of the README or the Lean file mentions IN99 (grep: lines 1972 and 2190 only). The rest of the bullet at `README.md:1971–1975` (BKR01 Theorem 1.2 at `BKR01 line 122–123`, the Ito–Nakajima remark at `line 65–68`) is unchanged and was verified in the previous report.

**House style on the changed lines.** Prose with code spans; no LaTeX, no process words, no pull-request number, no machine path (gate `latex=0 tex=0 prnum=0 round-labels=0 private-paths=0`). The phrase "of the copy on the second author's web page" is a version locator of the same kind as the "arXiv `math/9908027` (v2 read)" notes of the BKR01 and KV00 entries, not a process remark.

**The seeded sample where it falls in the changed passages.** Only §7.4 (`Γ`-clusters and the resolution) contains a changed line, checked above. The other sampled targets (0.1, 0.2, 1.1, 1.2, 3.3, 4.2, 5.1, 5.2, 5.3, 6.1, 6.3, 6.4, 7.2, 7.3) are untouched by the diff and were verified by the previous full reviews.

**Adversarial pass.** Rows A01–A54 of the previous report (`PRREVIEW-McKaySkewGroup~7`, with A01–A47 from `~5` and A48–A51 from `~6`) concern statements the diff leaves untouched and are carried forward with their key values; A55 was the previous report's row for the page number, now resolved; A56 is new.

| ID / statement | Instances and values | Result |
| --- | --- | --- |
| A01 §0.1 quaternion map (r5) | `!![I,0;0,−I]·!![0,1;−1,0] = !![0,I;I,0]` = image of `k`; icosahedral count `96 + 24 = 120`. | Retain. |
| A02 §0.2 pole equation (r5) | `(2,3,4)`: `23/12 = 2 − 2/24`; `(2,3,6)`: sum `2`, impossible. | Retain. |
| A03 `finite_subgroup_SL2_classification` (r5) | trivial `H` cyclic; `C₄₈`, `Q₄₈` both order `48`; `QuaternionGroup 1 ≅ C₄` excluded by `2 ≤ n`. | Retain. |
| A04 conjugacy theorems (r5) | cyclic: `diag(ζ^a, ζ^{−a})`, `a` a unit, same image; `SL(2,𝔽₃)`: `det(ρ⊗χ^j) = χ^{2j}`, only `j = 0`; order `48`: `C₄₈`, `QuaternionGroup 12`, `2O`. | Retain. |
| A05 `IsMcKayLabelling`, `C₂`, `A 1` (r5) | `Hom(sign, V⊗triv) = 2 = 0 − (−2)`; marks `(1,1)`; `cartanMatrix 0 1 = −2`. | Retain. |
| A06 trivial group (r5) | `Hom(triv, V⊗triv) = 2 ≠ 0`: no labelling; `[Nontrivial G]` needed. | Retain. |
| A07 invalid types (r5) | `D 3`: `(Mδ)_end = 1 ≠ 2`; `D 2`: `(Mδ)_1 = 0 ≠ 2`. | Retain. |
| A08 `Ẽ₈` marks (r5) | `(Cδ)_0 = 12 − 12 = 0`, `Σδ² = 120`; `Ẽ₇`: `48`; `Ẽ₆`: `24`; `D̃_{n+2}`: `4n`. | Retain. |
| A09 `rootLatticeQuotientMap` (r5) | `Ã₁`: `(1,0) ↦ −1`, `(0,1) ↦ 1`, `(1,1) ↦ 0`. | Retain. |
| A10 form preservation (r5) | `x = (0,1)`: `2 = 1·2·1`; `.A 0`, `x = [1]`: `2 ≠ 0`, `Valid` necessary. | Retain. |
| A11 kernel and image (r5) | kernel `ℤδ` since `δ_0 = 1`; `q(e_{b(i)}) = e_i`. | Retain. |
| A12 `Q₈`, `Ẽ₈` Checks (r5) | `(1,1,1,2)·C·(1,1,1,2) = 14 − 12 = 2`; column at node `8` is `e_7`, mark `2`. | Retain. |
| A13 §3.1 Checks (r5) | `single g 1 * single 1 x = single g (−x)`; `A = k`, `Γ = C₂`: two simples. | Retain. |
| A14 §3.2 Checks (r5) | `(1#g)(x#1) = −x#g`; `(x#1)(1#g) = x#g`. | Retain. |
| A15 `IsMcKayQuiver` (r5) | trivial group one loop; `C₂` two arrows; `Q₈`: `M_ii = 0`. | Retain. |
| A16 boundary groups (r5) | trivial: `ℂ[x,y] = Π(loop)`, `f = 1`; `C₂`: `Π(Ã₁)` on four arrows. | Retain. |
| A17 cyclic corner (r5) | `n = 3`: `(−1)³ = −1` invariant; `n = 4`: `X_i ↦ (−1)^i X_i`; dimensions `4n + 10`, `34`. | Retain. |
| A18 `Q₈` scalar-weight module (r5) | `aa* − a*a = E₁₁ − E₀₀`: `λ = (1, −1)`, simple of dimension `2`. | Retain. |
| A19 trace-weight exclusion (r5) | `(−2, +1, 0,0,0)`: `−2d_c + d_l = 0`, `d_c + d_l ≤ 2` forces `0`; `1 + 2·(−1) = −1 ≠ 0`. | Retain. |
| A20 trace versus scalar (r5) | `z = e_c`: scalars `(0,0,0,0,1)`, traces `(0,0,0,0,2)`; `Tik22 line 137`. | Retain. |
| A21 §5.3 Checks (r5) | scaling by `2`: `4λ`; Weyl algebra: `Tr[a,a*] = 0 ≠ dim`; `𝔽₂`: `E₀₀ − E₁₁ = I`. | Retain. |
| A22 sign of `λ` (r5) | `a ↔ a*` sends `ρ ↦ −ρ`; trivial group: Weyl algebra. | Retain. |
| A23 `cbhRelator` (r5) | `z = 0`: ideal `(xy − yx)`, `CBHAlgebra ≅ Sym(V)⋊G`. | Retain. |
| A24 §6.2 kernel square (r5) | FKS (6.3) at `x = −x_a` equals `l(s_a c) − r(c)` on both summands. | Retain. |
| A25 §6.2 Checks (r5) | braid: both composites send `(x_a,x_b) ↦ (−x_b, −x_a)`. | Retain. |
| A26 §6.1 Checks (r5) | `ℚ[t]/(t²)`: nonzero in `Mod(Ã_0)`, zero in `K(A,0)`; `ℚ[u,u⁻¹]`: `h = u⁻¹d/2`. | Retain. |
| A27 §6.3 central lifts (r5) | `Σ z_i = 1`; `θ(Ωe_c)` central; `ewe = 0` for `w = E^c₁₂`. | Retain. |
| A28 parameter dictionary (r5) | `t_i = −ζ^Q_i`, `x = −t_a`. | Retain. |
| A29 §6.4 Fourier Check (r5) | `e_χ = (χ(1)/|G|) Σ χ(g⁻¹)g`; dimensions `4δ_a`, `16δ_a²`. | Retain. |
| A30 §6.5 `Q₈` endpoint test (r5) | `c_ab = 1`, `c_ba = −2`; weighted `2, −2`. | Retain. |
| A31 §6.5 Checks 2–3 (r5) | `(v,w) ↦ (v, rw)` rescaling; `f_c` changes by `2f_l`. | Retain. |
| A32 §7.1 Checks (r5) | `s·x = −y`, `s·y = x`; `C₂` fibre length `3 ≠ 2`. | Retain. |
| A33 §7.1 freeness (r5) | eigenvalue `1` in `SL₂` of finite order forces `g = I`. | Retain. |
| A34 §7.2 cyclic and dihedral (r5) | `X² = Z(Y² − 4Z^m)`; `m = 1`: `C₄`, `A₃`. | Retain. |
| A35 §7.2 Checks (r5) | Molien `C₂`: `(1+t²)/(1−t²)²`; `Q₈` at `(1,2)`: `900 = 4·225`; `12·20 = 240 = 2|Γ|`. | Retain. |
| A36 §7.2 table vs GSV83 (r5) | `GSV83 line 424–428`: `E₆ (6,8,12)`, `E₇ (8,12,18)`, `E₈ (12,20,30)`. | Retain. |
| A37 §7.3 Checks (r5) | `C₂`: one `P¹`, `E² = −2`; `C₃`: `−C(A₂)`; `Γ = 1`: empty. | Retain. |
| A38 §7.4 Checks (r5) | `(y − ax, x² − b)`: basis `1, x`; tangent dimension `2`. | Retain. |
| A39 §7.5 Reynolds projector (r5) | `P = ½!![1,1;1,1]`, `P² = P`, `det !![1,1;1,−1] = −2`; `S₃`: ranks `1 + 2`. | Retain. |
| A40 §7.5 ranks (r5) | `Q₈`: `Σδ_i² = 8`, `Σδ_i = 6`; `O_Y → T_triv` an isomorphism. | Retain. |
| A41 §7.5 degrees and cycle (r5) | `Z·E_c = −4 + 3 = −1`, `Z·E_k = 0`; `E_c + ΣE_k` fails (`+1`). | Retain. |
| A42 §7.5 minimality (r5) | `Y + E ≤ Z` step; stops at the highest root. | Retain. |
| A43 §7.6 Checks (r5) | `248 = 8 + 240`; `Σδ_i = 29` over finite `Ẽ₈` nodes, unrelated. | Retain. |
| A44 §1.1 weighted identity (r5) | `Σ_{j≠i} M_ijδ_j = 2δ_i − M_iiδ_i` gives `xᵀ(2I−M)x`; `M = [2]`: `0 = 0`. | Retain. |
| A45 §1.1 highest-root lemma (r5) | `A₂`: `C′(1,1) = (1,1)`; `A₁×A₁` two dominant roots; `B₂` two. | Retain. |
| A46 §3.3 Checks (r5) | `R = x⊗W`: dimension `2` versus `4`; `Π_n S` uncountable vs `ℚ[x,y]`. | Retain. |
| A47 Lean generality vs README (r5) | §1.2, §2.2, §4.1, §5.3 hypotheses match `[Nontrivial G]`, `ht`, `hneg`/`hgraph`, `hz`/`hlam`. | Retain. |
| A48 `skewMonoidAlgebra_smulCommClass` (r6) | both sides `single (gh) (c·a·(g•b))` using `SMulCommClass G k A`; control `k = A = ℂ`, `G = C₂` by conjugation, `c = i`: `i#g ≠ −i#g`. | Retain. |
| A49 `skewMonoidAlgebra_isScalarTower` (r6) | `(c•single g a)(single h b) = c • single (gh) (a·(g•b))`; conjugation control holds. | Retain. |
| A50 `README.md:217–219` file of `instAlgebra` (r6) | `a91d3aaf`: `Idempotents/Corner.lean:162`; `2fd255d9`: `Idempotents/Corner/Basic.lean:211`; reached through `Morita/Corner.lean` at both pins. | Resolved (r6). |
| A51 `Suggested.lean:7` import (r6) | `TauCeti.RingTheory.Morita.Corner` present at both pins; gate `imports=0 build=0`. | Resolved (r6). |
| A52 §7.4 "crepant, hence minimal" (r7) | `(−1)`-curve has `K·E = −1 ≠ 0`, so a crepant resolution contains none; ADE minimal resolution: `K·E_i = −2 − (−2) = 0`, crepant. Trivial group: identity, consistent with A37. | Retain. |
| A53 §7.4 irreducibility of `Γ-Hilb(V)` (r7) | BKR01 `line 122–123` (`n ≤ 3`), IN99 `line 1263–1264` (component dominating `𝔸²/G`); `C₂` control: clusters `(y − ax, x² − b)`, one component. | Retain. |
| A54 README 836–840 versus `instAlgebra` at both pins (r7) | main's pin consumes `[Module R A] [SMulCommClass R A A] [IsScalarTower R A A]`, named exactly; branch's pin consumes `[Algebra R A]`. | Retain. |
| A55 IN99 References entry page range (r7) | running heads `170` at scan page 2 through `248` at scan page 80; entry then said `151–233` and `p. 204` with `204` a page of the other pagination. | Resolved by this head (R01 repaired). |
| A56 IN99 entry at this head: "p. 204 of the copy on the second author's web page, paginated 169–249" | first page: `170 − 1 = 169` (`IN99 line 39` is scan page 2); last page: scan page 81 carries `249` (`line 2818`), and `169 + 80 = 249`; theorem page: `169 + 35 = 204` = the running head at `line 1240` on scan page 36, with Theorem 9.3 at `line 1263` on that page; the copy's host is the `~nakamura` page recorded in the manifest and Nakamura is the second author; the chapter range `151–233` is attached to the venue, not to the page. `README.md:1972` cites "Theorem 9.3" alone, which is independent of the pagination. | Retain. |

**Ownership.** The change adds no construction (two citation lines); the previous reports' ownership search over main and the open heads stands. Ownership against open pull requests the brief does not list with files was not checked.

## Not verifiable

- **The build at main's pin** (`2fd255d9` / `1b1ccf4b`): unchanged from the previous report; the review may build only in the branch's worktree, whose packages are at the branch's pin. The file's names and import chain were checked at main's pin by reading the sources in the previous reports; the file did not change.
- **The published pagination of IN99** (London Math. Soc. Lecture Note Ser. 264, 151–233): no legal copy of the volume was found; the References entry now says which copy its page refers to, so nothing in the README depends on the published page.
- **Ste85, McK80, CBH98, the Conze paper, Spr77, CS03, Isaacs, CL18**: unchanged from the previous reports (no legal copy found or paywalled; cited by locator); none of the changed lines cites them.

## Source issues

- none
