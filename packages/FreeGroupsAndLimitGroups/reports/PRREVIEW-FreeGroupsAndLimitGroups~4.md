# Review of FreeGroupsAndLimitGroups (pull request #2205 at 11a9d0f)

**Verdict:** needs changes

## R01 (P3) — GL-JSJ is cited by §1.1 and §2.2 for material in its §§1.2–1.4

**Location:** `TauCetiRoadmap/FreeGroupsAndLimitGroups/README.md:903` "Use [GL-JSJ] §1.1, pp. 15–17 (actions without inversions, elliptic and hyperbolic elements, minimal subtrees), Definition 2.1, p. 22, and §2.2 (domination, deformation spaces)". The same "§1.1" appears at :800, :872 and :963.

**Claim:** GL-JSJ §1.1 covers basic notions (commensurability, CSA groups). Trees, ellipticity and minimality are in §1.2, (𝒜, ℋ)-trees in §1.3, and domination and deformation spaces in §1.4.2. §2.2 is about universal ellipticity, and Definition 2.1 defines ellipticity of one tree relative to another, which §4.12 uses.

**Witness:** GL-JSJ lines 642–645 (contents: 1.2 Trees, p. 16; 1.3 (A,H)-trees, p. 18), line 914 "1.4.2 Domination, deformation spaces" (p. 19), line 1156 "2.2 Universal ellipticity".

**Repair:** At 903, start the sentence with "Use [GL-JSJ] §1.2, pp. 16–17 (actions without inversions, elliptic and hyperbolic elements, minimal subtrees), §1.3, p. 18 ((𝒜, ℋ)-trees), and §1.4.2, p. 19 (domination, equivalently ellipticity of vertex stabilizers, and deformation spaces):" and keep the rest. At 800, write "[GL-JSJ] §1.2, p. 16"; at 872, "[GL-JSJ] §1.2, p. 16"; at 963, "[GL-JSJ] §1.2, Proposition 1.1, p. 17". The open #2221 already makes the §1.1 → §1.2 change at its lines 902 and 962 (see R05). It does not make the §1.3/§1.4.2 change or the changes at 800 and 872.

## R02 (P3) — Sixteen broken code spans and a LaTeX `overline` remain in the prose

Partial repair of the previous review's R06.

**Location:** `README.md:247` "For `x`, `y ∈ FreeGroup α: x * y = y * x`"; `:1222` "makes `ℤ a` CSA group"; `:1774` "`ncl((overline{Ker Ω})*)`". The same defect occurs at lines 214, 219, 309, 392, 518, 531, 854, 1232, 1319, 1335, 1548, 1919, 1972 and 2177.

**Claim:** Each of these spans either swallows prose (": x * y", "a CSA group") or splits a formula. `overline{…}` is LaTeX inside a code span.

**Witness:** These are the quoted lines at this head. Two more examples: `:1319` "`H G`-equationally Noetherian" and `:2177` "Over the abelian base `ℤ a` genus-two equation".

**Repair:** Replace each passage as follows:
- 214: "- `of a * of b` is primitive in `F(a,b)`".
- 219: "In `F(a,b)`: `a`, `a b`".
- 247: "For `x`, `y ∈ FreeGroup α`: `x * y = y * x` if and only if".
- 309: "For `u = a`, `g = b`: `b⟨a⟩b⁻¹ ∩ ⟨a⟩ = 1`."
- 392: "for finite `Γ`, a spanning tree."
- 518: "the rose with one petal labelled `a`: `⟨a², a³⟩ = ⟨a⟩`."
- 531: "For subgroups `K`, `H`: `K ≤ H` if and only if".
- 854: "maximal trees `T`, `T′`: `π₁(𝔸, T) ≃* π₁(𝔸, T′)`".
- 1222: "makes `ℤ` a CSA group".
- 1232: "For `G=1`, a `G`-domain `H` is trivial".
- 1319: "`H` `G`-equationally Noetherian".
- 1335: "`H` a `G`-equationally Noetherian `G`-domain".
- 1548: "is `S⁺(3, 0)`: `χ = −4 = 2 · (−2)`. The orientable double cover of `S⁻(3, 0)` (`χ = −1`) is `S⁺(2, 0)` (`χ = −2`)."
- 1919: "- `G` is fully residually free iff it is discriminated by `FreeGroup (Fin 2)`".
- 1972: "to the marking of `ℤ² = ⟨x, y | [x, y]⟩`: a fixed word dies".
- 2177: "Over the abelian base `ℤ`, a genus-two equation".
- 1774: write "`F[H]/ncl(Ω*)≃(F[H_K]/ncl(Ω_K*))∗F(Z)`, where `Ω_K` is the kernel equation of IFT's D4 (its overlined `Ker Ω`)," and "`F_{R(Ω_K)}∗F(Z)→F_{R(Ω)}`".

