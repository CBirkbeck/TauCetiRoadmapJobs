# Repair dispositions

Two reviews were settled. Review r2a (verdict accepted) raises no finding; its round-one verification table and source-issue register need no edit. Review r2b raises four findings, F01 (P2) and F02–F04 (P3), each settled below. No finding overlaps between the reviews. No review text asked for anything outside this job.

## F01 (P2) — applied

**Review r2b.** `scaledLegendre_minus_one_trace_zero` (L(u,−1), u∈F) → `symmetric_cubic_trace_zero` (native `⟨0,0,0,a,0⟩`, every a∈F), same binders `[Field F] [Fintype F] (hF : Fintype.card F % 4 = 3)`. §5.1 now defines the symmetric cubic y²=x³+a·x, states the general count and trace, and keeps L(u,−1) as the case a=−u². New Check: 𝔽₇, a=1.

Evidence: q≡3 mod4 makes q odd and −1 a nonsquare (Mathlib `quadraticChar_neg_one`, QuadraticChar/Basic.lean); f(x)=x³+ax satisfies f(−x)=−f(x), so the §5.1 character sum cancels in pairs ±x and vanishes at x=0, for every a. The proof never used the Legendre shape. Since −1 is a nonsquare, a=−u² reaches exactly the a with −a square, half the nonzero a. Brute force over 𝔽₃, 𝔽₇, 𝔽₁₁, 𝔽₁₉, 𝔽₂₃, 𝔽₂₇: every a gives count q+1 (3/3, 7/7, 11/11, 19/19, 23/23, 27/27). Controls with q≡1 mod4: 1/5, 5/9, 1/13, 1/25, 25/49, 1/125. At a=0 the cusp also has trace 0 by Tau Ceti `WeierstrassCurve.frobeniusTrace_eq_zero_of_c₄_eq_zero` (TauCeti/AlgebraicGeometry/EllipticCurve/SingularPointCount.lean:247; `[Field F] [Finite F]`, Δ=0, c₄=0). This is now cited in the supplier contracts and in the §5.1 route and *Needs*. That lemma covers a=0 only, so the general theorem is not a one-tactic consequence of the library.

Same pattern elsewhere: the Layer 5 Examples, the §5.1 *Needs* ("Legendre specialization") and the BS20 reference line (lines 462–464 are the Legendre instance). The ErdosProgressionPowers §2.1 request for "LG.5's symmetric-cubic trace-zero theorem" is its case a=−(n/g)². No headline in Layers 0–4 rests on a Legendre-only argument that its proof does not use: §3.7 needs L(−1) through the descent tuples.

## F02 (P3) — applied

**Review r2b.** §0.2 Check: "(x,y)↦(4²x,4³y)" → "change with u=1/4 (x_old=x_new/16 …; points go to (16x,64y)) … that is L(16,3); u=4 gives (−1/4,3/256)", plus "root scaling by the square 4 is the change with u=1/2". §1.2 Check: "(x,y)↦(3²x,3³y)" → "change with u=1/3 …; u=3 would give a₄=−1/81".

Evidence: the pinned `smul` (Mathlib/AlgebraicGeometry/EllipticCurve/VariableChange.lean:126–132) multiplies a₂ by u⁻² and a₄ by u⁻⁴. Exact arithmetic gives the following. u=1/4 on L(3) gives (−64,768)=L(16,3) and u=4 gives (−1/4,3/256). u=1/2 gives (−16,48)=L(4,3). u=1/3 on L(−1) gives a₄=−81 with Δ=34012224=64·3¹², and u=3 gives a₄=−1/81. Same pattern in the §0.5 Check (powers d², d⁶): it now names the change u=1/d, which gives L(d²,λ) with Δ=2359296 and c₄=1792 at d=2, λ=3.

## F03 (P3) — applied differently

**Review r2b.** Purpose sentences repaired at the five cited places (§§0.6, 0.8, 0.10, 1.1, 1.3), plus the same defect in §§0.4, 0.5, 0.10 (second bullet), 1.2, 1.4, 1.5, 2.1 (two bullets), 2.5, 2.7 and 3.6 (two bullets). §1.1 gains the b>0 instance λ=−2: (0,1,−2). Two of the suggested sentences were replaced, for the reasons below.

