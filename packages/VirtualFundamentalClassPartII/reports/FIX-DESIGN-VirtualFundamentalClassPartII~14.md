# FIX-DESIGN-VirtualFundamentalClassPartII~14

Findings of REV-DESIGN-VirtualFundamentalClassPartII~13: two, both P3.

## F01 (P3) — applied differently

Changed: "smooth quasi-projective `k`-scheme / variety / target" → "scheme smooth over `k`" in 9.1, the
Summary, both Scope bullets, 9.3's last sentence and the plan's 9.1. The witness is a Check of 9.3.
`Mor` exists only where a source or supplier proves it. The 9.1 API on `Mor(C, X)` needs `X`
quasi-projective; 9.5's curve class needs `X` projective.

**Verification.** The finding is right. On the witness `𝔅 = Spec k`, `𝒞 = ℙ¹`, `X = M = L` (line with a
doubled origin), `F = pr₂`:

- `L` is a stack in the sense of Convention 1: a scheme of finite type whose diagonal is a quasi-compact
  immersion.
- For `T̄` affine, the extensions of `g : T → L` form a torsor under `H⁰(T, g^*T_L ⊗ J)`. It is nonempty
  because `L` is smooth. The source is SchemeAndStackFoundations §4.1 `smooth_lifting_torsor`, which
  assumes no separatedness (read at its main text).
- The extensions of `g ∘ pr₂` form a torsor under `H⁰(ℙ¹_T, pr₂^*(g^*T_L ⊗ J)) = H⁰(T, g^*T_L ⊗ J)`,
  because `π_*O = O`. The map `ḡ ↦ ḡ ∘ pr₂` is equivariant, so it is a bijection.
- `E = Ω_L = L_{L/k}` and `φ = id`, since the trace `H¹(ℙ¹, ω) → k` is an isomorphism. `Ob = 0`.
- The class is `[L]` (6.3, first formula). The virtual dimension is `0 + 0 + 1·1 = 1 = dim L`.

Elsewhere, 9.2 does not involve `X`. 9.3 uses `L_X = Ω_X[0]` (DerivedModuleAlgebra §0.12, which is
local) and §4.1. 9.4's ampleness is a hypothesis on `𝒞_M`. A smooth `k`-scheme is locally Noetherian,
hence quasi-separated, so it is an algebraic stack of Convention 7 for VirtualFundamentalClass §3.3.

**Why differently.**

1. *The existence clause.* The review proposed: "for `X` quasi-projective and `𝒞 → 𝔅` projective the
   stack of morphisms exists". This roadmap does not define a projective representable morphism to a
   stack, and no cited source or supplier states existence at that generality. The README now says
   "Where a stack of morphisms exists …" and gives the two proved cases:
   - `X` smooth projective over a stack of prestable curves (behrend1997 lines 129–138);
   - `𝔅 = Spec k` with a fixed projective curve, through the API bullet in item 2.
2. *Same pattern, 9.1's second API bullet.* "An open subscheme of the scheme of morphisms `Mor(C, X)`"
   assumes that `Mor(C, X)` exists, which a general smooth `X` does not give. The bullet now reads: for
   `C` projective and `X` open in a projective `X̄`, every open subscheme of finite type of `Mor(C, X)`.
   - `Mor(C, X̄)` comes from SchemeAndStackFoundations §4.14 (`Hom_S(X, Y)` as an open subscheme of a
     Hilbert scheme; read on main). behrend-fantechi1997 lines 1583–1584 cover projective `X`.
   - `Mor(C, X)` is the complement of the image of `ev^{−1}(X̄ ∖ X)` under the projection, which is
     closed because `C` is proper.
   - "Of finite type" is added because Convention 1 asks it of `M`. For example, `Mor(ℙ¹, ℙ¹)` with all
     its degrees is not of finite type.
   - The Needs line, the Layer 9 Dependencies, the Scope list, the supplier contract and the plan
     (prerequisites, supplier sections) gain §4.14. That section is on main, so no new supplier edge.