## R03 (P3) — `IsFreelyIndecomposable` and `IsGrushkoDecomposition` have no Checks

**Location:** `README.md:1016` "where `IsFreelyIndecomposable G` says that `G` is nontrivial and is not the internal free product of two nontrivial subgroups, and `IsGrushkoDecomposition H t` that `G` is the internal free product". §4.11 has no `**Checks.**` list.

**Claim:** Both are definitions in `Suggested.lean`, and each definition needs at least three discriminating Checks. §4.11 has only worked examples.

**Witness:** `Suggested.lean:64–75` declares both definitions. README lines 1014–1029 contain no Checks. `ℤ` satisfies `IsFreelyIndecomposable`, and only the separate infinite-cyclic clause excludes it as a factor; nothing in the README records this.

**Repair:** After line 1025, insert:
```
**Checks.**

- `ℤ` is freely indecomposable (a free product of two nontrivial groups is nonabelian), so a Grushko factor must separately be not infinite cyclic; without that clause `ℤ` would have the two decompositions `p=1, q=0` and `p=0, q=1`.
- The trivial group is not freely indecomposable; without the nontriviality conjunct, trivial factors could be added to any decomposition and `p` would not be unique. Its Grushko decomposition has `p=q=0`.
- `ℤ/2 ∗ ℤ/2` is not freely indecomposable; it and `ℤ/2 ∗ ℤ/3` have Grushko decompositions with `p=2`, `q=0`.
- In `ℤ² ∗ F(c,d)`, `H=(ℤ²)`, `t=(c,d)` is a Grushko decomposition, while `H=(ℤ², ⟨c⟩)`, `t=(d)` is not (`⟨c⟩` is infinite cyclic) and `H=(ℤ²)`, `t=(c,d²)` is not (the map is not surjective).
- In `F(a,b)`, `t=(a,b)` and `t=(a b,b)` are both Grushko decompositions with `p=0`: uniqueness concerns `q` and the conjugacy classes of the factors, not the free part as a subgroup.
```

## R04 (P3) — §2.5 restates KM02 Lemma 3.4's invariance of languages, which is false; only the subgroup is invariant

**Location:** `README.md:494` "Use [KM02] §3, Lemma 3.4, p. 7, and Lemma 3.7, p. 7: A single folding does not change the language of the graph at the base vertex".

**Claim:** In KM02 the language is the set of words read along reduced closed paths (Definition 2.7), and a fold can change it. The lemma's proof treats a subpath that avoids the folded edge as a path of `Γ`, which fails where the subpath passes through the identified terminus. §2.5's statement about subgroups and its proof sketch at 489 are correct; the gloss at 494 is not.

**Witness:** Take `Γ` with `e₁:u→w₁` and `e₂:u→w₂` (both labelled `a`), `b₁:w₁→u` and `c₂:u→w₂`. After the fold, `c₂b₁` reads `cb` at `u`. No reduced path of `Γ` reads `cb`; the closest is `c₂e₂⁻¹e₁b₁`, which reads `ca⁻¹ab`. See KM02 lines 189 and 291–294.

**Repair:** At 494, write "Use [KM02] §3, Lemma 3.4, p. 7, and Lemma 3.7, p. 7: a single folding does not change the subgroup read at the base vertex (Lemma 3.4 states this for the language of reduced-path labels, which a fold can change; a path of the folded graph that passes the identified terminus lifts after inserting `f₂⁻¹f₁`); the core has the same language."

## R05 (P3) — #2221 also revises this README, the two heads conflict, and the description states no order

**Location:** Pull-request description: "This pull request revises `TauCetiRoadmap/FreeGroupsAndLimitGroups/` only." The description never mentions #2221.

**Claim:** Both open pull requests revise §§7.2, 7.11 and 10.9 of this README, each differently, and their heads conflict. One must be rebased on the other before either merges, and the text should say which.

**Witness:** The overlap report reads "#2205 and #2221 conflict in `TauCetiRoadmap/FreeGroupsAndLimitGroups/README.md`". #2221's README rewrites §7.11 at line 1880, which this head changes at 1882; it also changes §7.2 at 1745 and §10.9 at 2540.

