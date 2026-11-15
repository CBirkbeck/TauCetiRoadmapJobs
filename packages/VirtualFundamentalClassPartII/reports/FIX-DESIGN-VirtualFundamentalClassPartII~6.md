# FIX-DESIGN-VirtualFundamentalClassPartII~6

This round settles the five findings of `REV-DESIGN-VirtualFundamentalClassPartII~5`, all P3. I checked
each one against:
- vistoli1989 and kresch1999b in the sources cache;
- the supplier VirtualFundamentalClass at its open head (`roadmaps show VirtualFundamentalClass`): its
  Conventions and §1.5;
- SchemeAndStackFoundations on main: §1.19 `IsAlgebraicStack` and §5.5 `excess_intersection`;
- the README's own *Needs:* and Dependencies lines.

All five findings are correct. Four are applied as asked. F03 is applied differently: the review put
the quasi-separatedness rule in Convention 7, but that convention covers only Layers 6–8, so the rule
goes in Convention 1 instead.

Files changed:
- `packages/VirtualFundamentalClassPartII/design/README.md`
- `packages/VirtualFundamentalClassPartII/design/plan.json`
- `packages/VirtualFundamentalClassPartII/sources.toml` (the vistoli1989 entry only)

This is a design, so there is no `Suggested.lean`, and no Lean name was added or removed.

## REV-DESIGN-VirtualFundamentalClassPartII~5/F01 (P3) — applied

The finding is right. In 8.4, `η_b : 𝔐 × {b} → 𝔐 × B` is the Gysin map. The pushforward `X → B` is not
a morphism over `𝔐 × B`, because `B` does not map to `𝔐 × B`. Also, `X → 𝔐 × B` need not be proper: for
`𝔐 = B𝔾_m` and `X = B`, the map `B → B𝔾_m × B` is a `𝔾_m`-torsor. So 4.2's commutation with proper
pushforward over the target of `η_b` does not cover this step.

Changes:
- **3.5, new API bullet.** Let `𝒢_1 → 𝒢` be flat. The base change `f_1 : ℱ ×_𝒢 𝒢_1 → 𝒢_1` is a regular
  local immersion of codimension `c`, and its normal bundle is the pullback of `N_{ℱ/𝒢}`
  (gap:normal-cones-of-local-immersions, flat case). Then `f_1^! = f^!` for every `Y → 𝒢_1`.
- **3.5, new Check.** It tests the bullet on one flat and one non-flat base change.
- **4.2, two API changes.**
  - The commutation bullet now says "of stacks over `𝒢`".
  - New bullet: `f_1^! = f^!` on `A_*(𝒢′)_ℚ`, and hence `f^! p_* = p′_* f_1^!` when `𝒢″ → 𝒢` factors
    through `𝒢_1`.
- **8.4 route.** It now runs through `i_b : {b} → B` with `η_b^! = i_b^!` and `i_b^![B] = [{b}]`.
- **plan.json.**
  - New API entries `refinedGysin.flatBaseChange` and `stackGysin.flatBaseChange`.
  - New test `flatBaseChange_needsFlat`.
  - The 3.5 and 4.2 statements now say "unchanged by flat base change of f".
  - `stackGysin.properPushforward` now says "over G".

Why the new bullet is true: `ℱ_1 ×_{𝒢_1} Y = ℱ ×_𝒢 Y`, so for every `T` the two definitions use the
same `U`, the same `C_{U/T}` and the same `N|_U`. On schemes this is the zero-excess case of
SchemeAndStackFoundations §5.5 `excess_intersection` (Fulton Theorem 6.3).

Pattern search: I looked at every other Gysin-then-pushforward step.
- 5.1, the projection-formula route: `id × g` is over `ℳ × ℳ`.
- 4.3, the self-intersection formula.
- 8.2 and 8.3.
- The Checks of 6.3 and 8.2.

All of these are over the Gysin target, so 8.4 was the only case.

## REV-DESIGN-VirtualFundamentalClassPartII~5/F02 (P3) — applied

The finding is right. Here is the witness, recomputed. Let `char k ≠ 2` and let `π : E′ → E` be an
étale isogeny of degree 2. Then `ker π̂` is étale of order 2, hence constant, so its nonzero point `P`
lies in `E(k)`.
- `π^*([P] − [O])` has degree 0. Its group-law sum is `2Q` for a point `Q` over `P`.
- `2Q = π̂(π(Q)) = π̂(P) = O`, so `π^*([P] − [O]) = 0` in `A_0(E′)`.
- `[P] − [O] ≠ 0` in `A_0(E)`, because `P ≠ O`.

The source supports the repair:
- vistoli1989 Lemma 4.6, lines 1458–1464: a canonical `β` in `W_*`, and part (ii) at lines 1461–1462
  says `β` commutes with étale pullback.
- The proof of Lemma 3.16, lines 1507–1545, glues `β` from étale charts using the sheaf `W_*`.

