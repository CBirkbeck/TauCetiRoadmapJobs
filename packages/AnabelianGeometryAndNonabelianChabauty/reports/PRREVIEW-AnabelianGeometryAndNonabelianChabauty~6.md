# Review of AnabelianGeometryAndNonabelianChabauty (pull request #1021 at 5df4b21)

**Verdict:** needs changes

Incremental re-review of the 38 lines changed since 4d9f8a5: the §3.5 target "Local Galois centre-freeness" again owns the finite p-adic case by Mochizuki's tame-quotient and wild-inertia route, the `### From FilteredLocalGaloisGroups` contract is gone, the geometric-conjugacy sketch in §3.9 now points at §3.5, the dilogarithm Check names `Li₂⁰`, the supplier contracts record AlgebraicCurves Layer 0 and SchemeAndStackFoundations §4.9, and three unused bibliography entries are removed. Four of the five previous findings are repaired and the fifth is withdrawn. The restored local proof rests on one input that no roadmap, no open pull request and no pinned declaration states: that a free pro-p group of rank at least two has trivial centre, which the sketch needs at the infinite rank of `G_(K^tm)` and attributes to ProfiniteProPGroups Layer 4 (R01). One P3 note on link paths.

## R01 (P1) — Centre-freeness of nonabelian free pro-p groups is used at infinite rank and owned nowhere

**Location:** `TauCetiRoadmap/AnabelianGeometryAndNonabelianChabauty/README.md:5892` (“Its `H¹` rank is infinite (the `H¹ rank` test below), so it is a nonabelian free pro-p group and centre-free, which kills a central element in the wild kernel.”), with the Use list at `README.md:5903` citing ProfiniteProPGroups Layer 4; the same input at `README.md:5876` (“Apply the nonabelian free pro-p or negative-Euler-characteristic surface pro-p centre theorem to every open subgroup.”).

**Claim:** The local case `Z(G_K)=1` for finite `K/ℚ_p` is closed by the step “free pro-p of infinite rank, hence centre-free”. The step is an input of the target, not something it proves, and its named supplier is ProfiniteProPGroups Layer 4 (free pro-`p` groups on finite sets).

**Witness:** On main (929496d) `Completed/ProfiniteProPGroups/README.md` has no occurrence of “centre”, “center” or “centraliz” in any spelling; Layer 4 (its line 535) builds `freeProP p X` for finite `X` and its rank API, and Layer 10 (line 2115) builds the infinite-rank object and Nielsen–Schreier, neither saying anything about centres. `roadmaps grep` over main and the 440 open pull requests for “centre-free”, “centerless”, “trivial centre” next to “free pro” returns only this README (lines 5876, 5892, 5898); the pinned Tau Ceti modules under `Topology/Algebra/Group/Profinite/Free` and `…/ProP` contain no centre lemma. The first §3.5 target (line 5872) covers only `Π^p` of hyperbolic curves, that is free pro-p groups of finite rank `2g+r−1`, and itself applies the same “centre theorem” as an input. The group the local sketch needs it for, `G_(K^tm)`, has infinite rank by the roadmap's own `H¹ rank` test, so even a finite-rank statement would not close the step. The previous report's claim that ProfiniteProPGroups Layer 4 owns this fact was wrong; nothing at the cited section states it.

**Repair:** Own the statement here, in §3.5 before “Local Galois centre-freeness”: *a free pro-p group on a basis converging to 1 with at least two elements has trivial centre*. One route with owned inputs: for `z≠1` central and any `y`, the closed subgroup `⟨z,y⟩` is free pro-p by Nielsen–Schreier (ProfiniteProPGroups Layer 10) and abelian, hence procyclic, so `z` is a `p`-power of a generator `g_y`; for two non-commuting `y₁,y₂` the closed subgroup `⟨g_{y₁},g_{y₂}⟩` is free pro-p of rank two with the nontrivial central element `z`, which contradicts the rank-two case; the rank-two case is the pro-p fundamental group of `ℙ¹` minus three points in characteristic zero, centre-free by Tamagawa, Proposition 1.11 with Proposition 1.1 (i) (`t97` lines 1608–1612 and 1166–1170, printed pp. 144–146). Give it three Checks (the rank-one group `ℤ_p` has full centre; `ℤ_p²` is abelian of rank two and not free; the Heisenberg quotient of rank two detects a non-central commutator). Cite this target, not ProfiniteProPGroups Layer 4, from both §3.5 sketches (lines 5876 and 5892) and in both Use lists.