Evidence for the two different wordings:
- **§1.3 (:297).** The suggested sentence "so the odd-prime hypothesis is needed" is false. In 𝔽₂, λ̄=1 forces 1−λ̄=0, so v₂(λ)=v₂(1−λ)=0 never holds and the statement is vacuous at p=2. The Check now says exactly that and notes that 16 | Δ.
- **§0.8 (:200).** The suggested "would need √d" is incomplete. Reordering the roots to (5,9,3) gives d=4, λ=−1/2, and the change u=2, r=5 sends y²=(x−3)(x−5)(x−9) to L(−1/2) over ℚ: by pinned `smul`, the coefficients go from (−17,87,−135) to (−1/2,−1/2,0). L(2,3) itself is not ℚ-isomorphic to L(3), because Δ ratio 2⁶ is not a twelfth power. The Check states both facts.

Values behind the other new sentences:
- §1.5: L(3) at 3 has v₃(Δ)=2<12 and c₄=112 a unit, so it is minimal and multiplicative there.
- §2.5: 2·(2,4)=(0,0) on L(−1)/𝔽₅.
- §3.6: the point orders on L(−1) are {1,2,4} over 𝔽₁₃ and {1,2,4,8} over 𝔽₄₁, where (6,13) has order 8.

## F04 (P3) — applied

**Review r2b.** §0.8: "Hence W is a quadratic twist of L(λ) in the precise native coefficient sense" → "Hence C•W is the native quadratic twist of L(λ) with parameters (0,−d/4), so W is K-isomorphic to a quadratic twist of L(λ); here d≠0 and λ≠0,1."

Evidence: at roots (3,5,9), W=(0,−17,0,87,−135) differs from L(2,3)=(0,−8,0,12,0), and pinned `smul` with r=3 gives exactly L(2,3). Other "twist" sentences were checked and are already correct: §0.2 (L(d,λ) is the twist), Conventions, §0.8's route paragraph and §1.2.

## Checks run

- **Elaboration.** `lake env lean packages/EllipticLegendreCharacterInterfaces/Suggested.lean` run from the content checkout. Output: seven `declaration uses 'sorry'` warnings, at lines 31, 42, 55, 67, 76, 86 and 94. No errors.
- **Signatures.** A scratch copy of the file with `#check @…` for all nine declarations was elaborated once. Eight types are identical to the supplied signatures. The new one is `symmetric_cubic_trace_zero : ∀ {F} [Field F] [Fintype F], Fintype.card F % 4 = 3 → ∀ (a : F), { a₁ := 0, a₂ := 0, a₃ := 0, a₄ := a, a₆ := 0 }.pointCount = Fintype.card F + 1 ∧ … .frobeniusTrace = 0`. This matches README §5.1: a sits in a₄, and there are no section variables, so no binder can be lost.
- **Dependency gate** (`gate --depcheck … --movable`): `depcheck: 52 roadmaps, 585 edges, 0 problem(s)`, exit 0. There is no UPWARD, CYCLE or moved line.
- **Citations** (`roadmaps resolve`): none found nowhere, for both cross-roadmap citations and Lean names. Lean names outside this roadmap were checked by hand at the pins: the one new library name is `WeierstrassCurve.frobeniusTrace_eq_zero_of_c₄_eq_zero` in Tau Ceti SingularPointCount.lean:247.
- **Gaps.** `design/plan.json` `gaps` is unchanged (empty). No supplier gap is needed.

## Adversarial pass on changed statements

