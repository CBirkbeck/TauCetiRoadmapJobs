# Review of ProfiniteCohomology (pull request #616 at 4b49a9b)

**Verdict:** needs changes

This is an incremental re-review of the 117 lines that changed since `c3ef204`. Only `TauCetiRoadmap/ProfiniteCohomology/README.md` changed: `Suggested.lean` is byte-identical, and `git diff --stat origin/main...HEAD -- . ':!TauCetiRoadmap/ProfiniteCohomology'` is empty.

Previous findings R02–R05 are repaired, and each repair is correct at both Tau Ceti pins. R01, the pin lag, is not repaired, and I re-raise it. This head adds six more citations that resolve only at main's pin. No other new problem was found.

## R01 (P2) — The folder cites Tau Ceti `2fd255d9` (main's pin) while the branch pins `358314d4`; this head adds six more such citations

Re-raised: H01

**Location:**
- `TauCetiRoadmap/ProfiniteCohomology/Suggested.lean:33`–`:36`: "the headline theorems of the roadmap that the pinned libraries do not yet prove, each with `sorry`". Also `:76`–`:83`, and the `sorry`s of the theorems at `:309` and `:568`.
- `README.md:37`–`:39`.
- Paths changed by this head: `:623`, `:2191`, `:2295`, `:2532`, `:2637`, `:2641`, `:2646` and `:3573`.
- Names changed by this head: 10.3 at `:2626`, `:2641` and `:2644`–`:2646`.

**Claim:** `lake-manifest.json` on this branch still pins Tau Ceti `358314d4` and Mathlib `f6090c70`. Main (`1bea835`) pins Tau Ceti `2fd255d9`. The reply to the last review confirms that the README cites `2fd255d9`, and this head moves further toward it:

- **Five module paths** now name their `2fd255d9` location, and none of them exists at `358314d4`:
  - `PowerClassGroup/Basic.lean` (`:623`, `:2295`, `:2532`);
  - `Cup/ConnectingMap/Basic.lean` (`:2191`);
  - `ExactCochains/Basic.lean` (`:2637`, `:2641`);
  - `ExactCochains/Topology.lean` (`:2646`);
  - `Tensor/Induction/Basic.lean` (`:3573`).

  At `358314d4` the files are `PowerClassGroup.lean`, `Cup/ConnectingMap.lean`, `ExactCochains.lean` and `Tensor/Induction.lean`.
- **10.3** cites `continuousCochainsShortExact_shortExact_moduleCat`, which `358314d4` lacks. It also describes `continuousCochainsShortExact_shortExact` as short exactness in `CochainComplex (TopModuleCat ℤ) ℕ`. At `358314d4` that name is the forgetful `ModuleCat` statement. The `TopModuleCat` statement exists only at `2fd255d9`.

**Recount at this head.** I matched all 792 backticked qualified names of the README against a declaration index of each pin, and every backticked path against each pin's file tree:
- 64 Tau Ceti names have no declaration at `358314d4` and one at `2fd255d9`. That is last round's 63 plus `_moduleCat`. They include:
  - `TauCeti.abelianizationProPClass_generates` and `TauCeti.galoisEvens_galoisRes`;
  - the 13 `OpenSubgroup.evensNorm*`/`indexTwoDelta*` names;
  - `TauCeti.ContinuousCohomology.res_comp_conjMap`;
  - the eight `TauCeti.zHat.*` names.
- 27 cited module files exist only at `2fd255d9`, five of them new at this head. The `Evens/Norm/` directory is also absent at `358314d4`.

At `2fd255d9`, the statements stated with `sorry` at `Suggested.lean:309` and `:568` are proved theorems: `ClassModule/Sylow.lean:156` and `GaloisCohomology/EvensNorm.lean:143`. So the folder is wrong at either pin:
- at its own pin, it cites declarations and files that do not exist;
- at main's pin, it leaves two proved theorems as `sorry`, and its docstring's "do not yet prove" is false for them.

**Why the reply does not settle it:** The reply (H01, "answered") accepts the facts and leaves the merge to the author. That decides who acts, not whether the folder is correct.
- The pull request cannot merge without this merge anyway. `gh pr view 616` reports `CONFLICTING`, and `git merge-tree --write-tree --name-only HEAD origin/main` lists only this folder's `README.md` and `Suggested.lean`.
- The build passes only because `Suggested.lean` imports none of the missing modules.

I hold the finding so that the roadmap goes to the author or an operator. It is this review's only finding.