**Repair test:** With that target in place every input of the local sketch resolves: the tame quotient and its Iwasawa presentation (LocalFieldsRamification Layer 4, `Completed/LocalFieldsRamification/README.md:1154`, `σ⁻¹τσ=τ^q`), `Br(L)≅ℚ/ℤ` and restriction multiplying the invariant by the degree (ClassFieldTheory Layer 5, `README.md:920` and lines 1021–1023 of that README), `H²(G,𝔽_p)=0 ⇒ cd_p G≤1` for pro-p `G` (ProfiniteProPGroups Layer 6, `cd_p_le_iff_elementaryAbelian_of_isProP`), Serre's criterion at arbitrary rank (ProfiniteProPGroups Layer 10, “Serre's theorem in full generality”), the colimit over open subgroups (ProfiniteCohomology Layer 10) and the new target. The finitely generated induction (Mochizuki Lemma 15.7) and the geometric-conjugacy consumer at line 6343 need nothing further.

## R02 (P3) — Links to completed roadmaps use a path that main does not have

**Location:** `README.md:5903` (the three ProfiniteProPGroups links and the LocalFieldsRamification link, `…/blob/main/TauCetiRoadmap/ProfiniteProPGroups/README.md#layer-6-…`, `…#layer-10-…`, `…/TauCetiRoadmap/LocalFieldsRamification/README.md#layer-4-…`); the same pattern at lines 5884, 6316 and elsewhere.

**Claim:** The links point at `TauCetiRoadmap/ProfiniteProPGroups` and `TauCetiRoadmap/LocalFieldsRamification` on main.

**Witness:** On main (929496d) both roadmaps live under `Completed/` (`Completed/ProfiniteProPGroups/README.md`, `Completed/LocalFieldsRamification/README.md`); `TauCetiRoadmap/ProfiniteProPGroups` does not exist. The section anchors themselves (`layer-4-free-pro-p-and-pro-c-groups-on-finite-sets`, `layer-6-cohomological-dimension-of-pro-p-groups`, `layer-10-free-pro-c-groups-on-profinite-spaces`, `layer-4-the-tame-quotient-of-the-absolute-galois-group`) match the headings at lines 535, 1010, 2115 and 1154 of those files, so the citations resolve by roadmap name and section; only the folder in the URL is stale.

**Repair:** Point these links at `Completed/<Name>/README.md`, or cite by roadmap name and section without a URL, as the other supplier citations in the README do.

## Previous findings

- R01 — repaired: README:5892 now proves the finite p-adic case here (tame quotient centre-free, `H²(G_(K^tm),𝔽_p)=0`, free pro-p, infinite `H¹` rank) and the `### From FilteredLocalGaloisGroups` contract, the “not reproved here” Check and the `G_K^m` clause are gone; `grep FilteredLocalGaloisGroups` returns nothing. The repair reintroduced the unowned input of this report's R01.
- R02 — repaired: README:6343 reads “For p-adic K and for finitely generated extensions of `ℚ_p` this is Local Galois centre-freeness in §3.5: the tame-quotient and wild-inertia argument, then the Artin-neighborhood induction.”
- R03 — not repaired, and withdrawn: the manifest the tooling reads is `packages/AnabelianGeometryAndNonabelianChabauty/sources.toml` on the board, which exists and records the 49 texts this brief lists; a `sources.toml` inside the roadmap folder would be a stray file under the gate's `stray-files` rule. No action is needed.
- R04 — repaired: README:7020 reads “Thus `Li₂⁰=−I_(01)`”; `colemanDilogarithm` occurs nowhere.
- R05 — repaired: README:13 lists “AlgebraicCurves Layers 0, 4, 7, 9 and 12 supply the relative algebraic constant field of a curve, …” and README:75 adds “Section 4.9 supplies the theorem on formal functions and Stein factorisation (SF.4); §1.9 uses the factorisation, with the constant field of AlgebraicCurves Layer 0, …”.