3. *Same pattern, 9.5's curve class.* "`δ = c_1(T_X) · β`" used an undefined `β`, and it needs `F_t`
   proper.
   - For the chart inclusion `ℙ¹ → P` (`P` = `ℙ¹` with a doubled point), the image is dense and not
     closed, so `F_*[ℙ¹]` does not exist.
   - Even for separated `X`, a degree on `A_0(X)` needs properness: `[pt] = 0` in `A_0(𝔸²)`.
   - The sentence is now stated for projective `X` (AlgebraicGromovWittenTheory §4.3's setting, read at
     its head), with `β := F_{t*}[C_t]` and `δ = deg(c_1(T_X) ∩ β)` by SchemeAndStackFoundations
     §§3.3, 5.2–5.4.
   - For non-separated `X`, only the fibre degree is defined. A Check (the `P` example) and the plan's
     9.5 statement, prerequisites and test record this.

Other occurrences of "quasi-projective" (README lines on Convention 1 proper covers, 1.1, 5.3, the
StableReductionPartII and EquivariantIntersectionTheory contracts, references) concern other objects and
are unchanged. The manifest's `cited_for` entries of behrend1997 and behrend-fantechi1997 name the new
locators.

## F02 (P3) — applied

Changed: Layer 1 Dependencies "Within the layer, 1.1 and 1.2 precede 1.3." → "Within the layer, 1.2
precedes 1.3, and 1.1 uses neither."

**Verification.**

- 1.3's *Needs:* line and its plan prerequisites name only 1.2.
- vistoli1989's proofs of Lemma 1.16 (lines 382–416) and Proposition 1.17 (lines 433–452) use étale
  charts and the groupoid `R₁ ⇉ U`, with no proper cover.
- The witness: `deg(Spec k/BG) = (|G|/1)·[k : k] = |G|` uses only 1.2's `e(BG) = |G|` and `k(BG) = k`.
- 1.3's Checks reuse the example `L → B_{𝔸¹}G` built in a Check of 1.1. That is an example, not a
  dependency of a statement.

**Same pattern.** I compared the other eight "Within the layer" lines with the plan's `target:`
prerequisites:

- 2.1 → 2.2 → 2.3;
- 3.1 and 3.2 before 3.3, and 3.4 and 3.5 after 3.1–3.3;
- 4.1 → 4.4;
- 5.1 → 5.3 and 5.2 → 5.4;
- 6.1 → 6.3;
- 7.1 → 7.2;
- 8.1 → 8.2 → 8.3 and 8.2 → 8.4;
- 9.1 → 9.5, where 9.5 needs 9.4 because `rk E` is defined through a global resolution (Convention 6).

All agree. The plan has no layer-level order field, so it is unchanged.

## Adversarial pass on the changed text