Changes:
- **3.5 route.** Old: "étale descent of cycles and rational equivalences (2.1–2.2), the normal cones
  and the classes `(ℱ · T)` being étale local". New: the rational equivalence itself is descended as
  an element of `W_*` (Lemma 4.6 (ii); proof of Lemma 3.16). The new text also says that descent of
  classes alone does not suffice.
- **3.1, new Check.** It records the isogeny witness: pullback is injective on cycles but not on
  integral Chow groups.
- **plan.json.** 3.5's locator now cites Lemmas 3.14 and 4.6 (ii) and lines 1507–1545. There is a new
  3.1 test, `etaleIsogeny_notInjective`.
- **sources.toml.** The vistoli1989 entry has these new locators.

## REV-DESIGN-VirtualFundamentalClassPartII~5/F03 (P3) — applied differently

The rule has to cover every layer, including 3.5, 4.2 and 9.1, but Convention 7 covers only
Layers 6–8. So the rule goes in Convention 1 instead.

The finding is right, on two counts:
- SchemeAndStackFoundations §1.19 `IsAlgebraicStack` does not include quasi-separatedness.
- `Bℤ` is a Deligne–Mumford algebraic stack, locally of finite type, of pure dimension 0, with
  `Spec k → Bℤ` étale. Its diagonal has fibre `ℤ`, so it is not quasi-compact.

So the old 9.1 admitted `Bℤ`, and 9.4's use of 6.2 needs Convention 7. VirtualFundamentalClass's
Conventions read "Use quasi-separated algebraic stacks as in Behrend–Fantechi §1". kresch1999b
(line 192) uses Artin's algebraic stacks.

Changes:
- **Convention 1.** New rule: every algebraic stack of the roadmap is quasi-separated over `k`. `Bℤ` is
  now named as excluded, and as no base of 9.1.
- **Explicit hypotheses** in 9.1, the Layer 7 header, 8.1 (`Y`, `𝔅`, `𝔐`) and 8.4 (`𝔐`).

The same pattern turned up in two more places:
- 8.4's `𝔐` also lacked "locally of finite type", which 8.2 needs for `𝔐 × B`. It now has it.
- plan.json 6.2's hypothesis lacked quasi-separatedness. It now has it.

plan.json changes:
- Hypotheses of 6.2, 8.1, 8.4 and 9.1.
- Statements of 8.1, 8.4 and 9.1.

## REV-DESIGN-VirtualFundamentalClassPartII~5/F04 (P3) — applied

Both claims are confirmed:
- 2.1's *Needs:* cites VirtualFundamentalClass §0.2, but the Layer 2 Dependencies did not.
- 3.2's text uses gap:closed-substacks-of-stacks for the image, but its *Needs:* did not list it.

Changes:
- Layer 2 Dependencies: "VirtualFundamentalClass §2.1" → "VirtualFundamentalClass §§0.2, 2.1".
- 3.2 *Needs:* now includes gap:closed-substacks-of-stacks. plan.json already listed it.

Pattern check, by script over all 33 targets:
- Every `gap:` named in a target's body now appears in that target's *Needs:*. Only 3.2 had been
  missing one.
- Every layer's Dependencies line contains the union of its *Needs:* lines.

## REV-DESIGN-VirtualFundamentalClassPartII~5/F05 (P3) — applied

The finding is right. vistoli1989 lines 529–535 state only the closed embedding of cones under base
change. The flat isomorphism is Lemma 3.14 (lines 1126–1131), which covers local embeddings of
schemes. VirtualFundamentalClass §1.5 does prove flat base change, but only for representable closed
immersions.

Change, made in the README gap paragraph and in plan.json `gaps[1].detail`:
- Old: "an isomorphism when `Y′ → Y` is flat (vistoli1989 lines 529–535)".
- New: "(vistoli1989 lines 529–535)" for the embedding; "an isomorphism when `Y′ → Y` is flat (on the
  charts `U → V`, the flat base change of normal cones of closed immersions of VirtualFundamentalClass
  §1.5, descended; vistoli1989 Lemma 3.14, lines 1126–1131, for local embeddings of schemes)".

The `needs` sentence is unchanged. sources.toml now lists Lemma 3.14 for vistoli1989.

## Adversarial table

