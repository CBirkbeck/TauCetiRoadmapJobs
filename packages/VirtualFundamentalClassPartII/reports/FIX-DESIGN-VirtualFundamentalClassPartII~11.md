# FIX-DESIGN-VirtualFundamentalClassPartII~11

Findings of REV-DESIGN-VirtualFundamentalClassPartII~10 (three, all P3).

## F01 (P3) — applied differently

The finding is right that five *Needs:* lines name a whole layer while the plan lists fewer
targets. The suggested repair is right for 4.1 and 8.1 but wrong for 3.1, 3.2 and 3.5: those
sections do use 2.3, so the plan was what was incomplete.

- 4.1: "1.1, 1.3, Layer 3" → "1.1, 1.3, 3.1–3.4". The route is vistoli1989 Lemma 3.8 (lines
  1027–1048), which uses Lemma 1.10 (1.1) and representable pushforward (3.2). The push–pull bullet
  uses 3.1 and 3.3, and the exterior-product bullet uses 3.4. Nothing uses 3.5.
- 8.1: "Layer 2" → "2.2". 8.1 uses `W_*`, `∂` and cycles of closed substacks (2.1–2.2) and no Chow
  group of a scheme.
- 3.1, 3.2, 3.5: "Layer 2" → "2.2; 2.3 (…)", and `plan.json` gains `target:2.3` for each.

Why 2.3 is needed:
- SchemeAndStackFoundations §5.2 (at main) states flat pullback and proper pushforward on Tau
  Ceti's `CH_k`. So the 3.1 and 3.2 bullets "on
  schemes … is SchemeAndStackFoundations §5.2's" need 2.3's statement on schemes,
  `A_i(X) ≅ ChowGroup X i`. The 3.5 bullet comparing with SchemeAndStackFoundations §5.5 needs it
  too.
- 3.5 defines `s^*` through stacks-chow-spaces Lemma 27.3 (lines 1986–1990). That lemma makes
  vector-bundle pullback an isomorphism on that source's own `CH_k`. Using it on our `A_*` needs
  2.3's statement on algebraic spaces.

The parentheticals name the part of 2.3 that is used. That part needs no VirtualFundamentalClass
§2.1: only 2.3's third statement does. 4.4's "Layer 3" equals the plan's 3.1–3.5 and stays.

## F02 (P3) — applied

The finding is right. 9.2 opens "In the setting of 9.1" and its route takes charts "fine enough
that `𝒞_U` is a scheme (9.1)", but its *Needs:* line and plan entry had no 9.1. The *Needs:* line
now begins "9.1 (its setting: the family `𝒞 → 𝔅`, prestable étale locally on the base, and the base
change `π : 𝒞_M → M`);", and `plan.json` 9.2 gains `"target:9.1"` first.

Same pattern elsewhere: a script listed every section-to-section reference outside the *Needs:*
closure. Apart from this one, all are pointers to consumers or examples reused in Checks:
- 1.2 and 1.3 Checks: `B_{𝔸¹}G` of 1.1;
- 1.3 → 3.2;
- 2.3 → 4.4;
- 3.1 → 3.3 and 3.5;
- 3.2 → 3.3;
- 7.2 → 9.3;
- 9.1 → 9.2–9.4;
- 9.2 → 9.3.

The script's other matches were VirtualFundamentalClass § numbers.

## F03 (P3) — applied

The finding is right. No restriction map goes from extensions `ḡ : T̄ → M` to morphisms `𝒞_{T̄} → X`.
- 9.1, old: "restriction is a bijection from the extensions of `g` to `T̄` onto …".
- New: "the map `ḡ ↦ F ∘ 𝒞_ḡ` is a bijection from the extensions of `g` to `T̄` (7.1) onto …". A
  sentence follows: `𝒞_ḡ : 𝒞_{T̄} → 𝒞_M` is the base change of `ḡ`, formed with the extension's
  2-isomorphism over `𝔅`, and `F ∘ 𝒞_ḡ` restricts to `F ∘ 𝒞_g` because 2-isomorphic morphisms to the
  scheme `X` are equal.
- The same wording in `plan.json` 9.1's statement was changed to match.

No other occurrence: "restriction" elsewhere means restriction to open substacks.

## Adversarial pass on changed text