## Verified sound

### Gate, dependency order, folder and elaboration

- The worker's gate at 5df4b21 reports every counter zero with `build=0`. My own run of the gate on this head (`rungate.sh`, after waiting for another session's lake build): every text counter zero, `depcheck=0`, `stray-files=0`, `dirty=0`, `outside-folder=0`, `source-material=0`, OK (that run prints no build counter; the build is covered by the elaboration below).
- Independent dependency check: `depcheck: 205 roadmaps, 1680 edges, 0 problem(s)`; no UPWARD, CYCLE or `moved:` line.
- `git diff --stat origin/main...HEAD -- . ':!TauCetiRoadmap/AnabelianGeometryAndNonabelianChabauty'` is empty: nothing outside the folder changed. The folder holds README.md, Suggested.lean and metadata.toml.
- `Suggested.lean` (76 lines, one theorem) is byte-identical to the head of the previous report. `lake build TauCeti.AlgebraicGeometry.Cohomology.Genus` succeeded (2938 jobs) and `lake env lean` on a scratch copy with `#check @anabelian_isom` appended elaborated in 10 s with `declaration uses sorry` as the only warning. The printed type keeps every binder: `Fact p.Prime`, both fields, `Algebra ℚ_[p] L`, the embedding, the finite-generation witness, both `SmoothOfRelativeDimension 1`, `IsProper` and `GeometricallyConnected` instances, both `FiniteDimensional K (Cohomology (InvertibleSheaf.trivial _).obj 1)` instances, both genus bounds, the `∀ e : P.Over ⊤ X ≌ P.Over ⊤ Y`, the constant-cover compatibility and the `∃! f` conclusion. Nothing silently disappeared; the one-tactic probe of the earlier reports stands, the file being unchanged.
- Removed bibliography entries (Mochizuki, Hurwitz scheme; Weibel; Conrad, K/k-trace): `grep` for `weibel`, `conrad-kummer`, `Kktrace` and `Hurwitz Scheme` finds no remaining citation, so no reference link dangles.

### Changed passages: sources opened

| Passage | Text and locator | Result |
|---|---|---|
| §3.5 local case, README:5892 | Mochizuki 1999 (`m99`), Lemma 15.6, author-copy p. 79, lines 3163–3175: tame quotient centre-free by its known structure, centre inside `Γ_(K^tm)` (pro-p), `H²(K,𝔽_p(1))=𝔽_p` and its vanishing under a degree-p unramified extension give `H²(Γ_(K^tm),𝔽_p)=0`, hence free pro-p, hence centre trivial. | The sketch restates the lemma's route in the roadmap's words and adds the `H¹ rank` step the source omits (see Source issues). Locator “Lemmas 15.6–15.7, author-copy pp. 79–80” exact. |
| §3.5 finitely generated induction, README:5892 | Lemma 15.7, pp. 79–80, lines 3177–3192: if every open subgroup of `Γ_(K₀)` is centre-free so is every open subgroup of `Γ_K` for `K/K₀` finitely generated; extension and surjective limit of centre-free groups, hyperbolic Artin neighbourhoods, Tamagawa Prop. 1.11. | Unchanged in substance; the base hypothesis is met because the local statement is for every finite `K/ℚ_p`. |
| Tamagawa centre-freeness cited at README:5882 and needed by R01 | `t97` Proposition (1.11), p. 146, lines 1608–1612: for non-abelian `Π` and a class `C` containing `ℤ/ℓ`, `ℓ≠p`, `Π^C` is centre-free; Proposition (1.1)(i), lines 1166–1170: in characteristic zero `Π` is the profinite completion of the surface or free group of rank `2g+n−1`. | Covers free pro-p groups of finite rank `≥2` through affine curves; not the infinite-rank group of README:5892 (R01). |
| §3.9 geometric conjugacy, README:6343 | Lemmas 15.6–15.8, pp. 79–80 (the cited locator). | The sketch now defers the local and finitely generated cases to §3.5; consistent (previous R02). |

