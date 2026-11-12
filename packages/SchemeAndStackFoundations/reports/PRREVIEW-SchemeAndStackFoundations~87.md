# Review of SchemeAndStackFoundations (pull request #1656 at a072c0d)

**Verdict:** needs changes

:robot: Independent AI incremental re-review of 9 changed lines since 7512edb. One previous P3 finding remains; no P1 or P2 finding. The revised mathematics passes the checks below.

## R01 (P3) — Correct the two stale generated description blocks

**Location.** Pull-request description, generated `roadmap-summary` block: “The curve dichotomy drops quasi-compactness, degree pullback uses the existing bundle degree and generic rank, and citations identify pinned declarations.” It also says “Quasi-compactness follows from the other curve hypotheses.” The generated `merge-order` block still lists #1276 before this pull request, both in its chain and its shared-folder order.

**Claim.** The summary describes a removed hypothesis that the head retains, contradicting the accurate free-text description below it. The merge-order block treats a merged pull request as a future predecessor.

**Witness.** `TauCetiRoadmap/SchemeAndStackFoundations/Suggested.lean:735` retains `[QuasiCompact (X ↘ Spec (.of k))]`, confirmed by elaboration. Commit `c20f72af` (#1276) is on `origin/main`; the open-roadmap index omits #1276.

**Repair.** Regenerate both blocks from this head. Replace the two quasi-compactness sentences with: “The curve dichotomy retains main's statement; finite type is expressed by LocallyOfFiniteType together with QuasiCompact.” Remove #1276 from both ordering lines, leaving the shared-folder order #1656 → #1807 → #1808 → #1854. This replacement agrees with the elaborated signature and the three remaining open heads. No roadmap or Lean edit is needed for this finding.

## Previous findings

- R01 — not repaired: The `roadmap-summary` block still says the curve dichotomy drops quasi-compactness; `Suggested.lean:735` retains it. The `merge-order` block still lists merged #1276. Repeated as R01 above.

## Verified sound

### Scope, gate and elaboration

The complete folder diff since 7512edb is the seven inserted and two deleted lines at `TauCetiRoadmap/SchemeAndStackFoundations/README.md:965`. `Suggested.lean` is byte-for-byte unchanged. There are no changed files outside this folder, either since the previous head or against `origin/main`. The description's updated totals, 1,354 additions and 354 deletions, agree with Git.

The worker's gate has every counter zero, including `build=0`. My independent gate rerun exits 0:

    gate SchemeAndStackFoundations: set_option=0 blob=0 latex=0 tex=0 prnum=0 sorry-data=0 sorry-examples=0 residue=0 private-paths=0 imports=0 mathlib-subimports=0 no-import-mathlib=0 lean-lines=0 statement-hygiene=0 forbidden=0 dropped=0 readme-ids-missing=0 empty-sections=0 round-labels=0 long-fences=0 layer-ids=0 target-ids=0 depcheck=0 metadata=0 stray-files=0 dirty=0 outside-folder=0 source-material=0 OK

The independent dependency check with `--movable --pr 1656` exits 0:

    depcheck: 235 roadmaps, 2133 edges, 0 problem(s)

There is no UPWARD, CYCLE or moved line. The changed paragraph adds no supplier edge or construction; it explains an existing target at its existing generality.

Direct `lake env lean` elaboration of `TauCetiRoadmap/SchemeAndStackFoundations/Suggested.lean` exits 0, with 48 warnings, all “declaration uses `sorry`”. I also elaborated a scratch copy with 100 valid `#check @name` commands; it exits 0. The supplied scanner's two extra names, `on` and `Formal.DeJong.map`, came from prose rather than declarations and were omitted from that scratch probe. No signature changed. In particular, the curve dichotomy keeps its quasi-compactness binder. There is no changed reflexivity declaration to compare: the two criteria remain README targets. The previous review's signature comparisons and one-tactic padding assessment are carried forward for the unchanged statements.

### Five locators in the changed paragraph

These were read through the sources service in the legal Stacks chapter PDFs, under the existing key `stacks-project`. Line numbers below belong to the named chapter extraction.

| Locator and source evidence | Hypotheses and conclusion verified | Application at this head |
|---|---|---|
| 31.13.2 (0AY0), Divisors p. 19; stacks-project line 839 | Coherent sheaf on an integral locally Noetherian scheme; reflexivity is equivalent to reflexivity of its modules on affine opens | The added integrality qualification accurately describes the source |
| 31.13.5 (0AY3), Divisors p. 20; stacks-project line 858; proof at line 863 | Same hypotheses; all stalks, or just closed-point stalks, detect reflexivity | The added qualification is accurate; the proof uses Hom stalks and closed-point specialization |
| 17.22.4 (01CP), Sheaves of Modules p. 32; stacks-project line 1494 | On a ringed space, Hom-to-stalk comparison is an isomorphism for a finitely presented source and arbitrary target | Apply to the coherent sheaves F and F-dual; local Noetherianity supplies finite presentation |
| 10.10.2 (0583), Commutative Algebra p. 19; stacks-project line 905 | Hom from a finitely presented module commutes with localization at any multiplicative subset | Over a Noetherian ring, both a finite module and its dual are finitely presented, so applying twice gives the double-dual comparison |
| 28.5.9 (02IL), Properties of Schemes p. 6; stacks-project line 251 | Every point of a locally Noetherian scheme specializes to a closed point; no quasi-compactness assumption | A stalk at a generalization is a localization of the closed-point stalk, so its evaluation map is an isomorphism whenever the latter is |

The generalized proof is valid: on an affine Noetherian chart a finite presentation embeds the dual in a finite free module, making the dual finite and finitely presented. The two Hom comparisons identify the evaluation morphisms, not just their source and target modules. Thus affine sections and stalks detect the same isomorphism. Localization then propagates the condition from closed points. None of these steps requires a domain.

The qualification suggested in r86's remark is now explicit. The nearby dual and hull assertions still retain integrality at `README.md:972` and `:979`; the clarification does not assert that every dual on a non-integral scheme is reflexive. The depth and extension arguments at `:998` still use the same stalk comparison and the §0.17 depth inputs.

### Pinned definitions, supplier resolution and ownership

I opened five relevant declarations at the actual pins (Mathlib `1b1ccf4b`, Tau Ceti `2fd255d9`):

| Declaration | File and line at the pin | What it supplies |
|---|---|---|
| `Module.Dual.eval` | `Mathlib/LinearAlgebra/Dual/Defs.lean:70` | The evaluation map v ↦ (φ ↦ φ(v)) |
| `Module.IsReflexive` | `Mathlib/LinearAlgebra/Dual/Defs.lean:203` | Bijectivity of that evaluation map; it does not require a domain or finite generation |
| `SheafOfModules.dual` | `TauCeti/Algebra/Category/ModuleCat/Sheaf/TensorProduct/Closed.lean:104` | Internal Hom into the unit module |
| `SheafOfModules.ihomStalkEquiv` | `TauCeti/Algebra/Category/ModuleCat/Sheaf/InternalHom/FinitePresentation.lean:306` | Hom stalk comparison for finitely presented source and arbitrary target |
| `TauCeti.AlgebraicGeometry.isQuasicoherent_ihom_of_isFinitePresentation` | `TauCeti/AlgebraicGeometry/Modules/InternalHom/Quasicoherent.lean:92` | Quasi-coherence for finitely presented source and quasi-coherent target |

The supporting contract at `TauCetiRoadmap/SchemeAndStackFoundations/README.md:254` already imports these Hom objects. Its AlgebraicVectorBundles L0B citation resolves through the main-branch mapping at `TauCetiRoadmap/AlgebraicVectorBundles/README.md:351` and the pinned internal-Hom entry at `:74`. This is one resolved cross-roadmap citation relevant to the change, not a new dependency.

The `roadmaps grep` ownership search for the criteria and their objects finds them in this roadmap on main (`TauCetiRoadmap/SchemeAndStackFoundations/README.md:851`) and in its revisions #1807 (`:796`), #1808 (`:826`) and #1854 (`:683`). The change explains this existing owner's criteria; it does not introduce a competing owner or a duplicate Lean name. Broader pinned searches in scheme-module files revealed no separate sheaf-reflexivity criterion to replace these targets.

The overlap report and its rerun identify the same three overlapping revisions. Their heads are `afdd14a`, `705e4f6`, and `48aba52`; the description explicitly puts them after #1656 and requires rebasing in that order. No dropped cited id or id defined only by an open revision affects this change. The stale #1276 is R01, not an additional ownership finding.

### Seeded sample and headline coverage

None of this round's fifteen seeded targets (§§0.4, 0.9, 1.4, 1.15, 1.20, 2.2, 2.6, 2.10, 2.15, 3.7, 4.2, 4.3, 4.15, 4.19, 5.1) contains a changed passage. I did not rerun the full sample. I read §0.4's extension contract as context for the dependent §0.6 argument; the new proof concerns the reflexivity criteria and does not change that extension contract.

The unchanged headline list at `README.md:16` is: Nagata results for complete local and quasi-excellent rings; linear Noether normalization; Artin bootstrap; Keel–Mori; coherent duality; the Azumaya Brauer class; Picard torsors; Schlessinger; Grothendieck existence and morphism algebraization; alterations over fields and traits; Grothendieck–Riemann–Roch; Hodge index; and the Weil bound. The unchanged module docstring at `Suggested.lean:34` identifies the missing carriers for its unstated headlines. The nine-line explanation creates no new headline or acceptance-test obligation. The prior headline and padding review is retained rather than reopened.

### Adversarial table

Five rows below compute the two changed criteria and each of their three proof inputs. Then all 40 rows of the previous report are carried forward. “r86” means `PRREVIEW-SchemeAndStackFoundations~86`, at head 7512edb, its adversarial table; every carried row cites it explicitly and is not claimed as a fresh computation. Its qualitative route/carrier rows are preserved as such.

| Statement | Instances tried | Values on each side | Result; change |
|---|---|---|---|
| §0.6 affine criterion, including non-integral X | A = k[ε]/(ε²), M = k; B = k[x,y]/(x,y)², N = k; empty scheme | Over A: M-dual = kε, double dual has dimension 1 and evaluation sends 1 to the map ε ↦ ε, so both module and sheaf criteria are true. Over B: N-dual has dimension 2, double dual dimension 4, evaluation rank 1, so both are false. On the empty scheme: 0 → 0 is an isomorphism and the affine condition holds | Pass; generality unchanged, source qualification added |
| §0.6 all-stalk and closed-stalk criteria | Spec k[t], F from k[t]/(t); Spec B and N above | At (t): k → 0 fails; at every other closed point and at the generic point: 0 → 0 is an isomorphism. Thus F-reflexive, all-stalk and closed-stalk conditions are all false. On Spec B the sole point is closed and the same rank-1 map into dimension 4 fails | Pass; both directions detect the same failure |
| §0.6 double dual of a stalk (01CP twice) | A = k[t,ε]/(ε²), F from A/(t); closed x = (t,ε); generic η = (ε) | t is a non-zero-divisor, so F-dual = 0 and F-double-dual = 0. At x both (F-double-dual)_x and (F_x)-double-dual are 0, while F_x ≅ k[ε]/(ε²) is nonzero. At η all three modules are 0 | Pass; finite presentation is available for both applications |
| §0.6 localization of double duals (0583 twice) | A = k[t,ε]/(ε²), M = A; also M = A/(t); invert t | For M = A both sides are A[1/t], with evaluation the identity. For M = A/(t), M-dual = 0, M-double-dual = 0, M[1/t] = 0, and both compared double duals equal 0 | Pass; no domain assumption needed |
| §0.6 specialization to closed points (02IL) | X = disjoint union over n in ℕ of Spec k[t]; F = O_X | In component n, the generic prime (0) specializes to the closed prime (t). Evaluation is id on k[t]_(t), and localization gives id on k(t); kernels and cokernels on both stalks are 0. Infinitely many components make X non-quasi-compact | Pass; locally Noetherian suffices |

| §0.6 `IsReflexive.dual`, `reflexiveHull` (integral) | cusp `A = k[t²,t³]`, `m = t²k[t]`; `A ⊕ A/m` on the cusp; non-integral `B = k[x,y]/(x²,xy,y²)`, `F = k` | `(A:m) = k[t]` (`t⁻¹·t² = t ∉ A`), `(A:k[t]) = t²k[t] = m`, so `m^∨∨ = m` and `k[t]^∨∨ = k[t]`. `dim m/m² = 2` (`t², t³`), so `m` is not locally free. `(A ⊕ k)^∨∨ = A`, and the unit has kernel `k` (torsion), as 0AY2 says. On `B`: `k^∨ = Ann(m) ≅ k²`, `k^∨∨∨ = k⁸ ≠ k²`, so the dual is not reflexive without integrality | Carried from r86; Pass; R04 repaired |
| §1.10 `smallEtaleTopology` coverings | `{Spec ℂ → Spec ℝ}`; empty family over `∅` and over `Spec k`; fold `S ⊔ S → S` | One point of `Spec ℝ` is covered, so it is a covering (it would not be a Nisnevich covering: residue extension `ℂ/ℝ`). The empty family covers `∅` and does not cover `Spec k`. `{j₀, j₁}` covers `T` | Carried from r86; Pass; R05 repaired |
| §1.21 `Stack.quotient` | Galois groupoid `Spec ℂ ⊔ Spec ℂ ⇉ Spec ℂ` over `ℝ` | Prestack over `Spec ℝ`: `X(ℝ) = ∅`, so 0 objects. `[X/R]`: Isom sheaves are subsingletons (044V, `j` an isomorphism), and the sheaf of isomorphism classes is `Spec ℝ` (03C5), so there is 1 object and `[X/R] ≃ Spec ℝ` | Carried from r86; Pass; R06 repaired |
| §1.21 `BG` Check | `G = ℤ/2` over `ℝ` | `H¹(ℝ, ℤ/2) = ℤ/2`: 2 torsors (`Spec ℝ ⊔ Spec ℝ`, `Spec ℂ`). The sheaf quotient `pt/(ℤ/2) = pt` has 1 section | Carried from r86; Pass |
| §1.21 `rootStack`, square-root Check | `X = 𝔸¹`, `L = O`, `s = t`, `n = 2`, including characteristic 2 | Chart `[Spec k[u] / μ_2]`; stabiliser `μ_2` at `u = 0`. Over `t ≠ 0`, `k[u^±] ⊗_{k[t^±]} k[v^±] = k[u^±][ζ]/(ζ² − 1)` with `ζ = v/u`, a `μ_2`-torsor in every characteristic, so the map to `𝔾_m` is an isomorphism. The double cover has degree 2 there | Carried from r86; Pass; R06 repaired |
| §4.6 `deformations_of_smooth_schemes` | `ℙ¹`; elliptic `E`; affine `U` | `H¹(O(2)) = H²(O(2)) = 0`, so lifts exist and are unique. `H⁰(O(2)) = k³` = infinitesimal automorphisms. `H¹(T_E) = k`, `H²(T_E) = 0`. On affine `U`, `Ext²(Ω_U, G) = Ext¹(Ω_U, G) = 0`. `G = O_X ⊗_k I ≅ I ⊗_A O_{X_A}`, since `m_A I = 0`, so 08LI gives flatness | Carried from r86; Pass; R03 repaired |
| `algebraize_hom` | `Y = ∐_{m∈ℕ} 𝔸¹_A`, `X = Spec k[[t]]`; `X = ℙ¹_A` into the same `Y`; `X = ∅`; non-complete `k[t]`, `I = (t)` | One point `X_0` lands in one copy `V`, and `(a_n) ↦ a = lim a_n ∈ A`. Connected `ℙ¹_A` lands in one copy, and `Γ(ℙ¹_A, O) = A` gives a constant `a`. `X = ∅` has the unique empty `G`. For `k[t]`, the maximal ideal `(t − 1) ∌ t`, so a closed point lies outside `X_0`; this is excluded by `AdicRing.complete` | Carried from r86; Pass; R02 repaired |
| `artinSchreier_vanishing` (docstring) | `Spec 𝔽_p`; `Spec 𝔽_p(t)`; `Spec ℤ/p²` | `H¹ = ℤ/p`, `H² = 0`. `cd_p ≤ 1`, so `H^{≥2} = 0`. `CharP (ℤ/p²) p` fails, so it is excluded. This is 0A3K (1) | Carried from r86; Pass; R08 repaired |
| `isReplete_proetale` (docstring) | the route | Proposition 4.2.8 (locally weakly contractible), then Proposition 3.2.3 (1) (replete) | Carried from r86; Pass; R08 repaired |
| §0.6 `coherent_hartogs`, extension (carried) | `Spec k[t]`, `F = k[t] ⊕ k[t]/(t)`; `𝔸²∖0`; two planes in `𝔸⁴` | `F^∨∨ = k[t]` against `k[t,t⁻¹]`. `Γ(𝔸²∖0, O) = k[x,y]`. Depth 1, `j_*O_U = k[x,y] × k[z,w] ≠ O_X` | Carried from r86; Pass (previous review) |
| `exists_linear_normalization` (carried) | `𝔽₂[X,Y]/(XY(X+Y))`; `z = x²+xy+y²`; `k[X,E]/(E²)`; `A = k`; `A = k×k` | `A/(ℓ) ≅ k[T]` for each `ℓ`. `x³ − zx = 0`. `d = 1`, basis `1, E`. `d = 0`. `d = 0`, rank 2 | Carried from r86; Pass (previous review) |
| §0.23 dichotomy Checks (carried) | `𝔽_{p²}/𝔽_p`; cusp; node | 2 points over 1. 1 point over the origin. `t = ±1` over the node | Carried from r86; Pass (previous review) |
| `smallEtaleBaseChange_isEquivalence` (carried) | `Spec k → Spec k[ε]`; `Spec 𝔽_{p²} → Spec 𝔽_p` | Equivalence by 04DZ. 2 endomorphisms against 4 | Carried from r86; Pass (previous review) |
| §0.27 flat extension (carried) | `ℤ→ℤ[1/2]`; `k[x,y]→k[x]`; `ℤ/4→ℤ/2`; `⊕ℤ` over `ℚ` | `(12) ↦ (3)`. `(x²)` against `(x)`. `0` against `ℤ/2`. `0` against `ℚ` | Carried from r86; Pass (previous review) |
| §0.28 quotient comparisons (carried) | `ℙ¹`, two points; `𝔸²∖0 → 𝔸²` | `k` against `k × k`. `k` against `0` | Carried from r86; Pass (previous review) |
| §1.5 `quotientSheaf.restrict` (carried) | `R = ∅`, `U′ = U ⊔ U`; `Δ ⊔ Γ`; quadratic `L/K` | 2 points against 1. `Γ ∩ Δ = ∅`. Presheaf `∅`, sheaf a point | Carried from r86; Pass (previous review) |
| §2.23 equivariant cohomology (carried) | point, `ℤ/2`, `F = ℤ`; `Γ = ℤ`; `Γ = 1` | `ℤ, 0, ℤ/2, 0, …`. `ℤ^ℤ` against `ℤ[ℤ]`. Equivalence | Carried from r86; Pass (previous review) |
| `isAffine_or_isProper` (carried) | `𝔸¹`; `ℙ¹`; doubled origin | Affine, not proper. `Γ = k`, proper. Not separated, excluded | Carried from r86; Pass (previous review) |
| `genus_baseChange` (carried) | `ℙ¹_k`; `ℙ¹_L` over `k`; `y² = x^p − t` | `g = 0`. `[L:k] > 1`, excluded. `g = (p−1)/2` | Carried from r86; Pass (previous review) |
| `vectorBundleDegree_pullback` (carried) | `z ↦ z²`, `O(1)`; `O^r`; `ℙ¹ ↪ V(z²)` | `2 = 2·1`. `0 = 2·0`. Not integral, excluded | Carried from r86; Pass (previous review) |
| §3.3 Ext–Hom duality (carried) | nodal cubic, `K` at the node; `U = O_X` | `2` against `1`. `Ext¹(O,V) = H¹(V)` | Carried from r86; Pass (previous review) |
| §3.6 Picard torsors (carried) | real conic; elliptic `E` | Cokernel `ℤ/2 = Br ℝ`. `Pic^d ≅ E` | Carried from r86; Pass (previous review) |
| §4.5 obstruction theory (carried) | `k[[t]]/(t²)`; `ε ↦ 2ε` over `ℚ` | `dim O ≥ 1`. `v = 4v ⇒ v = 0` | Carried from r86; Pass (previous review) |
| §4.9 formal functions (carried) | `Spec A`; `ℙ¹_A` | `M^∧ = lim M/IⁿM`. `H⁰ = A` | Carried from r86; Pass (previous review) |
| `grothendieck_existence` (carried) | `X = Spec A` | Finite over the complete `A` | Carried from r86; Pass (previous review) |
| `Ring.IsNagata/IsJapanese.of_complete_local` (carried) | `k[[x,y]]`; `ℤ_p`; a domain | Nagata; Japanese through `IsNagata.isJapanese` (probe exit 0) | Carried from r86; Pass; R07 settled by #1807 |
| `IsQuasiExcellentRing.isNagata` (carried) | `ℤ`; a field | `IsGRing ∧ IsJ2` gives Nagata | Carried from r86; Pass (previous review) |
| `artinBootstrap` (carried) | `F = U`; `Spec L → h_{Spec K}` | An algebraic space; 04S6 (3) | Carried from r86; Pass (previous review) |
| `torsorRepresentability`, `Torsor.trivial_iff_section` (carried) | `P = G`; `Spec ℂ/ℝ` | Identity section. No `ℝ`-point | Carried from r86; Pass (previous review) |
| `noetherianSpace_vanishing` (carried) | point; `ℙ¹` | `H^{>0} = 0`. `H¹(O(−2)) = k`, `H² = 0` | Carried from r86; Pass (previous review) |
| `isAffine_of_H1_vanishing` (carried) | `ℙ¹`; `𝔸²∖0` | `H¹(O(−2)) = k`. `H¹(O)` infinite-dimensional | Carried from r86; Pass (previous review) |
| `flat_over_dedekind` (carried) | `S ⊔ 𝔸¹_S`; `k[t,x]/(x², tx)` | Flat. Torsion, excluded | Carried from r86; Pass (previous review) |
| `genus_of_finite_etale` (carried) | `[n]` on `E`; genus-2 double cover; `Y ⊔ Y` | `0 = n²·0`. `3 − 1 = 2·1`. Excluded by `hX` | Carried from r86; Pass (previous review) |
| `intersectionNumber` (carried) | `ℙ²`, `O(1)²`; `ℙ¹×ℙ¹`, `(1,0)²` | `1`; `0` | Carried from r86; Pass (previous review) |
| `hodge_index` (carried) | `H = (1,1)`, `D = (1,−1)`; `H = (1,0)` | `H² = 2`, `D·H = 0`, `D² = −2`. `H² = 0` excluded | Carried from r86; Pass (previous review) |
| `weil_bound` (carried) | `y²+y = x³` over `𝔽₂`; `ℙ¹/𝔽_q` | `0 ≤ 2√2`; `0 ≤ 0` | Carried from r86; Pass (previous review) |
| `node_local_structure_dvr` (carried) | `a = 0`; `a = επⁿ` | Identity. `u ↦ εu′` | Carried from r86; Pass (previous review) |
| `alteration_theorem` (carried) | `𝔸¹`, `Z = 0` | `ℙ¹`, `B = {0,∞}` | Carried from r86; Pass (previous review) |
| `semistable_alteration_theorem` (carried) | `ℤ_p[x,y]/(xy − p²)` | One blow-up; `uv = p` | Carried from r86; Pass (previous review) |
| Keel–Mori, duality, Brauer class, `Pic^d`, Schlessinger, GRR (carried) | the pins | No carrier at either pin; the docstring is accurate | Carried from r86; Pass (previous review) |

## Not verifiable

- No source needed for the nine changed lines remains unread. The initially tried Sheaves of Modules URL returned 404; the sources service successfully fetched the chapter at its correct `modules.pdf` URL.
- The settled uncertified sources `hartshorne-1977` and `de-jong-1996` were not requested again. Their untouched claims, including sampled §4.19, retain the earlier review's limitation.
- Unchanged source checks, headline mathematics and padding results are inherited from r86, not independently repeated in this incremental pass. Its Grothendieck 1957 and Cadman 2005 limitations also remain outside the changed passage.

## Source issues

- none