**Witness:** At `358314d4`, the tree has `ContCohomology/ExactCochains.lean` and no `ExactCochains/` directory. Its `:403` states `continuousCochainsShortExact_shortExact` as short exactness of the cochain sequence after `forget₂ (TopModuleCat ℤ) (ModuleCat ℤ)`. At `2fd255d9`, that is `_moduleCat` (`ExactCochains/Basic.lean:425`).

**Repair.** The author or an operator does this, not the folder's repair worker:
1. Merge `origin/main` into the branch, keeping this branch's text in the two conflicting files.
2. Replace the `sorry` at `Suggested.lean:315` with `TauCeti.abelianizationProPClass_generates Fact.out hG hV`, and the one at `:574` with `TauCeti.galoisEvens_galoisRes K L σ hdeg y`. Adjust the explicit arguments to the merged signatures.
3. Rewrite `Suggested.lean:33`–`:36` and `:76`–`:83`, and `README.md:37`–`:39`, so that the two universe theorems (`:275`, `:283`) are the only `sorry`s.
4. Re-run the gate with the targeted build.
5. Update the pull-request description. It still describes `CohomologyUniverseComparison.lean`, `DimensionNormalization.lean`, "19 admitted targets" and Tau Ceti `a91d3aaf`.

What I checked for this repair: every path and name this head introduced resolves at `2fd255d9` with the hypotheses the README states (see Verified sound).

## Previous findings

- R01 — not repaired: `lake-manifest.json` still pins Tau Ceti `358314d4`. `Suggested.lean:33`–`:36` still says "the pinned libraries do not yet prove". 10.3 now cites `ExactCochains/Topology.lean` and `continuousCochainsShortExact_shortExact_moduleCat`, which exist only at `2fd255d9`.
- R02 — repaired: `README.md:1686`–`:1691` reads "for a profinite `G` (`[CompactSpace G] [TotallyDisconnectedSpace G]`, which both theorems carry) … Neither applies to a non-compact `G` such as the discrete `ℤ` with `U = 2ℤ`". 6.5 (`:1781`–`:1798`) gives the route and says that no textbook locator is used.
- R03 — repaired: `:936`–`:939` reads "The fourth, the `R`-linear functor instance on `TauCeti.ContinuousCohomology.continuousCochainsFunctor` … is a target of this layer". It is listed at `:52`–`:53`.
- R04 — repaired:
  - Layer 4 has no *Needs:* on Layer 10. 4.4 (`:1410`–`:1412`) reads "for `i = 1, 2` … (4.2). The same description in every degree is 10.1's".
  - `:1539` reads "milestones of Layer 10 (10.3)".
  - Layer 13 (`:3574`, `:3894`) adds "Layer 9 (the Galois group and coefficients of 13.3)".
- R05 — repaired: `:167` reads "### Boundary with the representation theory family", with its body at `:169`–`:183`.

## Verified sound

**Gate, build and dependency check.**
- My gate run, `gate … ProfiniteCohomology --base origin/main`: every check `0`, `OK`. The worker's gate with the targeted build: every check passed.
- `lake env lean` on `Suggested.lean`: exit 0 in 17 s, with exactly four `declaration uses sorry` warnings, at `:275`, `:283`, `:309` and `:568`.
- I elaborated the generated `#check @` file for all declarations once:
  - The one error is its line 590, `#check @-module`, where the generator mistook the `module` keyword for a name. That line is not part of `Suggested.lean`.
  - The four `sorry`ed signatures are unchanged from the r13 report. `abelianizationProPClass_generates` carries `[Fact p.Prime] [CompactSpace G] [TotallyDisconnectedSpace G] (hG : scd_p p G ≤ 2)`, and the universe theorems carry `[Group G] [TopologicalSpace G] [IsTopologicalGroup G]` only.

```text
depcheck: 235 roadmaps, 2261 edges, 0 problem(s)
```

There is no UPWARD, CYCLE or `moved:` line.

**The changed passages, at both Tau Ceti pins** (`358314d4` is the branch's pin, `2fd255d9` main's):

- **1.7.**
  - `continuousCochainsFunctor : TopRep R G ⥤ CochainComplex (TopModuleCat R) ℕ` with `map f := cochainsMap (ContinuousMonoidHom.id G) f` (`Additive.lean:339`; `:401` at `2fd255d9`).
  - Instances: `continuousCohomologyFunctor_additive` (`:222`/`:221`), `continuousCohomologyFunctor_linear` (`:321`/`:383`), `continuousCochainsFunctor_additive` (`:347`/`:409`). `git grep` finds no `Linear` instance on `continuousCochainsFunctor` at either pin.
  - `cochainsMap_smul` (`:161`/`:165`, under `[CommRing R]`) is the one field of `Functor.Linear` at `φ = id`. The new target is therefore statable, and its stated law is exact.