**Repair:** Add to the description: "**Order with #2221.** #2221 (second batch of corrections, Layers 6, 7, 10 and 11) also revises this README and conflicts with it. It is rebased onto this pull request after this one merges." If the reverse order is intended, state that instead.

## Verified sound

The previous review's findings, checked against this head:

| Previous | Passage at this head | Status |
| --- | --- | --- |
| R01 §7.7 rank | README:1817 "uniform in the rank `n` and in the number of variables"; :1805 "recursive as a function of `|A|` and `‖Ω‖`"; `Suggested.lean:103` | repaired |
| R02 Grushko | `Suggested.lean:64–97` `IsFreelyIndecomposable`, `IsGrushkoDecomposition`, existence and `unique`; README:1016 | repaired; Checks missing (R03) |
| R03 Lean names | 291, 357, 457, 663, 928, 1178, 1734, 2014, 2489 rewritten; bullets 179–284, 651 name Tau Ceti `ProperPower.lean:31–60`, `CSA.lean:41–227`, `ModelTheory/Algebra/Group/Basic.lean:53` | repaired |
| R04 locators | 552 "(KM02 Lemma 6.1)"; 575 `Subgroup.isFreeGroupOfIsFreeGroup`; 1298 cites Tau Ceti `FreeGroup/Linear.lean:89` for Sanov | repaired |
| R05 forests | 416 "multigraph forest in the sense of `GraphConnectivityAndFlows` Target 2.1"; main GCF:364–369 | repaired |
| R06 code spans | 1323, 1599, 2023, 2303, 2556 fixed; 16 others remain | partly; see R02 |
| R07 description | the three sentences now hold at this head | repaired |

The adversarial pass:

| Statement | Instances tried | Values computed | Result | Change |
| --- | --- | --- | --- | --- |
| §2.1 Serre graphs (sample) | one-petal rose; segment; `V=E=∅`; two parallel edges | `[e]` reduced closed, not a tree; unique path `[e]`; preconnected, not connected; `[e, rev f]` closed | holds; FOLD line 199 (p. 5), KM02 lines 74–90 (p. 2) | none |
| §2.2a cycle spaces (sample) | rose plus a vertex; two parallel edges; theta graph; empty graph | `1+2=1+2`; chord `e₁−e₀↦(1,1)`; `2+2=3+1`; `0=0` | holds; Hatcher pp. 84–85, 140, 153, 187; Diestel pp. 24, 26–27 | none |
| §2.5 folding (sample) | fold of `e₁,e₂` with `b₁:w₁→u`, `c₂:u→w₂` | the word `cb` is in the folded language, not the original; both subgroups contain `cb=ca⁻¹ab` | subgroup statement true; KM02 gloss false | R04 |
| §4.6 trees (sample) | Cayley tree of `F(a,b)`; `ℤ/2` swapping a segment | `ℓ(ab)=2`, `ℓ(aba⁻¹)=1`; an inversion, excluded | maths holds; GL-JSJ sections wrong | R01 |
| §5.10 components (sample) | `⟨a⟩∪⟨b⟩`; `Y=∅` | two components, product embedding; `m=0`, trivial `Γ` into empty product | holds; ALG pp. 9, 37–39 | none |
| §6.0a polygons (sample) | disc; torus; `aa`; sphere `aa⁻¹`; pants | `χ`: 1; `1−2+1=0`; `1−1+1=1`; `2−1+1=2`; `−1` | holds; SURFACES pp. 80–88 | none |
| §6.0d cutting (sample) | disc chord; annulus arc; pants arc; genus 3 with two separating curves | `1+1=1+1`; `1=0+1`; `0=−1+1`; `−1−2−1=−4` | `χ` formula holds; GL-JSJ pp. 42–43 | none |
| §6.7 regularity (sample) | `[x₁,y₁][x₂,y₂]`; `x₁²x₂²x₃²`; `[x,y]=a`; `z`-only, `m=3` | `κ=4`, only commutative solutions, explicit clause; `κ=3`; inconsistent (abelianization); `κ=4`, `a,b,a` noncommuting | Lean `IsRegular*` matches; IFT line 394 (p. 9) | none |
| §7.8 theories (sample) | `∀x∀y[x,y]=1`; `∃x([x,a]=1∧x≠1)` | false in `F(a,b)`, true in `F(a)` and rank 0; witness `x=a` | holds; IFT p. 13, p. 30; VAR-II p. 6 | none |
| §7.10 Merzljakov (sample) | `∀x∃y y=xa`; `∀x∃y [x,y]=1` | `q=xa`; `q=x` | holds; IFT lines 1083–1086 (p. 25), LIFT p. 217 | none |
| §9.1 length (sample) | `ℤ/2`, `l(s)=1`; word length on `F(a,b)` | `2c(s,s)=2`, `2c(s,1)=0`, (L3) holds, (L5) fails; `2c(a,b)=0` | holds; LENGTH lines 165–202 (pp. 4–5) | none |
| §10.3 kernels (sample) | `⟨x,y|x²y²⟩`; `x↦a²,y↦b²`; `x,y↦a` | `x²` central, `[x,y]≠1`: not CT; injective; kills `xy⁻¹` | holds; JSJ pp. 121–125, SUBGROUPS p. 6 | none |
| §10.4 relative Grushko (sample) | `ℤ²∗F(c,d)`; `ℤ` with `H=2ℤ`, `H=1` | `p=1,q=2`; `p=1,q=0`; `p=0,q=1` | holds; JSJ line 4650 (p. 186), FOLD p. 28 | none |
| §10.8 components (sample) | `[u,v]=[u,x]=1`; `⟨a⟩∪⟨b⟩` | points `(1,a,b)`, `(a,1,1)` separate two components; two cyclic components | holds; IFT p. 60, VAR-II p. 4, JSJ p. 122 | none |
| §11.3 basic sequence (sample) | `m=n=1`; `m=0,n=2` | `γ₁′` fixes `P[x,y]`, `P=z⁻¹cz`; `ψ(CZd)=C·C⁻¹ZC·d=ZCd`; `K=7` | holds; IFT lines 3147, 3175–3177, 3239–3244, 3293–3297 | none |
| `fg_inf` | `⟨a²⟩∩⟨a³⟩`; `⟨a,bab⁻¹⟩∩⟨b⟩`; `α=∅` | `⟨a⁶⟩`; `⊥`; trivial | true | none |
| `rank_sub_one_eq_index_mul` | `n=0`; `n=1`, `kℤ`; kernel to `ℤ/2` | `−1=1·(−1)`; `0=k·0`; `3−1=2·1` | true | none |
| `rank_coprod` | `ℤ/2∗ℤ/3`; `F₂∗ℤ` | `2=1+1`; `3=2+1`; `Nontrivial` as in FOLD line 1158 | true | none |
| `IsFreelyIndecomposable` | `ℤ`; `1`; `ℤ/2∗ℤ/2` | yes; no (nontrivial conjunct); no | correct; no Checks | R03 |
| `exists_isGrushkoDecomposition` | `1`; `ℤ`; `ℤ²∗F₂` | `p=q=0`; `p=0,q=1`; `p=1,q=2` | true, not vacuous | R03 |
| `IsGrushkoDecomposition.unique` | `ℤ`; `F(a,b)`, `t=(a,b)` vs `(ab,b)` | any `p≥1` factor would be infinite cyclic, so `q=1`; `q=q'=2`, `σ` empty | true | none |
| `satisfiability_recursive` | `n=0`, `x≠1`; `n=1`, `[x,a]=1`; `y∈⟨a⟩`, `y²=a²` | unsatisfiable; satisfiable; unique `y=a` | true, rank-uniform | none |
| `merzljakov` | `k=0`; `∀x∃y y=xa`; `n=1`, `∀x[x,a]=1` | `S=1` both sides; `q=xa`; true in `ℤ`, `[x,a]≠1` in `F(x,a)` | `n≥2` needed and present | none |
| `isFullyResiduallyFree_centralizerExt` | `F(a,b)`, `u=a`; `u=a²`; `u=1` | `[b,t]↦[b,aᵏ]≠1`; proper power excluded; `1` is a proper power, so `F₂×ℤ` is excluded | true | none |
| `isFinitelyPresented_of_fullyResiduallyFree` | `ℤ²`; `S⁺(2,0)`; `F₂×ℤ` | finitely presented; finitely presented; not fully residually free | true | none |
| `LyndonLength`, `IsFree` | `ℤ/2`, `l(s)=1`; `l≡0` on `ℤ` | (L5) `0<1` fails; (L5) fails at `1` | match README (L1)–(L5) | none |
| `exists_free_lyndonLength` | `1`; `ℤ`, `l=|k|`; `F₂×ℤ` | `n=0`; `2|k|>|k|`; not CT, excluded | true, not vacuous | none |
| `hasCompleteLift_of_isRegularOrientable` | genus 2, `T:[z,x₁]=1`, `W:z≠1`; `T:z=x₁y₁` | lift `z=x₁≠1` in `F∗S⁺(2,0)`; lift `z=x₁y₁` | true (IFT p. 67) | none |
| `hasCompleteLift_of_isRegularNonorientable` | `x₁²x₂²x₃²`; `x₁²⋯x₄²` at `(a,a⁻¹,b,b⁻¹)` | `κ=3`, not regular; `κ=4`, `[a⁻²,b²]≠1`, regular | matches §6.7 | none |
| §§7.8, 7.11, 10.2, 10.7, 11.6 not statable | Mathlib `ModelTheory/Encoding.lean`; pinned carriers | no `Primcodable` on formulas; no JSJ-tree, `Hom`-diagram or NTQ carrier | docstring correct | none |
| Description order | #2221 head against main | it changes §§4.6, 4.9, 6.5, 7.2, 7.3, 7.10, 7.11, 10.9, 11.4b; not stacked on this head | conflict, no order | R05 |