| Statement | Instances tried | Values computed | Result | Change |
|---|---|---|---|---|
| 3.5 flat base change `f_1^! = f^!` | `𝒢_1 = 𝒢`; `f = Spec k → BG`, `𝒢_1 = Spec k` (étale); `{0} → 𝔸¹` along `𝔸² → 𝔸¹`, `Y = 𝔸¹ ∋ t ↦ (t², t)`; same `f` along the closed point (not flat) | identical; `[G]` both sides; `2·[pt]` both sides (`U = Spec k[t]/(t²)`); `id^![pt] = [pt] ∈ A_0` against `f^![pt] = c_1(O) ∩ [pt] ∈ A_{−1}(pt) = 0` | holds when flat; fails without flatness | flatness in the bullet; non-flat case is a Check |
| 4.2 flat base change, and `f^! p_* = p′_* f_1^!` | `𝔐 = B𝔾_m`, `B = 𝔸¹`, `b = 0`, `X = 𝔸¹` via the trivial torsor | `η_0^![X]`: fibre product `{0} ×_{𝔸¹} 𝔸¹ = pt`, class `[pt]`; `i_0^![𝔸¹] = [pt]` | holds | API bullet |
| 8.4 route | conic Check: `s = x² − b y²`, `X → 𝔸¹` finite of degree 2 | `n = 2`; `b = 0`: `i_0^!(2[𝔸¹]) = 2[pt]`, `X_0 = Spec k[x]/(x²)` of length 2; `b` not a square: `[κ(b)(√b) : κ(b)] = 2`; `i_b^![B] = [Spec κ(b)]` of `κ(b)`-degree 1 | `2` in every case | route via `i_b` |
| 3.1 isogeny Check | degree-2 étale isogeny, `char k ≠ 2` | `π^*([P] − [O]) ↦ 2Q = π̂(P) = O`; `[P] − [O] ≠ 0`; `π_*π^* = 2` and `2([P] − [O]) = 0` | integral pullback not injective; rational pullback injective | new Check |
| 3.5 descent of `β` | Lemma 4.6 (ii) at lines 1461–1462; proof of 3.16 at lines 1507–1545 | `q_1^*β = q_2^*β` on `Y′ ×_Y Y′`; for a scheme, `W_*` is a sheaf (lines 953–957) | descends as an element, not as a class | route rewritten |
| Convention 1, quasi-separated | `Bℤ`; `B𝔾_m`; line with doubled origin; `pt ⊔ ⊔_ℕ pt` (8.3 Check); node; `Y = 𝔸¹ × Spec k[ε]/(ε²)` | fibre `ℤ`, not quasi-compact (excluded); diagonal `𝔾_m`, affine (included); chart overlap `𝔾_m`, quasi-compact (included); diagonal a closed immersion (included); affine; affine | every positive example in the README stays admitted | rule plus `Bℤ` witness |
| 9.1 base | `𝔅 = Spec k`, `b = 0`; `𝔅 = Bℤ` with étale `M = Spec k`; prestable-curve stack | admitted; excluded (diagonal not quasi-compact); admitted, with LMB-algebraic stacks (behrend1997) | holds | hypothesis |
| Layer 7 header | `Spec k → B𝔾_m` (7.1 third Check) | `B𝔾_m` quasi-separated; torsor `1 + J ≅ J` unchanged | holds | hypothesis |
| 8.4 `𝔐` | `Spec k` (`m = 0`); `B𝔾_m` (`m = −1`, `r = 1`) | both locally of finite type and quasi-separated; `𝔐 × B` pure of dimension `m + 1`, as 8.2 needs | holds | hypothesis |
| Gap, flat case | `{0} → 𝔸¹` along the flat `𝔸² → 𝔸¹`; along the non-flat `{0} → 𝔸¹`; `Δ : BG → BG × BG` | `C_{X′/Y′} = N` over `{x = 0}`, equal to the base change; `C_{pt/pt} = pt ⊊ 𝔸¹`, an embedding that is not an isomorphism; rank 0 (unchanged) | holds; flat case located at Lemma 3.14 | locator |
| Layer 2 Dependencies | union of the *Needs:* of 2.1–2.3 | adds VirtualFundamentalClass §0.2 | now equal | edit |
| 3.2 *Needs:* | gaps named in the body | `gap:closed-substacks-of-stacks` was in the body, not in *Needs:* | now listed | edit |

## Checks run

**Dependency check** (command from the brief):

    candidate: VirtualFundamentalClassPartII is not in the merge order yet; checked as if placed after StableReductionPartII (the intake inserts it when its design is accepted)
    depcheck: 245 roadmaps, 2230 edges, 0 problem(s)

There are no UPWARD or CYCLE lines.

**Citations** (`roadmaps resolve` on the README):
- Cross-roadmap citations found nowhere: none.
- Lean names found nowhere: none.

**Other checks:**
- plan.json parses: 33 targets, 127 tests, at least 3 tests per target. sources.toml parses: 14 sources,
  no new key.
- The README has no LaTeX delimiters, no `lemma`, no process words and no machine paths (grep).
- No source was fetched, and `needs-references.toml` was not created: every new locator is in
  vistoli1989, which is already cached.
- No `Suggested.lean` exists at this stage, so no `#check` elaboration was run.

## For the maintainer

- **Ownership.** No new construction was introduced. The flat-base-change bullets are API of this
  roadmap's own 3.5 and 4.2.
- **Gap contract.** The two declared gaps on VirtualFundamentalClass (§2.1, §1.5) are unchanged in
  slug, `needs` and `neededBy`. Only the locator in the §1.5 gap's `detail` changed.
- **Names other roadmaps cite.** None changed: no section was renumbered or renamed.
- **Effect on consumers.** Every algebraic stack of this roadmap must now be quasi-separated, and that
  is a standing hypothesis. AlgebraicGromovWittenTheory, the only consumer, uses the prestable-curve
  stack, which is quasi-separated.
- **Ownership against open pull requests** was checked only through the tools in the brief
  (`roadmaps resolve`, `scratch/overlaps.md`). Neither listed anything new.