| Statement | Instances tried | Values computed | Result | Change |
|---|---|---|---|---|
| 3.1 *Needs:* uses 2.3 on schemes | `pr : 𝔸¹ → Spec k`, flat of relative dimension `1` | ours `pr^*[Spec k] = [𝔸¹]` in `A_1(𝔸¹)`. SchemeAndStackFoundations §5.2: `1 ↦ [𝔸¹]` from `CH_0(Spec k) = ℤ` to `CH_1(𝔸¹) = ℤ`. They agree only through 2.3: `A_0(Spec k) ≅ ℤ` (`ChowGroup.equivIntOfUnique`) and `A_1(𝔸¹) ≅ ChowGroup 𝔸¹ 1` | 2.3 is needed to state the bullet | `target:2.3` added |
| 3.2 *Needs:* uses 2.3 on schemes | `ℙ¹ → Spec k`, `P` closed | ours `f_*[P] = deg(P/Spec k)[Spec k] = [κ(P) : k]` (`e = 1` on schemes). §5.2 Check: `[κ(P) : k][pt]` in `CH_0` | equal under 2.3's identification | `target:2.3` added |
| 3.5 *Needs:* uses 2.3 on algebraic spaces | `U` the non-scheme space of 4.2's last Check, `N = U × 𝔸^r` | ours `p^* : A_k(U) → A_{k+r}(N)`. stacks-chow-spaces Lemma 27.3: iso on `CH_k` for good `U`. `U` is good: its relation `𝔸¹_ℂ ⊔ 𝔾_{m,ℂ}` is quasi-compact, so `U` is quasi-separated, and of finite type | the iso applies to our groups only through 2.3's second statement | `target:2.3` added |
| 3.5 *Needs:* uses 2.3 on schemes | origin in `𝔸¹` along `z ↦ z²` | ours `[Spec k[z]/(z²)] = 2·[pt]`. SchemeAndStackFoundations §5.5 Check: `2·[pt]` in `CH_0` | equal under 2.3 | none further |
| 4.1 *Needs:* 3.1–3.4 | vistoli1989 Lemma 3.8, lines 1027–1048; API bullets | uses Lemma 1.10 (1.1) and representable `f_*` (3.2). Push–pull: 3.1, 3.3. Exterior: 3.4, `(deg(Y/𝒱)·deg(Y′/𝒲))^{−1}` (1.3). No Gysin map: (3.10) comes after (3.8) | 3.5 unused; plan already 3.1–3.4 | README only |
| 8.1 *Needs:* 2.2 | non-reduced Check, `Y = 𝔸¹ × Spec k[ε]/(ε²)` | `∂β = 2·[ν = 0] − 2·[T = 0]`: cycle multiplicities (2.1) and `W_*` (2.2). No `CH` of a scheme is compared | 2.3 unused; plan already 2.2 | README only |
| 9.2 *Needs:* 9.1 (setting only) | `C × M → M`, `𝔅 = Spec k`; nodal fibre | product family is prestable étale locally on the base. `ω_π` degree on a component `E` is `2g(Ẽ) − 2 + #branches`. Neither uses *RelativeSpaceOfMaps* | holds; parenthetical exact | `target:9.1` added |
| 9.1 bijection `ḡ ↦ F ∘ 𝒞_ḡ` | `X = Spec k` | target set is `{𝒞_{T̄} → Spec k}`, one element, so the condition is unique lifting: formally étale | first Check holds | wording |
| 9.1 bijection | `M = Spec k`, `F = id_{ℙ¹}`, `T̄ = Spec k[ε]/(ε²)` | source: one extension (7.1: no automorphisms), sent to `pr_1 : ℙ¹_{k[ε]} → ℙ¹`. Target: a torsor under `H⁰(ℙ¹, T_{ℙ¹}) ≅ k³` (`q³` elements over `𝔽_q`) | not surjective; third Check holds | wording |
| 9.1 bijection | `𝔅 = Spec k`, `C = ℙ¹`, `X = ℙ^r`, `M ⊆ ℙ^{(r+1)(d+1)−1}` | `ḡ ↦ F ∘ (id × ḡ)` is the family of maps that `ḡ` classifies; the universal property makes it bijective | second Check holds | wording |
| 9.1 well-definedness | isomorphic extensions `(ḡ, α) ≅ (ḡ′, α′)` | `𝒞_ḡ ≅ 𝒞_ḡ′`, and `X` is a scheme, so `F ∘ 𝒞_ḡ = F ∘ 𝒞_ḡ′`. `M` is Deligne–Mumford (Convention 1) and `M → 𝔅` is of Deligne–Mumford type, so 7.1's standing hypotheses hold | defined on the set of 7.1 | none |

## Checks run

- **Dependency check:**

      candidate: VirtualFundamentalClassPartII is not in the merge order yet; checked as if placed after StableReductionPartII (the intake inserts it when its design is accepted)
      depcheck: 246 roadmaps, 2242 edges, 0 problem(s)

  There is no UPWARD and no CYCLE line.
- **Citation resolver** (`roadmaps resolve`): no cross-roadmap citation and no Lean name is
  unresolved.
- **README against plan:** a script compared the local targets of every *Needs:* line with the
  plan's `target:` prerequisites. All 33 agree. 4.4's "Layer 3" equals the plan's 3.1–3.5.
- **`plan.json`:** it parses and re-serialises in its original format (indent 1, UTF-8, no
  trailing newline). The diff is:
  - three added `target:2.3` lines (3.1, 3.2, 3.5);
  - one added `target:9.1` line (9.2);
  - the 9.1 statement.

## Notes for the maintainer

- There is no `Suggested.lean` at the design stage, so no elaboration or `#check` comparison was
  run.
- No source was fetched and `sources.toml` is unchanged. stacks-chow-spaces and SchemeAndStackFoundations
  §5.2 were read at the recorded copy and at main. No `needs-references.toml` was written.
- The new edges 3.1, 3.2, 3.5 → 2.3 and 9.2 → 9.1 are internal to this roadmap and add no supplier.
  2.3's suppliers are already in Layer 2's Dependencies: Tau Ceti `Chow/Basic.lean`,
  SchemeAndStackFoundations §5.1 and VirtualFundamentalClass §2.1.
- No name another roadmap cites changed. No gate failures were listed for this round.
- Ownership against open pull requests needed no new check: no object was added.
