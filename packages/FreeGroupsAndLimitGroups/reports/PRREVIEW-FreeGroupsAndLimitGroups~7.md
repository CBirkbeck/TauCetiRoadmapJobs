# Review of FreeGroupsAndLimitGroups (pull request #2221 at e193732)

**Verdict:** accepted

No finding at this head.

## Previous findings

- R01 — repaired: #2205's head `d31b59b` is an ancestor of this head. README:903 "§1.3, p. 18 (`(𝒜, ℋ)`-trees), and §1.4.2, p. 19 (domination, deformation spaces)"; :494 "the set of labels itself can change"; §4.11 has five Checks; :1782 `Ω_K`.
- R02 — repaired: README:1265 "[ALG] §3.1, Theorem 3, p. 32, and §3.2, Lemma 10, p. 34"; :1648, :1661, :2165, :2190 "Form 2, p. 29"; :1868 "[IFT] §3, Definition 7, p. 10, and §3.1, Lemma 3, p. 11".
- R03 — repaired: README:793 "for `ℤ` mapped trivially to a nontrivial `A` and identically onto `B = ℤ`, the pushout is `A` and `B` maps to 1. They need not fail: … Injectivity is imposed by the definition".
- R04 — repaired: `Suggested.lean:57–58` `rank_coprod … [Group.FG (Monoid.Coprod G H)] :`, docstring "finitely generated groups"; README:1016 "For finitely generated `G₁`, `G₂`"; :1021 "FOLD Theorem 6.2, stated there for nontrivial factors".
- R05 — repaired: the description reads "#2205's head `d31b59b` is merged into this branch", "contains all of #2205 at `d31b59b`", carries item 13 (§4.1) and item 14 (`rank_coprod`), and no longer lists the GL-JSJ locators or the §4.1 Check as its own or as open.

## Verified sound

| Statement | Instances tried | Values computed | Result | Change |
| --- | --- | --- | --- | --- |
| `rank_coprod` (§4.11(2)) | `G = 1`; `ℤ/2∗ℤ/3`; `F₂∗ℤ`; one-tactic probe | `Group.rank PUnit = 0` (`Group.rank_eq_zero_iff`), `1∗H ≃ H`: `rank H = 0 + rank H`; `2 = 1+1`; `3 = 2+1`; `rfl`, `simp`, `exact?` fail | true without `Nontrivial`; not padding | none |
| §4.11(2) sketch | FOLD line 1158 (p. 28) | Theorem 6.2 assumes `G₁`, `G₂` nontrivial and finitely generated; the trivial case is the added sentence | sketch covers both cases | none |
| §4.1 Check, non-injective `ω_e` | `ℤ → A` trivial, `ℤ → ℤ` identity; `ℤ/2 ← ℤ → ℤ/2` | `(A∗⟨b⟩)/⟨⟨b⟩⟩ = A`, `B ↦ 1`; `(⟨s⟩∗⟨t⟩)/⟨⟨st⁻¹⟩⟩ = ℤ/2`, both embed | both halves correct | none |
| §4.11 Checks, `IsFreelyIndecomposable` | `ℤ`; `1`; `ℤ/2∗ℤ/2` | indecomposable (nontrivial free products are nonabelian); excluded by nontriviality; decomposable | Checks 1–3 hold | none |
| §4.11 Checks, `IsGrushkoDecomposition` | `ℤ²∗F(c,d)` with `t=(c,d²)`; `ℤ/2∗ℤ`, `t=(c)` vs `t=(sc)` | image inside kernel of `d ↦ 1 ∈ ℤ/2`, `d` outside; `sc ↦ s·sc = c`, an involution; `⟨(0,1)⟩ ≠ ⟨(1,1)⟩` in `ℤ/2×ℤ` | Checks 4–5 hold | none |
| §2.5(1) lift and KM02 gloss (sample) | `e₁:u→w₁`, `e₂:u→w₂` labelled `a`, `b₁:w₁→u`, `c₂:u→w₂` | folded closed path `cb` lifts to `c₂e₂⁻¹e₁b₁`, label `c a⁻¹a b`; `cb ∉ L(Γ,u)` as a word | subgroup equal, label set changes, as now written | none |
| §§4.1, 4.5 (sample), 4.6 locators | GL-JSJ lines 756, 772–775 (p. 16), 860 (p. 18), 914 (p. 19) | §1.2 Trees: splitting as marked graph of groups, one-edge splitting; §1.3 `(𝒜,ℋ)`-trees; §1.4.2 domination | match | none |
| §5.6 locator | ALG lines 1178 (§3.1, p. 30), 1239 (Theorem 3, p. 32), 1273 (§3.2, p. 33), 1316 (Lemma 10, p. 34) | as cited | match | none |
| §§1.2, 5.11, 6.7, 6.8, 8.5, 8.6a, 8.8, 8.9, 9.5 VAR-I locators | VAR-I lines 9 (§0), 241 (§1, p. 7), 432 (§2, p. 12), 928 (§3, p. 27) | Lemmas 2–4: 167–181 (p. 5); Def. 5: 193; Defs 6–7: 213–216 (p. 6); Lemma 5: 239 (p. 7); Props 1–2: 405–413; Props 3–8: 472–869; Lemma 12: 591 (p. 17); Form 2: 982 (p. 29) | match | none |
| §7.9 locator | IFT lines 424 (§3), 432 (Definition 7, p. 10), 465 (§3.1), 469 (Lemma 3, p. 11) | as cited | match | none |
| §§11.4c, 11.5 locators | IFT lines 3130–3133 (§7, Theorem 9, p. 67), 5341 (§7.4, p. 109), 6672 (Case 1, p. 134), 6730 (Case 2, p. 135), 6736 (§7.5, p. 136), 6810 (§7.6, p. 137) | proof spans pp. 109–135; non-orientable case pp. 136–137 | match | none |
| §9.7 locator | SUBGROUPS lines 335 (§2.5), 430 (Proposition 5, p. 10), 449 (§3.1) | Proposition 5 lies in §2.5 | match | none |
| Code spans (§§1.3, 1.5, 1.8, 2.2, 2.6, 2.7, 4.4, 5.2, 5.5, 5.6, 6.1, 6.4, 6.5, 8.1, 8.3, 8.9, 9.2, 11.4) | `a b` with basis `(a b, b)`; `⟨a², a³⟩`; `S⁻(3,0)` double cover | `a = (ab)b⁻¹`; `a = a³a⁻²`; `2·(2−3) = −2 = 2−2·2` | text unchanged in meaning | none |