- Source locators checked against the text: 89, in 16 sources (GL-JSJ 16, IFT 13, JSJ 10, KM02 7, SURFACES 7, ALG 6, HATCHER 5, FOLD 4, VAR-I 4, SUBGROUPS 4, DIESTEL 3, LIFT 3, LENGTH 3, VAR-II 2, MRS-REGULAR 1, KMS-ACTIONS 1). Of the 15 sampled targets, 14 verify; §4.6 does not (R01).
- Library declarations: 69 names `#check`ed at the pins in one scratch file, with no error or deprecation (supplier contracts, API-bullet names, docstring names). Opened at Tau Ceti `2fd255d`: `CentralizerExtension/Basic.lean:119,468`, `ResiduallyFree.lean:110`, `GroupAlgGeom/Basic.lean:215,229`, `AlgebraicSet.lean:96,470,477`, `Separated.lean:147`.
- Cross-roadmap citations resolved: GraphConnectivityAndFlows Target 1.1 (main lines 224–253) and Target 2.1 (lines 364–369, cycle convention at 165–166). SurfaceTopology's supplier table (lines 69–78) cites §§2.1–2.2a and 6.0a–6.0d, and all of them resolve at this head.
- Overlap check: read SurfaceTopology, RandomGraphs and GraphConnectivityAndFlows. SurfaceTopology consumes §§2.1–2.2a and 6.0a–6.0d (owner: this roadmap) and owns surface classification. RandomGraphs shares nothing. GraphConnectivityAndFlows owns the multigraph walks, components and forests that §§2.1a and 2.2a cite. A search of open pull requests and main finds no second owner of Stallings graphs, graphs of groups, limit groups, Makanin's method, `Λ`-trees or group-theoretic JSJ; GeometricTopology's JSJ is the 3-manifold JSJ.
- Gate rerun at this head: every check 0, OK. Depcheck: `depcheck: 206 roadmaps, 1899 edges, 0 problem(s)`.
- Elaboration: `lake env lean` on `Suggested.lean` gives 12 `sorry` warnings and no other diagnostic. The 26 elaborated signatures match the README statements, and no binder is lost.
- One-tactic probe (`first | rfl | infer_instance | simp | decide | trivial | exact inferInstance`): none of the 12 theorems closes, so there is no padding.

## Not verifiable

- [TREES] Serre, *Trees* (cited in §§2.1, 2.2a, 4.6): the Springer DOI is paywalled, and the service records it as uncertified.
- [MAK] Makanin 1984 (cited in §§7.8, 7.10): mathnet.ru timed out ("The read operation timed out").
- [CHISWELL] §2.4 (cited in §9.3): the book is paywalled. KMS-ACTIONS line 1579 gives the same pointer, "[24, Subsection 2.4]".

## Source issues

- **Error** in KM02 at Lemma 3.4, p. 7: the source says one folding preserves the language of reduced-path labels at the base vertex; it should say it preserves the set of freely reduced labels (the subgroup), and its proof misses paths that switch sides at the identified terminus; affects a stated result.
- **Error** in IFT at §2.7, remark after Definition 6, p. 9: the source says regularity is equivalent to `κ≥4` with a non-commutative solution, or `[x,y]d=1`; it should add `[x₁,y₁][x₂,y₂]=1`, which has `κ=4` and only commutative solutions; affects a stated result.
- **Misprint** in FOLD at proof of Theorem 6.2, p. 28: the source sets `v₁ = t(v)` with vertex groups `A_{v1}=G₁`, `A_{v2}=G₂`; it should be `v₁ = t(e)`, `A_{v0}=G₁`, `A_{v1}=G₂`; affects nothing.