### Supplier citations resolved for the changed passages

| Citation | Where it resolves | Result |
|---|---|---|
| LocalFieldsRamification Layer 4 (tame quotient) | `Completed/LocalFieldsRamification/README.md:1154`; tame character `I_K/P_K≅Ẑ^((p'))(1)` at its lines 1292–1300, Iwasawa presentation `σ,τ` with `σ⁻¹τσ=τ^q` at 1317–1350 | Supplies the semidirect description and two-generation used at README:5892 and 5898 |
| ClassFieldTheory Layer 5 (Brauer group, invariant, duality) | `TauCetiRoadmap/ClassFieldTheory/README.md:920`; invariant on the subgroups of `ℚ/ℤ` (line 984) and “restriction multiplies the unramified invariant by `[L:K]`” (lines 1021–1023) | Supplies `Br(L)≅ℚ/ℤ` and the degree-multiplication used at README:5892 and 5899 |
| ProfiniteProPGroups Layer 6 (`H²(G,𝔽_p)=0 ⇒ cd_p≤1`) | `Completed/ProfiniteProPGroups/README.md:1010`, `cd_p_le_iff_elementaryAbelian_of_isProP` (line 1026) | Resolves as cited |
| ProfiniteProPGroups Layer 10 (Serre's criterion without finite generation) | `Completed/ProfiniteProPGroups/README.md:2115`, “Serre's theorem in full generality: `cd_p G≤1` iff `G` free pro-p” (line 2178), Nielsen–Schreier for closed subgroups (line 2184) | Resolves as cited |
| ProfiniteProPGroups Layer 4 (centre of a free pro-p group) | `Completed/ProfiniteProPGroups/README.md:535`; no centre statement anywhere in the file | R01 |
| ProfiniteCohomology Layer 10 | `TauCetiRoadmap/ProfiniteCohomology/README.md`, Layer 10 (all-degree continuous cohomology; colimit over open subgroups) | Resolves |
| EtaleCohomologyFoundations §F.0.A2 | `TauCetiRoadmap/EtaleCohomologyFoundations/README.md:368` | Resolves |
| AlgebraicCurves Layer 0 (constant field) | `TauCetiRoadmap/AlgebraicCurves/README.md:403`, “The constant field `k̃ := algebraicClosure k F`” (line 419) | Resolves (previous R05) |
| SchemeAndStackFoundations §4.9 | `TauCetiRoadmap/SchemeAndStackFoundations/README.md:5448` “The theorem on formal functions and Stein factorisation” | Resolves (previous R05) |
| AlgebraicVectorBundles Layers 0A and 0B (resolver lead “Layers 0”) | `TauCetiRoadmap/AlgebraicVectorBundles/README.md:215` (L0A) and 228 (L0B) | Resolves; the resolver split the label |

Ownership: no roadmap on main, no open pull request and no pinned declaration states `Z(G_K)=1` for p-adic fields or the centre-freeness of free pro-p groups; this roadmap is the owner of both (R01 says how to own the second). Ownership against open pull requests whose files the brief does not supply was not checked.

### Adversarial pass

New rows carry computed values; rows for statements the diff leaves untouched are carried from the previous report (its table carries the 108-row table with the exhaustive `S₃` test from the reports before it).

| Statement | Instance | Values on each side | Result/change |
|---|---|---|---|
| Tame quotient centre-free, README:5892 and the witness Check at 5897 | `Ẑ⋉∏_(ℓ≠p)ℤ_ℓ(1)`, Frobenius `φ=(1,0)`, central `(a,b)` | `(a,b)(1,0)=(a+1,b)`, `(1,0)(a,b)=(a+1,q·b)` so `(q−1)b=0`, `b=0` (`∏ℤ_ℓ` torsion-free, `q−1≠0`); `(a,0)(0,c)(a,0)⁻¹=(0,q^a c)=(0,c)` for all `c` forces `q^a=1` in every `ℤ_ℓ^×`, i.e. `Frob^a` fixes all prime-to-p roots of unity, so `a=0` | Check correct; the witness is the Iwasawa relation of LocalFieldsRamification Layer 4 |
| Same, `p=2`, `q=2` | `K=ℚ_2` | `q−1=1`, `b=0` at once; `2^a=1` in `ℤ_ℓ^×` for odd `ℓ` only for `a=0` | No special case; retain |
| Wild kernel: `H²(L,𝔽_p(1))=Br(L)[p]≅ℤ/p` and its death | `L=ℚ_p`, `L'/L` unramified of degree `p` | Kummer: `H²(L,μ_p)=Br(L)[p]`, `Br(L)≅ℚ/ℤ`, `[p]`-torsion `ℤ/p`; restriction on `ℚ/ℤ` is `×p`, zero on `ℤ/p` | Sketch correct |
| `μ_p⊂K^tm` and the colimit | `K=ℚ_p`, `p` odd: `[ℚ_p(μ_p):ℚ_p]=p−1` prime to `p` | `K(μ_p)/K` tame, so for `L⊇K(μ_p)` in `K^tm`, `𝔽_p≅𝔽_p(1)` as `G_L`-modules and `H²(G_(K^tm),𝔽_p)=colim_L H²(L,𝔽_p)`, each class killed one layer up | Sketch correct; `p=2`: `μ_2⊂K` already |
| `H¹ rank` Check, README:5898, Euler characteristic | `L=ℚ_p`, `p` odd | `h⁰−h¹+h²=−[L:ℚ_p]`: `h⁰=1`, `h²=0` (no `μ_p`), so `h¹=2`, matching `ℚ_p^×/p≅(ℤ/p)²`; bound `[L:ℚ_p]+1=2` attained | Inequality `≥` correct |
| Same, `p=2` | `L=ℚ_2` | `h²=1` (`μ_2⊂ℚ_2`), `h¹=1+1+1=3`, matching `ℚ_2^×/2≅(ℤ/2)³`; bound `2` | Correct |
| Same, kernel of restriction | `L⊂K^tm` finite over `K` | inflation–restriction: kernel `Hom(Gal(K^tm/L),𝔽_p)`; `K^tm=L^tm`, so `Gal(K^tm/L)` is the tame group of `L`, generated by `σ,τ`: dimension `≤2`; image dimension `≥[L:ℚ_p]−1`, unbounded as `L` grows in `K^tm` | `dim H¹(G_(K^tm),𝔽_p)` infinite; Check correct |
| Same, negative control | `ℤ_p` | free pro-p of rank one, `H²=0`, centre `=ℤ_p` | Excludes “`H²=0` alone”; the nonabelian hypothesis is needed, which is exactly the unowned input of R01 |
| Unramified restriction Check, README:5899 | `L'/L` of degree `d` | `res: ℚ/ℤ→ℚ/ℤ` is `×d`; on `ℤ/p` injective iff `p∤d`; zero iff `p∣d` | Check correct |
| “free pro-p and infinite rank ⇒ nonabelian ⇒ centre-free”, README:5892 | `G_(K^tm)` | nonabelian: a free pro-p group of rank `≥2` surjects onto the Heisenberg group of order `p³`; centre-free: no owner at any rank (R01); the finite-rank case is Tamagawa 1.11 | R01 |
| Reduction of arbitrary rank to rank two (route offered in R01) | `z≠1` central, `y₁y₂≠y₂y₁` | `⟨z,y⟩` closed, free (Nielsen–Schreier), abelian ⇒ rank `≤1` ⇒ procyclic `⟨g_y⟩∋z`; `⟨g_{y₁},g_{y₂}⟩` free of rank `≤2`, nonabelian (contains `y₁,y₂`) so rank `2`, with `z∈⟨g_{y₁}⟩` central | Reduces to the rank-two case; the inputs are owned (ProfiniteProPGroups Layer 10) |
| Finitely generated induction, one step | `1→Δ→Π→G→1`, `Z(Δ)=Z(G)=1` | `z∈Z(Π)` maps to `1` in `G`, lies in `Δ`, commutes with `Δ`, so `z=1` | Carried from the previous report |
| Same, non-hyperbolic fibre | `𝔾_m`, `Δ=Ẑ(1)` | `Z(Δ)=Δ≠1` | Hyperbolicity of the Artin fibres is used; carried |
| Open-subgroup hypothesis of Lemma 15.7 | open `U≤G_K` | `U=G_(K')`, `K'/ℚ_p` finite | Covered by “for `K/ℚ_p` finite”; carried |
| Consumer README:6343 | the local case | sketch defers to §3.5 | Consistent now (previous R02 repaired) |
| Dilogarithm Check, README:7020 | `Li₂⁰=−I_(01)`, `I_(01)=−z−z²/4−⋯` | `−I_(01)=z+z²/4+⋯`: constant term `0`, linear coefficient `1` | Agrees with the API line at 7016; name now declared in §5.0 |
| Hoshi pro-p non-example, SectionConjecture Checks for `Spec k`, `ℙ¹`, `𝔾_m`, abelian varieties, Reichardt–Lind | as in the previous report | carried | Carried |
| §0.11, §0.13, §0.18, §0.30, §0.31, §1.2, §2.3, §2.4, §3.7, §4.8, §4.9, §6.3, §6.6, §6.8, §7.4 | earlier seeded samples, untouched | carried | Carried |
| Headline `anabelian_isom` | genus-2 curve, identity versus hyperelliptic involution | `+I` and `−I` on `H⁰(Ω¹)`, distinct outer classes; `∃!` is uniqueness within one class | Carried; the Lean is unchanged and re-elaborated here |

### Seeded sample

Of the sampled targets (0.7, 0.20, 0.22, 0.32, 1.1, 1.6, 1.10, 2.11, 3.1, 3.8, 3.11, 4.3, 5.5, 6.5, 7.1) the diff touches none. §3.8 “Effectivity of the recovered canonical map” (README:6252–6266) cites “Local Galois centre-freeness” in its Use list; the cited target exists and now states the local case it needs, with the caveat of R01. §3.11 cites neither changed passage. The other sampled targets were verified in the earlier full reviews and are not re-examined here.

### Shape of the changed passages

The rewritten target keeps its statement, hypotheses line, sketch, four Checks, locator and Use list in the README's order; no process words, pull-request numbers, LaTeX or `lemma` were introduced, and the gate's scanners agree. The `## Scope and ownership` and contract sections no longer name a non-existent supplier.

## Not verifiable

- The passages the diff does not touch were not re-examined; the previous reports' unverifiable items stand: Hadian's thesis, Labute 1967, the published Achinger, Serre Chapter V and Stix 2013 locators, and Kim 2008's published pagination.
- Ownership against open pull requests whose files the brief does not supply was not checked.

## Source issues

- **Gap** in m99 at Lemma 15.6, proof, author-copy p. 79: the source says `H²(Γ_(K^tm),𝔽_p)=0` makes `Γ_(K^tm)` free pro-p, which implies its centre is trivial; it should be free pro-p of rank at least two (the rank-one free group `ℤ_p` is abelian), which holds because `H¹(Γ_(K^tm),𝔽_p)` is infinite; affects the proof.
