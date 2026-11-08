# FIX-DESIGN-StackPointsAndResidualGerbes~4

Findings of `REV-DESIGN-StackPointsAndResidualGerbes~3`: one review, two P3 findings. Each was settled on
the mathematics.

Files edited:
- `packages/StackPointsAndResidualGerbes/design/README.md`
- `packages/StackPointsAndResidualGerbes/design/plan.json`
- `packages/StackPointsAndResidualGerbes/sources.toml`

## F01 (P3) — applied differently

The finding is right. On main, ReductiveGroups Layer 2 says only "smoothness and dimension tools via
`Lie(G)` … the smoothness criterion". Its Layer 3 calls representability of `G/H` "a theorem with
hypotheses". Neither section states that `GLₙ/G_x` is a smooth scheme of dimension `n² − dim G_x`.

Old → new: in 7.3, "Embedding `G_x` in some `GLₙ`, `BG_x = [(GLₙ/G_x)/GLₙ]` gives … (ReductiveGroups
Layers 2–3)" → an item-by-item route:
1. `G_x ⊆ GLₙ`.
2. `Q = GLₙ/G_x` is a smooth scheme of pure dimension `n² − dim G_x` (new gap), and `π` is a `G_x`-torsor.
3. `π` defines a smooth `q : Q → BG_x`.
4. §8.3 gives `T_{GLₙ,e} → T_{Q,ē} → T_{BG_x} → 0` with `ker dπ_e = Lie(G_x)`.
5. The Lie criterion finishes.

**Why "differently".** The pinned Tau Ceti already proves three of the four inputs, so they are cited
there and not on ReductiveGroups:
- `TauCeti.AffineGroupSchemeCat.exists_isClosedImmersion_generalLinear`
  (`TauCeti/Algebra/AlgebraicGroup/Representation/Embedding.lean:212`): an affine group scheme locally
  of finite type over a field has a closed-immersion homomorphism into some `GLₙ`.
- `CommHopfAlgCat.fppfHomogeneousQuotient` (`.../Fppf/Quotient/Homogeneous/Basic.lean:217`): the fppf
  sheaf `G/N` for any closed subgroup, with "Normality and representability are not required".
- `CommHopfAlgCat.isPullback_fppfHomogeneousQuotientTorsor` (`.../Homogeneous/Torsor.lean:160`, kernel
  pair `G × N`) and `isLocallySurjective_fppfHomogeneousQuotientSheafProjection` (line 154): the torsor
  clause the review asks for.
- `TauCeti.HopfAlgebra.smooth_iff_finrank_lie_eq_ringKrullDim`
  (`.../Tangent/Regularity.lean:112`, any field, finite type): `Algebra.Smooth k H ↔ finrank Lie = ringKrullDim H`.

So the gap asks only for what is missing at the pin: representability, smoothness and dimension. The
"quasi-projective" clause the review suggested is not used by 7.3 and is left out.

Representability is proved at the pin only for linearly reductive `H`
(`.../Homogeneous/Coinvariants.lean`, `isIso_fppfHomogeneousQuotientToCoinvariantsPoints_of_isLinearlyReductive`).
`G_x` need not be linearly reductive (`μ_p`, `α_p`), so the general case is a gap.

The new gap is `gap:homogeneous-quotient-scheme` on ReductiveGroups Layer 3. Its README line is under
"From TauCetiRoadmap.ReductiveGroups", and `plan.json` has the matching `gaps` entry. Its source is
SGA 3, Exposé VI_A, Théorème 3.2, at sga3-vi-a lines 871–894. Over a local Artinian ring, so over a
field, with `F → G` a monomorphism, that theorem gives:
- (i) the quotient exists as a scheme;
- (ii) and (ii′) it is a sum of schemes of finite type, whose connected components are irreducible of
  dimension `dim G − dim F`;
- (iv)(a′) it represents the fppf quotient sheaf, and the projection is an `F`-torsor;
- (b) it is smooth if `G` is;
- (c) it is separated.

SGA 3 writes the left quotient `F\G`, which is isomorphic to `G/F` through `g ↦ g⁻¹`.

**The reviewer's step through 2.2 is replaced.** The review proposed identifying
`[(GLₙ/G_x)/GLₙ] ≃ BG_x` through 2.2. I replaced that step with a direct argument that needs less:
- §1.21's `actionQuotient.torsorEquiv` turns the torsor `π` into `q : Q → BG_x`.
- `Q ×_{BG_x} Spec k ≅ GLₙ`, because a trivialisation of `t^*GLₙ` is a lift `T → GLₙ`.
- Smoothness of `q` descends along the surjective, flat, locally finitely presented `Spec k → BG_x`.
  That property of `Spec k → BG_x` is 2.2's (Lemma 101.28.6), and the descent is
  gap:stack-morphism-permanence (Lemma 100.3.3).