- **Layer 6 and 6.5.**
  - `map_comp_corestriction_of_conj` and `explicitCor2_explicitMap2_of_conj` carry `[CompactSpace G] [TotallyDisconnectedSpace G]`: `Corestriction/Conjugation.lean:88`–`:89` and `:404`–`:405` at `358314d4`, `:90`–`:91` and `:423`–`:424` at `2fd255d9`. The degree-two theorem's direction is `explicitCor2 V ∘ explicitMap2 κ f = explicitCor2 U`, with `κ v = g⁻¹vg` and `f m = g • m`, which is the direction 6.5 states for degree one.
  - `cochainsCor1` is `γ ↦ ∑ u : G ⧸ U, t u • f ⟨lWord U t u γ, _⟩` (`Corestriction/Basic.lean:256`), the degree-one formula of Conventions (`:390`).
  - `explicitCor1` needs only `[TopologicalSpace G] [SeparatelyContinuousMul G]`, `[U.FiniteIndex]` and `IsOpen U` (`:406`, `:467`), so "over any topological group" is right.
  - `explicitCor1_eq_transversal` is at `:471` (`:491` at `2fd255d9`).
  - The route's identities recompute (see the table).
- **8.5.** All six Leibniz lemmas are at `Cup/ConnectingMap/Basic.lean:135`–`:262` at `2fd255d9`, and in `Cup/ConnectingMap.lean` at `358314d4`.
- **10.3** at `2fd255d9`:
  - `continuousCochainsShortExact_shortExact_moduleCat [LocallyCompactSpace G] [ContinuousSMul G B]` (`ExactCochains/Basic.lean:425`).
  - `continuousCochainsShortExact_shortExact` with the same hypotheses (`ExactCochains/Topology.lean:48`), proved by `exact_map_iff_of_faithful`, `mono_of_mono_map` and `epi_of_epi_map` along `forget₂ … |>.mapHomologicalComplex`. Its module docstring says the forgetful functor preserves homology because it has both adjoints.
  - `delta` is defined from `continuousCochainsShortExact_shortExact_moduleCat.δ` under `[CompactSpace G]` (`HomologySequence.lean:97`–`:120`).
  - Every sentence of the new 10.3 text matches.
- **Layer 9 and the From Tau Ceti list.** `PowerClassGroup/Basic.lean` holds `powerSubgroup` and `powerClassHom` at `2fd255d9` (`:41`, `:54`).
- **Layer 12, item 8.** `degreeCast` is in `TauCeti.ContinuousCohomology` in `DegreeCast.lean` at both pins (`:68`/`:69`). `cup_gradedComm` is in `Cup/Graded/Comm.lean` (`:447`/`:446`) and transports by `ContinuousCohomology.degreeCast`. Both attributions are now right at both pins; the old one put `degreeCast` in `Comm.lean`.
- **Layer 13.** `Subgroup.tensorInductionFunctor` is at `Tensor/Induction/Basic.lean:321` at `2fd255d9` (`Tensor/Induction.lean:235` at `358314d4`).
- **4.4 and the 4.x API.** 10.1 (`:2568`–`:2589`) ends "What remains here is the agreement with every Layer 4 system in degrees `0, 1, 2`", as the new Comparison bullet says.
- **5.3.** `explicitIso_delta0` and `explicitIso_delta1` are in `ConnectingMapComparison.lean` at both pins, which 10.3 lists.

