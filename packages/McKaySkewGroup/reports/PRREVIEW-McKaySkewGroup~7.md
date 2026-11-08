# Review of McKaySkewGroup (pull request #223 at 17924c7)

**Verdict:** needs changes

Incremental re-review of the 36 lines changed since `109db10` (the head the previous review read): six README passages (the supplier contract for the representation ring and for the corner algebra, the trivial-subgroup sentence of §0.2, the scalar-action sentence of §3.2, a code span in §4.1, the resolution bullet of §7.4 and a new References entry) and, in `Suggested.lean`, one import line and four docstring lines. The gate passes at this head with the build; the dependency check is clean; the file elaborates at the branch's pin with `sorry` as the only warning. All six findings of the previous report are repaired. One new P3 concerns the page number of the new Ito–Nakamura citation.

## R01 (P3) — The Ito–Nakamura page is that of a differently paginated copy

**Location:** `README.md:1972` ("Ito–Nakamura [IN99, Theorem 9.3, p. 204]") and `README.md:2190–2192` ("London Math. Soc. Lecture Note Ser. 264, Cambridge Univ. Press, 1999, 151–233, Theorem 9.3 (p. 204)").

**Claim:** the entry cites the published chapter, pages 151–233, and gives the theorem's page as 204; but 204 is the running-head page number of the copy that was read (the author's page copy recorded in the manifest), which is paginated 169–249 over its 81 pages. The two paginations are different typesettings (81 pages against 83, different first page), so the page cannot be a page of the chapter it is attached to: in the 151–233 pagination the theorem falls near page 187. The theorem number is right and is the robust locator; the page is not.

**Witness:** `IN99 line 1263` (Theorem 9.3) lies under the running head at `IN99 line 1240` ("204 Hilbert schemes and simple singularities"); the running heads run `170` at scan page 2 (`IN99 line 38–40`) to `248` at scan page 80, so scan page 1 is page 169 and the copy ends at 249, not 233.

**Repair:** cite the version read, as the BKR01 and KV00 entries already do: in the References entry replace "Theorem 9.3 (p. 204)" by "Theorem 9.3 (p. 204 of the copy on the second author's web page, paginated 169–249)", and in `README.md:1972` write "[IN99, Theorem 9.3]" (or "[IN99, Theorem 9.3, p. 204 of the author's copy]"). No other line cites IN99.

## Previous findings