The rows for statements this change leaves untouched stand as in the previous review, of `b5fe829`.

- Source locators checked against the text: 27, in 6 sources: VAR-I 10, IFT 7, GL-JSJ 4, ALG 4, SUBGROUPS 1, FOLD 1. Sampled targets falling in the changed passages: §§1.8, 2.5, 4.5, 5.5, 6.1; the other ten sampled targets are unchanged since `b5fe829`.
- Library: `Group.rank_eq_zero_iff` `#check`ed at the pin (`Group.rank G = 0 ↔ Subsingleton G`); `#check @rank_coprod` shows exactly `[Group G] [Group H] [Group.FG G] [Group.FG H] [Group.FG (Monoid.Coprod G H)]`, as README:1016 states.
- Branch against #2205: `d31b59b` is an ancestor of this head and is still #2205's head; `Suggested.lean` differs from it only in `rank_coprod`; the README differs in 37 hunks, all in passages the description's items 1–14 name. No file outside the folder changed.
- Cross-roadmap: no citation or section id changed; NoncongruenceModularForms on main cites §4.11, whose statement (2) is now weaker in hypotheses only.
- Gate rerun at this head: every check 0, OK (the worker's run also built the module, `build=0`). Depcheck: `depcheck: 206 roadmaps, 1899 edges, 0 problem(s)`.
- Elaboration: `lake env lean` on `Suggested.lean` gives 12 `sorry` warnings and no other diagnostic.
- Pull request text: title and description read against this head; the stack on `d31b59b`, items 12–14, the Checks and "Further corrections not made here" agree with it.
- Overlap check: read SurfaceTopology, RandomGraphs, GraphConnectivityAndFlows. SurfaceTopology consumes §§2.1–2.2a and 6.0a–6.0d (owner: this roadmap); GraphConnectivityAndFlows owns the multigraph walks, components and forests that §§2.1a and 2.2a cite; RandomGraphs shares nothing. #2205 changes the same folder and merges first, as the description states.

## Not verifiable

- [TREES] Serre, *Trees* (cited on the changed lines of §§4.1, 4.5, 4.6 and 4.11): paywalled, recorded as uncertified.
- [MAK] Makanin 1984 (cited on the changed Use line of §7.9): mathnet.ru was not readable in earlier rounds; §7.9 was checked through IFT pp. 10–12.

## Source issues

- none