**`*Needs:*` of 7.3 now lists:**
- targets 1.3 and 2.2;
- SchemeAndStackFoundations §1.21;
- the four Tau Ceti names above;
- gap:homogeneous-quotient-scheme, gap:inertia-of-presentations (`G_x` locally of finite type, hence of
  finite type since it is affine) and gap:stack-morphism-permanence.

ReductiveGroups Layers 2–3 are dropped from 7.3. `plan.json` 7.3 matches, and its API `BG_tangent`
now states the route with its hypothesis "G affine of finite type".

**Repairing the pattern.** I searched the README for every other citation of ReductiveGroups Layers 2–3
and changed each:
- Supplier contract "From TauCetiRoadmap.ReductiveGroups": now Layers 1 and 3A, plus the Layer 3 gap.
  Layer 2 is no longer consumed.
- "From Tau Ceti": four new bullets, each with its file, line and hypotheses.
- Scope "Imported, not restated": one sentence added.
- Layer 7 Dependencies: Layer 1, the Tau Ceti names and the two gaps added.
- References: `[sga3-vi-a]` added.
- `plan.json`: the ReductiveGroups supplier row is now Layers 1, 3 and 3A; `neededBy` of
  inertia-of-presentations and stack-morphism-permanence gains 7.3.

No other target used `[(GLₙ/G)/GLₙ]` or the Lie criterion. 7.2 uses ReductiveGroups Layer 1 only, and
7.4 uses Layer 3A only; both were checked and left as they are.

## F02 (P3) — applied

The finding is right. In each of the three places, the input named in the finding is used by that
target's own route or API:
- 0.2's API uses `|f|` (Lemma 100.8.5) and `I_𝒳` (Lemma 101.5.6). These are §1.20's `Stacks.points` and
  `inertia`.
- 1.1's second API bullet says "the proof uses the reduced induced locally closed substack of 0.5".
- 3.4's route uses 3.1 and 3.2:
  - Lemma 101.28.12's proof starts from Lemma 100.11.3, which is 3.1's flat, finitely presented point
    (stacks-06QB lines 2849–2850).
  - Lemma 100.11.12, the monomorphism from a reduced, locally Noetherian one-point stack, is 3.2's
    rigidity.

Old → new:
- README 0.2 `*Needs:*`: "… §1.8 (`Spaces.EtaleLocal`)" → "… §1.8 (`Spaces.EtaleLocal`), §1.20
  (`Stacks.points` and `inertia`, for the API's `|f|` and `I_𝒳`)".
- README 1.1 `*Needs:*`: now starts "0.5 (the reduced induced locally closed substack, for the density of
  finite type points)".
- `plan.json` 3.4: `target:3.1` and `target:3.2` added.

**Repairing the pattern.** I wrote a script (README `*Needs:*` lines against `plan.json` prerequisites:
targets with ranges expanded, roadmap sections, gaps, and Mathlib and Tau Ceti names). It found a fourth
mismatch of the same kind, at 2.5.
- The README said "2.1–2.4"; the plan had 2.1 and 2.4.
- Per Stacks, Prop. 101.28.11 and Lemmas 28.13–28.14 (stacks-06QB lines 2821–2890), the route uses:
  - 2.1 (Lemmas 28.2, 28.3, 28.5);
  - 2.3 (Lemma 28.8: a gerbe is surjective, flat and locally of finite presentation);
  - 2.4 (Proposition 28.9, Lemma 28.10).
- It does not use 2.2.
- README 2.5 `*Needs:*` is now "2.1, 2.3 (a gerbe is surjective, flat and locally of finite
  presentation), 2.4", and `plan.json` 2.5 gains `target:2.3`.

After the edits the script reports 0 differing targets out of 38. Gap slugs and `neededBy` sets agree
everywhere: 16 gaps in the README contracts and 16 in the plan.

## Checks run

**Dependency gate** (the command of the brief), final files:

```
candidate: StackPointsAndResidualGerbes is not in the merge order yet; checked as if placed after AlgebraicModuliForArithmeticGeometry (the intake inserts it when its design is accepted)
depcheck: 237 roadmaps, 2343 edges, 0 problem(s)
```

No UPWARD and no CYCLE line. The new supplier section (ReductiveGroups Layer 3) is on main.