| Statement | Instances tried | Values computed | Result | Change |
|---|---|---|---|---|
| 9.1, `X` not separated | `X = M = L`, `𝒞 = ℙ¹`, `F = pr₂`, `T̄` affine | both extension sets are torsors under `H⁰(T, g^*T_L ⊗ J)`; equivariant bijection | relative space of maps | `X` generalised |
| 9.1, `X` not quasi-compact | `X = ⊔_ℕ Spec k`, `M = pt`, `F` constant at `n₀` | `X` étale: 1 extension on each side; `E = 0 = L_{pt/k}` | holds | none |
| 9.1, 2-isomorphisms | any scheme `X` | `Hom(−, X)` is a set-valued sheaf, so 2-isomorphic maps are equal | holds; an algebraic space would also do, not claimed | none |
| 9.1 API, `Mor(C, X)` for quasi-projective `X` | `C = ℙ¹`, `X = 𝔸¹ ⊂ ℙ¹` | degree `d ≥ 1` maps hit `∞` and are excluded; degree `0`: `ℙ¹ ∖ {const ∞} = 𝔸¹`; `Ob = H¹(O) = 0`, vd `0 + 1·1 = 1 = dim 𝔸¹` | holds | `X` quasi-projective, §4.14 |
| 9.1 API, finite type | `Mor(ℙ¹, ℙ¹)`, all degrees | one component of dimension `2d + 1` for each degree `d ≥ 0`, so not quasi-compact | not a Convention 1 stack | "of finite type" added |
| 9.1, existence over a stack | behrend1997 lines 129–138 | `V` smooth projective, `Mor_{M(τ)}(τ, V)` algebraic and representable over `M(τ)` | matches the clause | clause stated there only |
| 9.3, `X = L` | the witness above | `Rπ_*pr₂^*T_L = T_L ⊗ RΓ(ℙ¹, O) = T_L`, `E = Ω_L`, `e = id`, `tr` iso, `φ = id`, `Ob = 0`, class `[L]` | holds | Check added |
| 9.3, non-separated target of positive degree | `P` = `ℙ¹` with doubled point, `C = ℙ¹`, `M = PGL₂ ⊔ PGL₂` | `F^*T_P = O(2)`, `H¹ = 0`, `rk E = 3 = dim M` | holds | none |
| 9.3 route, smoothness | SchemeAndStackFoundations §4.1 `smooth_lifting_torsor` | hypothesis "`f` smooth" only; obstruction in `H¹`, torsor under `Hom(a^*Ω, I)` | no separatedness needed | none |
| 9.5 curve class, projective | lines in `ℙ²`, `g = 0`, `n = 0` | `c_1(T) = 3h`, `β = [line]`, `c_1·β = 3`, `δ = deg(O(1)³/O) = 3`; `(1)(2 − 3) + 0 + 3 = 2` | holds | none |
| 9.5 curve class, non-separated | chart inclusion `F : ℙ¹ → P` | image dense, not closed, so `F` is not proper; `δ = χ(O(2)) − χ(O) = 3 − 1 = 2`; vd `0 + 2 + 1 = 3 = h⁰(O(2))` | `β` undefined, `δ` defined | Check added; "for `X` projective" |
| 9.5 curve class, separated non-proper | `X = 𝔸²`, `[pt]` | `[pt] = 0 ∈ A_0(𝔸²)` but `deg[pt] = 1` | no degree on `A_0(X)`, so the number needs properness | stated for projective `X` |
| 9.5 arithmetic | `b = 3g − 3 + n` | `3g − 3 + n + δ + (1 − g)dim X = (1 − g)(dim X − 3) + n + δ` | holds | none |
| Convention 7 for `X` | smooth `k`-scheme, not quasi-compact | locally Noetherian, so affine overlaps are quasi-compact: quasi-separated, locally of finite type | algebraic stack of Convention 7 | none |
| 1.3 needs (F02) | `Spec k → BG`; `L → B_{𝔸¹}G`; proofs at vistoli1989 lines 382–452 | `|G|` and `2` from `e` and `k(−)` of 1.2; no proper cover | 1.1 not used | order line fixed |
| Other order lines (F02) | the eight lines against the plan's `target:` lists | listed in F02 above | agree | none |

## Checks run

- Dependency check:

      candidate: VirtualFundamentalClassPartII is not in the merge order yet; checked as if placed after StableReductionPartII (the intake inserts it when its design is accepted)
      depcheck: 239 roadmaps, 2244 edges, 0 problem(s)

  There is no UPWARD and no CYCLE line.
- Citation resolver on the README: "Cross-roadmap citations found nowhere: None. Lean names found nowhere:
  None."
- `plan.json` parses. `sources.toml` parses as TOML, and its 14 keys are unchanged.
- This is a design and has no `Suggested.lean`, so there was no elaboration and no `#check` comparison.

## Notes for the maintainer

- No id that another roadmap cites changed. Section numbers, target names and the gaps are unchanged.
- **Consumers.** AlgebraicGromovWittenTheory §§4.1–4.3 (smooth projective target, characteristic zero,
  checked at its head) remain special cases.
- **Supplier sections.** SchemeAndStackFoundations §4.14 and §§5.2–5.4 are new for Layer 9, for the
  `Mor(C, X)` API and the curve class. SchemeAndStackFoundations is on main and already a supplier.
- **Ownership.** No new object is owned here. Hom schemes stay with SchemeAndStackFoundations §4.14, and
  ownership against open pull requests is as before.
- **Sources.** No source was fetched and no `needs-references.toml` was written.