| Statement | Instances | Values computed | Result | Change |
|---|---|---|---|---|
| `symmetric_cubic_trace_zero` | q=3,7,11,19,23,27, all a; q=5,9,13,25,49,125 controls; a=0 | 3/3,7/7,11/11,19/19,23/23,27/27 have count q+1. Controls: 1/5,5/9,1/13,1/25,25/49,1/125. 𝔽₇,a=1: roots (1,2,0,2,0,2,0), count 8. 𝔽₅,a=1: count 4, trace 2. 𝔽₃,a=1: roots (1,0,2), count 4. a=0: cusp, trace 0 | true; hypothesis q≡3 mod4 necessary | new headline |
| §5.1 Legendre case a=−u² | 𝔽₃,u=1 (a=−1); 𝔽₇,u=2 (a=3); 𝔽₃,u=0 | roots (1,1,1), count 4; χ values (0,1,0,1,−1,0,−1), count 8; affine counts (1,2,0), count 4 | consistent with headline | wording |
| §0.2 dilation Check | u=1/4, 4, 1/2 on L(3) | (−64,768)=L(16,3); (−1/4,3/256); (−16,48)=L(4,3) | true | F02 |
| §1.2 dilation Check | u=1/3, 3 on L(−1) | a₄=−81 with Δ=64·3¹² and v₃=12; a₄=−1/81 | true | F02 |
| §0.5 power Check | d=2,λ=3; u=1/2 on L(3) | Δ,c₄ = 36864=2⁶·576, 448=2²·112; wrong weights give 2359296, 1792 | true | pattern |
| §0.8 twist sentence | roots (3,5,9) | r=3: (−17,87,−135)→(−8,12,0)=L(2,3)≠W | true | F04 |
| §0.8 ordering Check | orderings (3,5,9),(5,9,3) | Δ(L(2,3))/Δ(L(3))=36864/576=2⁶. u=2,r=5 gives (−1/2,−1/2,0)=L(−1/2), with Δ=9=36864/2¹² | true | F03 |
| §0.10 sum Check | L(3) and O-substituted tuple | T₀+T₁+T₃=O; O+T₀+T₁=T₃≠O | true | F03 |
| §1.1 Checks | p=3: λ=3,1/3,−2,−1; p=2: λ=2 | (1,0,−2),(−1,−1,−2),(0,1,−2),(0,0,3); (1,0,6) | match −2a, 2a, −2b | F03 |
| §1.3 dyadic Check | 𝔽₂ | λ̄∈{0,1} ⇒ λ̄(1−λ̄)=0; v₂(16)=4 | vacuous at 2 | F03 |
| §1.4 λ=3 Check | ωλ=3,−3,6,−6 | conductors 12,3,24,24; v₃(j)=−2 | true | F03 |
| §1.5 λ=3 Check | L(3) at p=3 | v₃(Δ)=v₃(576)=2, v₃(c₄)=v₃(112)=0 ⇒ minimal multiplicative, v₃(M)=1 | true | F03 |
| §2.1 root Checks | (1,−1), (2,1/2) | roots (0,1,−1), (0,2,1) | true | F03 |
| §2.5 (2,4) Check | L(−1)/𝔽₅ | reps (2,1,3), [2] nonsquare, 2P=(0,0) | true | F03 |
| §3.6 Checks | L(−1) over 𝔽₅, 𝔽₁₃, 𝔽₄₁ | counts 8, 8, 32; orders {1,2,4}, {1,2,4}, {1,2,4,8}; (6,13) has order 8 | true | F03 |

Field models used: 𝔽₉=𝔽₃[z]/(z²+1), 𝔽₂₇=𝔽₃[z]/(z³+2z+2), 𝔽₂₅=𝔽₅[z]/(z²+2), 𝔽₄₉=𝔽₇[z]/(z²+1), 𝔽₁₂₅=𝔽₅[z]/(z³+z+1). Each was checked to be a field by inverting every nonzero element.

## Ownership and sources

`roadmaps grep` over main and the 363 open heads, plus the board and sibling checkouts, finds no other roadmap stating trace zero for y²=x³+ax at q≡3 mod4. The nearest objects, CM and supersingularity statements in ComplexMultiplicationAndExplicitReciprocity and ModularCurvesPartII, are at merge-order positions 184 and later or concern other statements. Ownership therefore stays here, in §5.1.

No source was added. K84 and S09 stay uncertified and are cited by locator, and no `needs-references.toml` was written.

## For the maintainer

- **Renamed Lean name.** `scaledLegendre_minus_one_trace_zero` is now `symmetric_cubic_trace_zero`. No roadmap on main or at an open head cites the old name: `roadmaps grep` finds no match.
- **Old name in design files.** `design/plan.json` (outside its `gaps` list) and `design/README.md` still use the old name. This job may not edit them.
- **ErdosProgressionPowers.** Its LG.5 request is met by the case a=−(n/g)².