**Ownership and overlaps.**
- `roadmaps grep --fixed continuousCochainsFunctor` finds only this roadmap (on main and in #1187).
- `roadmaps grep 'explicitCor1.*conj|conj.*explicitCor1'`: no match on main or in any open pull request. The two new targets have no second owner.
- `scratch/overlaps.md`:
  - no cited id is dropped, and none is defined only by an open revision;
  - no id this pull request drops is cited elsewhere;
  - #1187 is the known conflicting head, unchanged since the last review.

**Remarks on untouched text (no change asked):**
- 8.5 and 10.3, both in the seeded sample, carry no textbook locator of their own. Every claim in them is a pinned Tau Ceti declaration, and the same identities are located elsewhere: NSW (1.3.2) at 5.3 (`:1521`), and NSW (1.4.3) and (1.4.5) at Layer 12 (`:3521`).

**Seeded sample, where it falls in the changed passages:**
- 8.5: the names and file are checked as above, and the second-variable sign recomputes on cochains (table).
- 10.3: checked as above. Its sources, NSW and Brown, are not readable here (see Not verifiable).
- The other sampled targets are untouched; their r13 rows are carried below.

**Adversarial table.** Rows marked "r13" are carried unchanged from the previous report, for statements this head leaves untouched. The rest are computed here for the changed statements.

| Statement | Instances | Values computed | Result | Change |
|---|---|---|---|---|
| 1.7 `R`-linear instance on the cochain functor (new target) | `R = ℤ/4`, `G = C₂`, `X = Y = ℤ/4` trivial, `f = id`, `r = 3`; `R = ℤ` | degree 0: `map(3•id)(1) = 3 = 3•map(id)(1)`; for `R = ℤ` additivity already gives linearity, so the instance has content only for `R ≠ ℤ`; instance at either pin: absent | target statable and exact | none |
| 4.4 colimit for `i = 1, 2` | `G = ℤ_p`, `M = ℤ/p`, `U = pᵏℤ_p` | `H¹` stages `Hom(ℤ/pᵏ, ℤ/p) = ℤ/p`, transitions bijective, colimit `ℤ/p = Hom_cont(ℤ_p, ℤ/p)`; `H²` stages `ℤ/p`, inflation `0` (the extension `ℤ/p^{k+1}` pulled back along `ℤ/p^{k+1} ↠ ℤ/pᵏ` splits by `x ↦ (x, x)`), colimit `0 = H²(ℤ_p, ℤ/p)` | consistent | none |
| Layer 6 conjugation contracts | discrete `ℤ ⊇ 2ℤ`; `ℤ₂ ⊇ 2ℤ₂` | `CompactSpace ℤ` fails, so neither contract applies, as now stated; `ℤ₂` abelian, `V = U`, conjugation is the identity on `H¹(2ℤ₂, M)`, so both sides equal `cor` | hypotheses now exact | none (R02) |
| 6.5 degree-one square (route) | `S₃`, `U = ⟨(12)⟩ = Stab(3)`, `g = (13)`, `V = ⟨(23)⟩`, `M = 𝔽₂`, `f = χ_U` | `t_U = {e, (13), (23)}`; `t_V(V) = t_U((13)U)(13)⁻¹ = e ∈ V`; `ℓ^V_{yV}(γ) = g ℓ^U_{ygU}(γ) g⁻¹` expands from `ℓ_u(γ) = (t u)⁻¹γ t(γ⁻¹u)`; `Ver((12)) = (12)`, `Ver((123)) = e`; `cor_U χ_U = sgn = cor_V χ_V`: values `1 = 1` at `(12)`, `0 = 0` at `(123)` | route correct | none (R02) |
| 5.3 / 10.3 milestone attribution | the two `explicitIso_delta*` | in `ConnectingMapComparison.lean` at both pins; `delta` is in `HomologySequence.lean` (Layer 10) | consistent | none (R04) |
| 8.5 second-variable sign | `(p, q) = (1, 0)`, `(a ⌣ b)(g) = a(g)·g b`, `a` a 1-cocycle | `d¹(a⌣b)(g,h) = g a(h)·ghb − a(gh)·ghb + a(g)·gb = −a(g)·g(hb − b) = −(a ⌣ d⁰b)(g,h)`, so the sign is `(−1)^p = −1`; first variable: `d(x⌣y) = dx⌣y` for a cocycle `y`, no sign | consistent with `explicitDelta1_explicitCup10_right` | none |
| 10.3 short exactness, two forms | `G = ℤ_p`, `0 → ℤ/p → ℤ/p² → ℤ/p → 0` trivial; discrete `G = ℤ` | `δ⁰(1) = d⁰(1)(γ) = γ·1 − 1 = 0`, so `H¹(ℤ/p) → H¹(ℤ/p²)`, `χ ↦ pχ̃`, is injective; `ℤ` is locally compact, so both short-exactness theorems apply to it, but `delta` (compact `G`) does not | consistent at `2fd255d9`; the names differ at `358314d4` | R01 |
| Layer 12 item 8 attribution | `degreeCast` at `m = n`; `cup_gradedComm` at `n = 0` | `degreeCast_rfl` gives `Iso.refl`; `(−1)^{m·0} = 1` and `a ⌣ b = flip-cup b a` | consistent at both pins | none |
| Layer 13 dependencies | "This roadmap:" lines | Layer 13 now `{9, 10, 12}`; closure contains 9, which 13.3 needs; Layer 4 `{2, 3}`, no edge to 10; Layer 10 → 4 only | acyclic, complete | none (R04) |
| R01 pin citations | 792 backticked qualified names; all backticked paths | 64 Tau Ceti names and 27 module files only at `2fd255d9`; `continuousCochainsShortExact_shortExact` is `ModuleCat` at `358314d4:ExactCochains.lean:403` and `TopModuleCat` at `2fd255d9:ExactCochains/Topology.lean:48` | folder cites main's pin | R01 |
| 0.3 continuous section (r13) | `ℤ_p → ℤ/p`; `ℝ → ℝ/ℤ`; `∅` | `s(p−1)+s(1) = p ≠ 0 = s(0)`; no injective continuous `S¹ → ℝ`; extensions 1 and 0 | consistent | none |
| 1.1 carrier (r13) | `G = 1`, `ℤ`; `C₂` on `𝔽₃`, trivial and sign; `0` | `H⁰ = ℤ`; `#H⁰ = 3`, sign `1`; `0` | consistent | none |
| 3.2 generality and chain formulas (r13) | `ℚ_p`; `⊕ℕ𝔽₂ ⊂ ∏ℕ𝔽₂`; `G = 1` | `df(1,g,gh) = g c(h) − c(gh) + c(g)`; countable against uncountable characters | consistent | none |
| 4.3 coefficient colimits (r13) | `ℤ_p`, `p⁻ᵏℤ_p/ℤ_p`; `⊕ℕℤ` | colimit `ℚ_p/ℤ_p = H¹`; `(p⁻ᵏ)_k` not bounded | consistent | none |
| 5.5 transgression (r13) | `C₂ ⊂ C₄`; `C₃ ⊂ C₉` | `tg: 𝔽₂ ↪ 𝔽₂`; `d¹f(2,1) = 2 = −carry(2,1)` | sign pinned | none |
| 6.1 transversal word (r13) | `C₄ ⊇ C₂`; `U = G`; `S₃ ⊇ 1` | `ℓ_U(s) = s²`; `ℓ = γ`; `1` | consistent | none |
| 8.1, 8.2, 8.4 (r13) | `C₂`, `𝔽₂`; `(0,1,1)`; `C₂ ⊇ 1` | `(χ⌣χ)(s,s) = 1`; 10 associativity instances; `cor(res a·b) = 2ab = a·cor b` | consistent | none |
| 9.1, 9.5 (r13) | `ℂ`, `ℝ`, `𝔽_p(t)`; `ℂ/ℝ` | `#G = 1, 2`; `z = w/w̄`, `H¹ = 0` | consistent | none |
| 10.4 Shapiro (r13) | `C₂`, `H = 1`; sign `ℤ` | `H²(ℤ_sign) = 0 ≅ H¹(ℤ)`; `H³(ℤ_sign) = ℤ/2 ≅ H²(ℤ)` | consistent | none |
| 11.2 universe equality, headline (r13) | `G = 1`, `ℤ_p`, `C_p`; `u = 0` | `0 = 0`, `1 = 1`, `⊤ = ⊤`; `rfl`/`simp` fail at general `u` | true, not padding | none |
| 11.8 class module, headline (r13) | `ℤ_p ⊇ pℤ_p`; `C_p ⊇ 1`; `ℤ_p² ⊇ pℤ_p²` | `#H² = p`; `scd_p = ⊤` excluded; `p⁴ ≠ p²` at `scd_p = 3` | hypotheses exact | R01 |
| 13.1, 13.2 (r13) | `S₃ ⊇ C₂`; `C₃ × C₂ ⊇ C₃`, `𝔽₃` | not exact at `H¹(U)`; `N(2a) = N(a)` | consistent | none |
| 13.3 identity 5, headline (r13) | `ℂ/ℝ`; `𝔽₉/𝔽₃` | `x² + x² = 0`; `H²(Ẑ,𝔽₂) = 0` | holds | R01 |

## Not verifiable

- **NSW** and **Serre, *Galois Cohomology***: settled as `uncertified`, and cited by locator. NSW (1.3.2) for 5.3/10.3 and (1.4.3) for the connecting-map Leibniz rule are unchecked against the text. Their content was checked on the instances in the table.
- **Brown, *Cohomology of Groups*, and Ribes–Zalesskii**: not in the sources cache, and no legal copy was found in earlier rounds. They are not needed for any changed passage.
- **Elaboration at main's pin**: the Lean commands this review may run elaborate only in this worktree, at `358314d4`. I read the `2fd255d9` statements cited above from the Tau Ceti git history, without elaborating them.

## Source issues

- none