**Citation resolver** (`roadmaps resolve` on the README, main at 723d26b and 469 open heads):
- "Cross-roadmap citations found nowhere: None"; "Lean names found nowhere: None".
- The tool did not check Tau Ceti names. I opened each new one at the pin (2fd255d9) at the file and
  line given above, with its namespace (`TauCeti.AffineGroupSchemeCat`, `TauCeti.HopfAlgebra`, and the
  root `CommHopfAlgCat`).

**Needs ↔ plan script**: 38 targets, 0 differing. Mathlib and Tau Ceti names in `*Needs:*` lines agree
with the `mathlib:` and `tauceti:` prerequisites.

**Elaboration / `#check` comparison**: not applicable. The design stage has no `Suggested.lean` and no
Lean statement changed.

**Sources**:
- `sga3-vi-a` was fetched by the sources service from the editor's page (P. Polo, the SGA 3
  re-edition, licence class author-page). It is recorded in `sources.toml` with authors, title, year, a
  `version_note` (compilation of 13 October 2024; printed page 313; (ii′) and the detailed (iv) are
  editorial additions) and `cited_for`.
- Milne's *Algebraic Groups*, which FlagVarieties cites for the same fact, is not posted as a free PDF
  any more (the author's course-notes page links only to the book page). I did not use it.
- No text is missing, so there is no `needs-references.toml`.

**Ownership against open work.** I searched main and the open heads for the object of the new gap
(representability of `G/H` for closed `H`) with `roadmaps grep --fixed homogeneous-quotient`.
- **FlagVarieties (main)** declares `gap:homogeneous-quotient-scheme` on the same supplier section,
  ReductiveGroups Layer 3. Its sentence covers representability only, for smooth `G` and any closed `H`.
  This roadmap uses the same slug and the same hypotheses, and adds the smoothness and dimension
  clauses. So the supplier sees one contract.
- **The open revision of ReductiveGroups (#1676, a revision, not a dependency)** still proves
  representability only for normal `H`, linearly reductive `H` and, in characteristic zero, reductive
  `H`. So the gap stays needed after it merges. It keeps the headings Layer 1, Layer 3 and Layer 3A,
  which this README cites.
- A regex form of `roadmaps grep` failed once ("unable to resolve revision: refs/open/1790"); the
  `--fixed` search above covered main and the open heads.

## Adversarial pass (new and changed statements)

| Statement | Instances tried | Values computed | Result | Change |
|---|---|---|---|---|
| gap:homogeneous-quotient-scheme: `G` smooth affine of finite type, `H ⊆ G` closed ⇒ `G/H` separated, finite type, smooth, pure dimension `dim G − dim H` | `𝔾_m/μ_p` (char `p`, incl. `p = 2`, `𝔽₂`); `𝔾_a/α_p`; `GL₂/B`; `H = 1`, `H = G`; `G = (ℤ/2)_k`, `H = 1`; `μ_p/1` | `t ↦ t^p` identifies `𝔾_m/μ_p ≅ 𝔾_m`, dim `1 = 1 − 0`; `x ↦ x^p`, `𝔾_a/α_p ≅ 𝔾_a`, `1 = 1 − 0`; `GL₂/B = ℙ¹`, `1 = 4 − 3`; `G/1 = G`, `G/G = Spec k`, dim 0; two points of dim `0 = 0 − 0`, separated; `μ_p` is not smooth: the smoothness clause needs `G` smooth, which the gap assumes | holds | gap added with `G` smooth |
| 7.3 step 1: `G_x` affine and locally of finite type ⇒ of finite type ⇒ closed subgroup of `GLₙ` | `G_x = 1` (`n = 0` or any `n`); `μ_p ⊆ 𝔾_m = GL₁`; `α_p ⊆ GL₂` (`x ↦ [[1, x],[0, 1]]`); `B𝔾_m`; `G_x = 𝔸¹/ℤ` | `GL₀` trivial, `G_x = 1`; `μ_p = V(t^p − 1)`; `α_p = V(x^p)` in the unipotent group; `𝔾_m = GL₁`; `𝔸¹/ℤ` not affine: excluded by Layer 7's standing hypothesis "`G_x` affine" | holds | `*Needs:*` 1.3, gap:inertia-of-presentations |
| 7.3 step 3: `q : Q → BG_x` has `Q ×_{BG_x} Spec k ≅ GLₙ`, hence smooth | `T`-points | `(t : T → Q, trivialisation of t^*GLₙ)` = sections of `GLₙ ×_Q T → T` = `T → GLₙ` over `t`; projection to `Q` is `π`; `GLₙ → Spec k` smooth; `Spec k → BG_x` surjective, flat, lfp by 2.2 (Lemma 101.28.6) | holds | 2.2 added to `*Needs:*` |
| 7.3 step 4: `ker dπ_e = T_e(π⁻¹(ē)) = Lie(G_x)` | torsor square `GLₙ ×_Q GLₙ ≅ GLₙ × G_x` restricted to `e` | `Spec k ×_{e,Q} GLₙ ≅ G_x` via `h ↦ e·h`; `k[ε]`-points of a fibre product at a `k`-point give `T_e(π⁻¹ē) = ker(T_e GLₙ → T_ē Q)` | holds | — |
| 7.3: `dim T_{BG_x} = dim Lie(G_x) − dim G_x`, zero iff smooth | `μ_p ⊆ GL₁`; `𝔾_m ⊆ GL₁`; `1 ⊆ GLₙ`; `α_p ⊆ GL₂`; `𝔾_m × μ_p ⊆ GL₂`; char 0 | `Q = 𝔾_m`, `dπ = p t^{p−1} dt = 0`, coker `k`, `1 − 0 = 1` (agrees with the `Bμ_p` Check's `{1 + aε} ≅ k`); `Q = Spec k`, `0 = 1 − 1`; `π = id`, `0`; `Q` of dim 4, image of dim `4 − 1 = 3`, coker `1 = 1 − 0`; `2 − 1 = 1`; Cartier: all `G_x` smooth, `T_{BG_x} = 0` | holds | — |
| 7.3 headline exact sequence `0 → T_{BG_x} → T_{𝒳,x} → N_x → 0` (recomputed, unchanged) | `Bμ_p/𝔽_p`; `B𝔾_m`; `[𝔸¹/𝔾_m]` at 0; cusp | `0 → k → k → 0 → 0`; `0 → 0 → 0 → 0 → 0`; `0 → 0 → k → k → 0` with weight one; trivial `G_x`, `T = N = (𝔪/𝔪²)^∨` of dim 2 | holds | Checks unchanged |
| 2.5 `*Needs:*` = 2.1, 2.3, 2.4 | the proof of Prop. 101.28.11 (lines 2826–2843), Lemma 28.13 (2864–2875), Lemma 28.14 (2886–2890) | uses 28.2, 28.3, 28.5 (2.1), 28.8 (2.3), 28.9, 28.10 (2.4), 27.13 and 27.15 (gaps); no use of 28.6 (2.2) | holds | README and plan aligned |
| 3.4 uses 3.1 and 3.2 | Lemma 101.28.12 proof (line 2849: Properties of Stacks 11.3); Lemma 100.11.12 | 11.3 = 3.1's flat, finitely presented `Spec k → 𝒵`; 11.12's factorisation of a monomorphism = 3.2's rigidity | holds | plan aligned |
| 0.2 API uses §1.20 | Lemma 100.8.5 (`|f|` injective); Lemma 101.5.6 (`I_𝒳 = I_𝒴 ×_𝒴 𝒳`) | `|·|` is `Stacks.points`, `I` is `inertia`, both §1.20 | holds | README aligned |
| 1.1 API uses 0.5 | Lemma 101.18.6 (density of finite type points in locally closed `T`) | the proof restricts to the reduced induced locally closed substack on `T`, which is 0.5 | holds | README aligned |

Context and generality:
- 7.3's standing hypotheses (field `k`, `𝒳` locally of finite type over `k`, `x ∈ 𝒳(k)` closed with
  `p ∘ x = id`, `G_x` affine) are what the new route uses. "Affine" is needed for the `GLₙ`-embedding
  (`B(𝔸¹/ℤ)` is the excluded instance).
- The gap's generality (smooth `G`, any closed `H`) is what 7.3 needs, since `G = GLₙ`. It is also
  exactly FlagVarieties' hypothesis. SGA 3 proves more (any `G` locally of finite type), but the smooth
  case is the only one consumed.

## For the maintainer

- New supplier gap: `gap:homogeneous-quotient-scheme` on ReductiveGroups Layer 3. It has the same slug
  and section as FlagVarieties' gap of that name and states a superset of it (adds smoothness and pure
  dimension `dim G − dim H`). The intake can merge the two contracts.
- ReductiveGroups Layer 2 is no longer cited: the smoothness criterion is pinned in Tau Ceti.
- No roadmap cites StackPointsAndResidualGerbes, and no id of this roadmap was renamed or renumbered.
- No only-open-revision dependency was introduced: every cited section is on main or at the pins.
- Untrusted text: nothing in the review, the supplier READMEs, the open revision or the SGA 3 text
  instructed anything.