- R01 (P1, import absent at the branch's pin) — repaired: `Suggested.lean:7` now reads `import TauCeti.RingTheory.Morita.Corner`, a module present at both pins (`a91d3aaf` and `2fd255d9`) that publicly imports `TauCeti.RingTheory.Idempotents.Module`, which publicly imports the corner file at each pin (`Corner.lean` at the branch's pin, `Corner/Basic.lean` at main's). Gate at this head: `imports=0 build=0 OK`; the probe's `#check @IsIdempotentElem.Corner.instAlgebra` resolves through the new import. The repair introduced no new problem (table under Verified sound).
- R02 (P3, no source manifest) — repaired: the roadmap's manifest is the board's `packages/McKaySkewGroup/sources.toml` (the file the brief's own fetch command names; no roadmap folder on main carries a `sources.toml`, 0 of them), and it now records 17 works, including every one of the 14 bracketed keys of the README's References and the three works cited by name in the prose (Tikaradze, the Conze paper, Isaacs), with the arXiv and journal versions as one entry each and CBH98, Spr77, McK80, Ste85, CS03, CBK22, Isaacs76 as `uncertified`. The previous finding's request for a copy inside the roadmap folder was misplaced; the manifest lives where the intake reads it.
- R03 (P3, BKR01 does not cite Ito–Nakamura) — repaired: `README.md:1971–1975` now cites Ito–Nakamura directly ([IN99, Theorem 9.3]) for finite `Γ ⊂ SL₂(ℂ)` and says that BKR01 prove the result again in dimension at most three and note, citing Ito–Nakajima, that the Gonzalez-Sprinberg–Verdier construction is the dimension-two case; both statements are in the source (`IN99 line 1263–1265`; `BKR01 line 122–123` and `line 65–68`). The new entry's page number is this report's R01.
- R04 (P3, `of_mul_of` file) — repaired: `README.md:193–194` adds `TauCeti/CategoryTheory/GrothendieckGroup/Monoidal/Basic.lean`, where `theorem of_mul_of` is (line 179 at the branch's pin, line 132 at main's).
- R05 (P3, `cyclicSU2`) — repaired: `README.md:383` reads "together with the trivial subgroup, the cyclic model with `n = 1`"; `grep cyclicSU2` on the folder is empty; gate `readme-ids-missing=0`.
- R06 (P3, the two instances not named in the README) — repaired: `README.md:836–840` names `skewMonoidAlgebra_smulCommClass` and `skewMonoidAlgebra_isScalarTower` and says what they are for (the hypotheses `IsIdempotentElem.Corner.instAlgebra` consumes); the sentence matches the instance's variables at main's pin (`Corner/Basic.lean:206–207`: `[Module R A] [SMulCommClass R A A] [IsScalarTower R A A]`).

## Verified sound

**Head, change set, gate, dependency check.** Head `17924c719e185e5a05eb96a4e116771fd5acea27`, worktree clean; `git diff --stat origin/main...HEAD -- . ':!TauCetiRoadmap/McKaySkewGroup'` is empty (no file changed outside the folder). The change since `109db10` is exactly the diff in the brief (two commits, `13fd9f58` and `17924c71`): 25 insertions, 11 deletions. The folder holds `README.md`, `Suggested.lean`, `metadata.toml` (gate `stray-files=0`). Rerun of the gate at this head with the build and the local merge order:

```
gate McKaySkewGroup: set_option=0 blob=0 latex=0 tex=0 prnum=0 sorry-data=0 sorry-examples=0 residue=0 private-paths=0 imports=0 mathlib-subimports=0 no-import-mathlib=0 lean-lines=0 forbidden=0 dropped=0 readme-ids-missing=0 empty-sections=0 round-labels=0 long-fences=0 layer-ids=0 target-ids=0 depcheck=0 metadata=0 stray-files=0 dirty=0 outside-folder=0 source-material=0 build=0 OK
```

Rerun of the dependency check:

```
depcheck: 241 roadmaps, 2362 edges, 0 problem(s)
```

No UPWARD, CYCLE or `moved:` line; the merge order lists McKaySkewGroup at line 297, after KacMoody (line 3), its only open-pull-request supplier.

**The two pins.** The branch's `lake-manifest.json` (the pin this review builds against) still records Tau Ceti `a91d3aafa8cd3e6bc33dfde0d7677ed0f1625039` and Mathlib `6b7abb3c7686292736be2955bd3eb9ebf63b456a`, and the worktree's packages match it; `origin/main` records Tau Ceti `2fd255d997f47c0b5d834ee416c7015d55444ce5` and Mathlib `1b1ccf4b088b32fa3f23f2de1127433254a81e1e`. The branch was not rebased; instead the import was repointed to a module present at both pins, and the README's file paths name main's pin (`Corner/Basic.lean`, `FDRep/Basic.lean`, `Monoidal/Basic.lean`), which is where the merged roadmap will live. The table below records each cited file at both pins.

| README or Lean line | At the branch's pin `a91d3aaf` / `6b7abb3c` | At main's pin `2fd255d9` / `1b1ccf4b` |
| --- | --- | --- |
| `Suggested.lean:7` `TauCeti.RingTheory.Morita.Corner` | exists; `public import TauCeti.RingTheory.Idempotents.Module` (`Morita/Corner.lean:9`), which has `public import TauCeti.RingTheory.Idempotents.Corner` (`Idempotents/Module.lean:12`) | exists; same import at `:9`; `Idempotents/Module.lean:13` has `public import TauCeti.RingTheory.Idempotents.Corner.Basic` |
| `IsIdempotentElem.Corner.instAlgebra` (README 217–219, docstring 17–20) | `Idempotents/Corner.lean:162`, `[Semiring A] [Algebra R A]` | `Idempotents/Corner/Basic.lean:211`, `[NonUnitalSemiring A] [Module R A] [SMulCommClass R A A] [IsScalarTower R A A]` (`:206–207`) |
| `IsIdempotentElem.cornerEquivalence` (README 220, docstring 19) | `Morita/Corner.lean:388`, `(hfull : TwoSidedIdeal.span {e} = ⊤)` | `Morita/Corner.lean:391`, same hypothesis |
| `TauCeti.SplitK0.of_mul_of` (README 191–194) | `GrothendieckGroup/Monoidal/Basic.lean:179` | same file, `:132` |
| `FDRep.char_biprod` (README 204–205) | `RepresentationTheory/FDRep.lean:292` (no `FDRep/` directory) | `RepresentationTheory/FDRep/Basic.lean:378` (no `FDRep.lean`) |
| the other files of the changed bullets (`CharacterTable/Table.lean`, `Degree.lean`, `Determined.lean`, `RepresentationRing/Injective.lean`, `Semisimple/BasicAlgebra.lean`) | all exist | all exist |

So the Lean file builds at the branch's pin (gate) and every name it uses exists at main's pin (read in the sources; the previous report's name table for the other 24 declarations is unchanged). The README's two bumped paths (`Corner/Basic.lean`, `FDRep/Basic.lean`) are right at main's pin, where the merged roadmap will live; every other path the changed bullets name is the same file at both pins.

**Elaboration at the branch's pin.** Probe 1: a scratch copy of the head file plus `#check @name` for all 26 declarations of the file and for `IsIdempotentElem.Corner.instAlgebra` and `IsIdempotentElem.cornerEquivalence`, elaborated with `lake env lean` from the worktree: exit 0 in 22 s, exactly 9 `declaration uses sorry` warnings at lines 87, 96, 106, 142, 153, 188, 322, 339, 388 (the nine sorried theorems), no other warning or error, and all 28 `#check` lines printed a type. Each elaborated type was compared with its README statement: unchanged from the previous report for the 24 earlier declarations; the two instances carry `{k G} [Field k] [Group G] {A} [Semiring A] [Algebra k A] [MulSemiringAction G A] [SMulCommClass G k A]` and nothing is lost to the section-variable rule. `#check @IsIdempotentElem.Corner.instAlgebra` prints `[Semiring A] … [Algebra R A] → Algebra R he.Corner` (the branch-pin form) and `#check @IsIdempotentElem.cornerEquivalence` prints `(he : IsIdempotentElem e) → TwoSidedIdeal.span {e} = ⊤ → (ModuleCat A ≌ ModuleCat he.Corner)`, so the docstring's description of what the import supplies and what the fullness hypothesis feeds is exact. No theorem changed, so the padding probe of the previous reports (each of the nine bodies tried with one tactic: none closed) and the previous report's probes 2–3 for the two instances at main's hypotheses stand.

**The seeded sample where it falls in the changed passages.** Of the sampled targets, §0.2, §3.2, §4.1 and §7.4 contain changed lines. §0.2 (`README.md:383`): a prose change with no locator. §3.2 (`README.md:836–840`): names two Lean declarations, checked above; no locator. §4.1 (`README.md:955`): a code-span spacing change. §7.4 (`README.md:1971–1975`): IN99 Theorem 9.3 at `IN99 line 1263–1265` states, for a finite subgroup `G ⊂ SL(2,ℂ)` of order `n`, that the unique irreducible component of `Hilb^n(𝔸²)^G` dominating `𝔸²/G` is a crepant, equivalently minimal, resolution; its proof runs `line 1266–1279` (properness of the Hilbert–Chow morphism, birationality off the origin, triviality of the dualizing sheaf). BKR01 Theorem 1.2 at `BKR01 line 122–123` (page 4): for `n ≤ 3`, `G-Hilb M` is irreducible and a crepant resolution and `Φ` is an equivalence; `line 119–121` explains that the condition of Theorem 1.1 holds since the exceptional locus has dimension `≤ 2`. The Ito–Nakajima remark is at `line 65–68` (the Gonzalez-Sprinberg–Verdier construction is the `M = ℂ²` case of the natural correspondence between equivariant K-theory of `M` and K-theory of `G-Hilb M`), with the derived lift of the Gonzalez-Sprinberg–Verdier isomorphism attributed to Kapranov–Vasserot at `line 46–48`. The README's bullet matches the sources; the page of the IN99 citation is R01. The remaining sampled targets (0.1, 2.2, 3.1, 6.1–6.4, 7.1, 7.5, 7.6) are untouched by the diff and were verified by the previous full reviews.

**Adversarial pass.** Rows A01–A49 of the previous report (`PRREVIEW-McKaySkewGroup~6`, A01–A47 originally from `~5`) concern statements the diff leaves untouched and are carried forward with their key values; A50–A51 are the previous report's rows for the import, now resolved; A52–A55 are new.

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
| A48 `skewMonoidAlgebra_smulCommClass` (r6) | `x = single g a`, `y = single h b`, `c ∈ k`: both sides `single (gh) (c·a·(g•b))` using `SMulCommClass G k A`; negative control `k = A = ℂ`, `G = C₂` by conjugation, `c = i`: `i#g ≠ −i#g`, so the hypothesis is needed and carried. | Retain. |
| A49 `skewMonoidAlgebra_isScalarTower` (r6) | `(c•single g a)(single h b) = single (gh) ((c·a)·(g•b)) = c • single (gh) (a·(g•b))`; conjugation control holds. | Retain. |
| A50 `README.md:217–219` file of `instAlgebra` (r6) | `a91d3aaf`: `Idempotents/Corner.lean:162`; `2fd255d9`: `Idempotents/Corner/Basic.lean:211`. The README names the latter and now says it is reached through `Morita/Corner.lean`, which is true at both pins (import chain above). | Resolved by the repair of R01 (r6). |
| A51 `Suggested.lean:7` import (r6) | `TauCeti.RingTheory.Morita.Corner` present at `a91d3aaf` and at `2fd255d9`; gate `imports=0 build=0`; probe `#check @IsIdempotentElem.Corner.instAlgebra` resolves. | Resolved. |
| A52 §7.4 "crepant, hence minimal" for `Γ ⊂ SL₂(ℂ)` (new citation) | adjunction on a smooth surface: a `(−1)`-curve `E` has `K·E = −1 ≠ 0`, so a crepant resolution (`K_Y = π^*K_X`, `K·E_i = 0`) contains none and is minimal; conversely the minimal resolution of an ADE point has exceptional curves with `E_i² = −2`, genus `0`, `K·E_i = −2 − (−2) = 0`, so `K_Y` is trivial near `E` and the resolution is crepant. Both directions as `IN99 line 1265` says ("crepant (or equivalently a minimal)"). Trivial group: `𝔸²/1 = 𝔸²`, `1-Hilb = 𝔸²`, the identity is crepant and minimal, consistent with the empty exceptional set of A37. | Retain. |
| A53 §7.4 irreducibility of `Γ-Hilb(V)` | the README's `Γ-Hilb(V)` is the `Γ`-cluster locus (BKR01's `G-Hilb`, `line 53–57`), irreducible for `n ≤ 3` by `BKR01 line 122–123`; IN99 Theorem 9.3 names the component dominating `𝔸²/G` (`line 1263–1264`), so the README's citing both is what makes "irreducible" a theorem rather than a definition. `C₂` control: the fixed locus of `Hilb²(𝔸²)` under `−1` contains the clusters `(y − ax, x² − b)` of A38 (regular representation, `b ≠ 0` free orbits, `b = 0` the origin) and no second component. | Retain. |
| A54 README 836–840 versus `instAlgebra` at both pins | main's pin consumes `[Module R A] [SMulCommClass R A A] [IsScalarTower R A A]` on a `NonUnitalSemiring`: the sentence names exactly these two instances plus `SkewMonoidAlgebra.instModule`; the branch's pin consumes `[Algebra R A]`, which Mathlib's `Algebra k (SkewMonoidAlgebra A G)` supplies, so the two instances are unused there but harmless (gate build passes). | Retain. |
| A55 IN99 References entry page range | running heads of the copy read: `170` at scan page 2 through `248` at scan page 80 (81 pages, so `169–249`); the entry says `151–233` and `p. 204`; `204 ∉` the copy's first-page offset of `151` (page 36 of a copy starting at 151 would be 186). | R01. |

**House style on the changed lines.** The README additions are prose with code spans, no LaTeX, no process words, no pull-request numbers, no paths outside the library's own file names (gate `latex=0 tex=0 prnum=0 round-labels=0 private-paths=0`); the Lean docstring addition states which library module supplies the instance and the hypothesis the Morita equivalence takes, with no process comment; `theorem`, never `lemma`; no `set_option`; the import block is `import Mathlib` plus nine `TauCeti.*` modules, every one existing at both pins (`imports=0 mathlib-subimports=0`). The headline list and the docstring's not-statable list are unchanged.

**Ownership.** The change adds no construction (one import, five README citations and paths); the previous reports' ownership search over main and the open heads stands. Ownership against open pull requests the brief does not list with files was not checked.

## Not verifiable

- **The build at main's pin** (`2fd255d9` / `1b1ccf4b`): the shared package directory for that manifest holds Mathlib's object files and 4180 Tau Ceti object files, but seven of the nine imported Tau Ceti modules (`AffineDynkinType/Basic`, `/Deletion`, `RepresentationRing/Basic`, `Morita/Corner`, `Preprojective/Basic`, `Zigzag/Orientation`, `Zigzag/Relations`) have none there, and the review may build only in the branch's worktree, whose packages are at the branch's pin. The file's names and import chain were checked at main's pin by reading the sources (table above) and its elaboration at the branch's pin by the gate and probe 1.
- **The published pagination of IN99** (London Math. Soc. Lecture Note Ser. 264): no legal copy of the volume was found; the copy read is the author's page copy recorded in the manifest, paginated `169–249` by its running heads (R01).
- **Ste85, McK80, CBH98, the Conze paper, Spr77, CS03, Isaacs, CL18**: unchanged from the previous reports (no legal copy found or paywalled; cited by locator); none of the changed lines cites them.

## Source issues

- none
