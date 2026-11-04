# GATE-ChevalleyGroups~1: answers to human review of TauCetiRoadmap/ChevalleyGroups

Head reviewed: `99cf6aa`. Repairs committed as `6f7e3693` ("ChevalleyGroups: review repairs (commutator signs, Geck-carrier headlines, main-only citations, no roadmap imports)"). Not pushed.

Points are numbered in the order they appear in the comments. When a later comment raises a point again, it gets its own number and refers back to the earlier one. Several points concern `TauCetiRoadmap/CFSGStatement/` or `TauCetiRoadmap/ReductiveGroups/`, which are now separate pull requests and cannot be edited from this folder. Those points are answered for the part that touches this roadmap.

## H01 (roed-math) — answered
`TauCetiRoadmap/ChevalleyGroups/metadata.toml` exists at the head and contains `topic = "math.GR"` (added in `1d6918b2`). The gate's `metadata` check reports 0.

## H02 (CBirkbeck) — answered
The counterexample is correct: `φ = s ∘ (p·id)` on the simply connected `A₁` datum has weight map `−p·id` and `φ² = p²·id`, and `Aut = {±id}` is abelian, so no conjugation moves it to `p^e·id`. The false normal form was in `CFSGStatement/README.md` L6, which is no longer in this pull request. In this roadmap, C5 "Standard and based endomorphisms" separates *standard* (maps root subgroups onto root subgroups) from *based* (also preserves `B(k)`), and the normal form applies only to based maps. This round, the "Regression for basedness" item no longer cites "L6 of the CFSG statement roadmap", because main's CFSGStatement has no L6. It now states the root-datum form of the example itself (`s ∘ (p·id)`, weight map `−p·id`, `{±id}` abelian) and says a normal form holds only for based isogenies.

## H03 (CBirkbeck) — answered
The step from `F = Int(s) ∘ F₀` to `F = Int(t) ∘ F₀ ∘ Int(t)⁻¹` is now a separate C5 item, "Lang's equation on the torus". It solves `s = t F₀(t)⁻¹` modulo the centre using surjectivity of `t ↦ t F₀(t)⁻¹`: the character map is `1 − φ`, which is injective because every eigenvalue has absolute value `p^(r/n) > 1`, and `kˣ` is divisible. This round the step is stated in `Suggested.lean` as `exists_geckWeightTorusPoints_eq_mul_inv`, on the pinned Geck carrier (see H16).

## H04 (CBirkbeck) — answered
The `A₁` regression is in C5, "Regression for basedness": on `SL₂(𝔽̄_p)`, `F = Int(n) ∘ Frob_p` with `n = [[0,1],[−1,0]]`. I recomputed it: `F(diag(s, s⁻¹)) = diag(s^{−p}, s^p)`, so the character map is `−p·id`, and `F² = Int(n²) ∘ Frob_{p²} = Frob_{p²}` because `n² = −I` is central. The root-datum form of the example was added this round (H02).

## H05 (CBirkbeck) — answered
The complex-conjugation counterexample is correct, and the head already treats character maps as checked data. C5 "Character maps are data" quotes the `SL₂(ℂ)` example and the scope of Conrad's Theorem 1.1.19. `IsCharacterMap` is a predicate on a pair `(F, φ)`, not a function of `F`. Field maps are assigned no character map. The exceptional maps get theirs from the C3 presentation, not from C7, so there is no C5↔C7 cycle; the milestone text says this explicitly. This round, `IsCharacterMap` takes the torus parametrization as an argument, `IsCharacterMap T F φ : ∀ s, F (T s) = T (fun i => charEval (φ (Pi.single i 1)) s)`, so the same definition serves `G_sc(t)` and the pinned adjoint carrier.

## H06 (CBirkbeck) — answered
The point is about `ReductiveGroups/README.md` Layer 9, which is no longer changed by this pull request; its replacement is in the separate ReductiveGroups pull request. The `GL(R ⊕ L)` example is correct: for a nontrivial invertible module `L`, the root spaces `L` and `L⁻¹` are not free. ChevalleyGroups defines no split-reductive predicate. It works over `ℤ`, where every invertible module is free, and it cites ReductiveGroups Layer 9B on main for pinnings.

## H07 (CBirkbeck) — answered
This repeats H02 and H03 for the same head (`1d6918b`); see those sections. The suggested strengthening of "standard" to also preserve the pinned Borel is exactly the "based" notion in C5.

## H08 (CBirkbeck) — answered
The character-map part repeats H05. On "C4 and C5 proceed in parallel": the head's milestone table lists C5 as depending on C1, C3 and C4. The prose says "C5 and C6 can proceed in parallel once C4 lands; C7 needs C4 and C5", which matches the table.

## H09 (CBirkbeck) — answered
The head already uses each datum's actual torus. In C2, the torus of `D` is `weightTorus` on the `b_D`-coordinate weights, whose character lattice is `Λ(D)`. C2 records the adjoint-`A₁` `μ₂` kernel and the distinction between `PGL₂(ℚ)` and the image of `SL₂(ℚ)`. C4 restricts the highest-weight coefficient formula to `G_sc(t)` and uses the block minors, which need no descent, for a general datum. This round, `Suggested.lean`'s docstring also says that `T_D(k) = Hom(Λ(D), kˣ)` has no pinned point map and that the pinned `geckWeightTorusPoints` is the full-weight parametrization. That is why no statement over a field that is not algebraically closed is made on the Geck carrier.

## H10 (CBirkbeck) — answered
This repeats H06, plus the point that the root vectors of a pinning are generators: replacing a generating root vector by twice that vector does not give a pinning in the characteristic-two fibre. Both are about ReductiveGroups Layer 9, which is outside this folder.

## H11 (CBirkbeck) — answered
The exponents in this roadmap are long `1`, short `p`. C5 now says they are forced. Applying `τ` to `h_β(s) x_α(u) h_β(s)⁻¹ = x_α(s^{⟨α,β^∨⟩} u)` gives `q(short) = 2 q(long)` for `B₂`. The reversed assignment would need `s⁻¹ = s⁻⁴`, which fails for `s` of order 7 in `𝔽₈ˣ`. I recomputed the `G₂` analogue: the exponents `(1, 3)` balance at `s^{−3}`, while `(3, 1)` gives `s^{−1}` against `s^{−9}`. The "formal square" remark in CFSG L2 is in the CFSGStatement pull request.

## H12 (CBirkbeck) — applied differently
Superseded by H15. The head's normalization was still wrong for `j ≥ 2`, so the whole coefficient list in C3 was rewritten in Steinberg's convention `[x, y] = xyx⁻¹y⁻¹` with monomials `u^i v^j`, and pinned by `A₂`, `C₂` and `G₂` Checks (see H15).

## H13 (CBirkbeck) — answered
- **Shared native types.** `Suggested.lean` uses only the native `TauCeti.DynkinType` and the pinned `TauCeti.DynkinType.geckPoints`.
- **Root index.** C0 already sends `Fin t.numRoots` to the nonzero-weight subtype `{α : LieModule.Weight ℚ H L // α.IsNonZero}` and uses a separate zero-weight extension adapter for `IsChevalleySystem`.
- **CFSG side.** Making the CFSG `AmbientGroup` an abbreviation of this roadmap's carrier is for the CFSG pull request. Its current head imports `TauCetiRoadmap.ChevalleyGroups.ChevalleyGroup` (`CFSGStatement/Suggested.lean`, lines 327 and 343), which no longer exists (H16), and one roadmap's Lean file may not import another's in any case.

## H14 (kim-em) — answered
Each claim in that status comment was checked against the head:
- **Present at the head:** based normal forms, the `A₁` regressions, explicit character compatibility, actual-lattice tori, forced exceptional exponents, shared native carriers and the nonzero-weight adapter.
- **Wrong at the head:** the "fixed commutator normalization" (see H15).
- **Not in this folder:** "free generating root lines and constant data" is about ReductiveGroups.
- **Dependent on an unmerged PR:** the split delivery made `Suggested.lean` import a module from that PR (see H16). The README also cited ReductiveGroups subsections that exist only there (`9A.1c`, `9A.5`, `9B.0`–`9B.3`, `pinnedModel`). These were remapped to main's Layer 9A items 1 and 5 and Layer 9B bullets ("The Chevalley–Demazure construction", "Base change", "Special isogenies in characteristics two and three"). The integral big-cell inverse identities and the gluing for C6 have no counterpart on main, so C4 and C6 own them.

## H15 (CBirkbeck) — applied
C3: `c_{1j} = (-1)^j M_{β,α,j}` was replaced by `c_{1j} = −M_{β,α,j}`, with `M_{α,β,i}` now defined by `(ad e_α)^i e_β / i! = M_{α,β,i} e_{iα+β}`. The `G₂` coefficients are now given explicitly: `c_{32} = (2/3) M_{α+β,α,2}` (α short) and `c_{23} = (1/3) M_{α+β,β,2}` (α long). The prose gives the reason the sign of `c_{1j}` is constant: the part linear in `u` is `−Σ v^j (ad e_β)^j e_α / j!`. Three Checks were added. The `Sp₄` example was verified by exact rational matrix arithmetic: `[I+uX, I+vY] = x_{α+β}(−uv) x_{α+2β}(−uv²)`, with `(1,3)` entry `−1` at `u = v = 1`, `−18` at `(2, 3)` and `25` at `(−1, 5)`. All five `G₂` coefficients were verified the same way in the 7-dimensional representation (`e_α = E₁₂ + 2E₃₄ + E₄₅ + E₆₇`, `e_β = E₂₃ + E₅₆`; Serre relations checked) at `(u, v) = (1, 1), (2, 3), (1/2, −5)`, for both orderings of long and short.

## H16 (CBirkbeck) — applied differently
The failing import is a design defect in this roadmap, not only a merge-order issue: `Suggested.lean` may import only `Mathlib` and pinned `TauCeti.*` modules, never another roadmap's module. So I did not wait for the supplier to land; I removed the import (`import TauCetiRoadmap.ReductiveGroups.ChevalleyModelTargets` and `import Mathlib.FieldTheory…` became `import Mathlib`, `TauCeti…GeckLattice.Frobenius` and `TauCeti…SpecialNodePermutations`). The simply connected carrier `ChevalleyGroup` exists nowhere at the pins, so it is gone from the file, along with everything built on it:
- **Removed:** `ChevalleyGroup`, `rootSubgroup`, `torus`, `elementary`, `elementary_eq_top`, `IsStandard` and `graphAut_rootSubgroup_simpleIndex`.
- **Removed for gate reasons:** the two sorry'd data definitions `titsSystem` and `graphAut`.
- **Removed as already in the library or as API lemmas:** `torus_conj_rootSubgroup` (already pinned for the Geck carrier) and `IsCharacterMap.comp` / `IsCharacterMap.unique` (API lemmas; they stay as README prose).

The headlines are now stated on the pinned Geck carrier `TauCeti.DynkinType.geckPoints`, which is this roadmap's adjoint form `DynkinType.adjointGroupScheme`, and which for `E₈`, `F₄`, `G₂` is also `G_sc`:
- `closure_geckRootSubgroupPoints_eq_top` (C4);
- `exists_geckWeightTorusPoints_eq_mul_inv` (C5);
- `exists_specialIsogeny` (C5).

The docstring lists what is not statable at the pins and why: `G_sc(t)` for other types; non-simple root subgroups, and with them the commutator formula, Bruhat decomposition, Tits system, centre and presentation; the `Λ(D)` torus off algebraically closed fields; C6; and C7. The README states the three theorems in C4 and C5 with matching hypotheses. The local build succeeds. The hosted CI was not run.

## Adversarial pass on the statements added or changed

| Statement | Instances tried | Values computed | Result | Change |
|---|---|---|---|---|
| C3 `c_{1j} = −M_{β,α,j}` | `C₂ = Sp₄`, `(u, v) = (1,1), (2,3), (−1,5)` | `(1,3)` entry of the commutator: `−1, −18, 25` = `−uv²`; old formula gives `+uv²` | old formula false, new one holds | replaced; Check added |
| C3 `c_{11}`, `c_{i1}` | `A₂` (`E₁₂`, `E₂₃`); `G₂` (7-dim) | `⁅x_α(u), x_β(v)⁆ = x_{α+β}(uv)`; `G₂` products equal at 3 parameter pairs | hold | kept; `A₂` and `G₂` Checks |
| C3 `c_{32} = (2/3)M_{α+β,α,2}`, `c_{23} = (1/3)M_{α+β,β,2}` | `G₂` (7-dim), α short / α long, 3 parameter pairs each | exact equality of `7×7` matrices; with my first (wrong) sign for `d₂` the remainder was not a root exponential, so the test does detect sign errors | hold | added; Check added |
| `closure_geckRootSubgroupPoints_eq_top` | adjoint `A₁` over `𝔽̄_p` and over `ℚ`; `B₂` over `𝔽₂` | `SL₂(𝔽̄_p) → PGL₂(𝔽̄_p)` is onto (all determinants are squares); over `ℚ`, `diag(2,1)` is missed (index `|ℚˣ/ℚˣ²|`); over `𝔽₂`, the simple positive root subgroups give a dihedral group ≠ the order-16 Sylow subgroup of `S₆` | true over algebraically closed `k` only, and only with positive and negative simple root subgroups together | `[IsAlgClosed k]` kept; two negative Checks added |
| `IsCharacterMap T F φ` | `Frob_q` with `φ = q·id`; `Int(n) ∘ Frob_p` with `φ = −p·id`; composite | `Frob_q(T s) = T(s^q)`; `diag(s^{−p}, s^p)`; composite character map `ψ ∘ φ` (checked parameter by parameter) | defining law correct; direction is pullback | generalized over `T` |
| `exists_geckWeightTorusPoints_eq_mul_inv` | `p` prime with `Frob_q`; `p = 0`; `p = 1` (excluded) | `s = u^{1−q}` is solvable in `𝔽̄_pˣ`; `p = 0`: `φⁿ = 0` makes `1 − φ` unipotent, so the statement holds; `p = 1`, `F = id`, `φ = id`: `u F(u)⁻¹ = 1`, so it fails | `[CharP k p]` is what excludes `p = 1` | Checks added for `p = 0` and `p = 1` |
| `exists_specialIsogeny` | `B₂`/`F₄` at `p = 2`, `G₂` at `p = 3`; exponents reversed | Cartan relation: `(1,2)` balances for `B₂`, `(2,1)` gives `s^{−1}` vs `s^{−4}`; `G₂` `(1,3)` balances, `(3,1)` gives `s^{−1}` vs `s^{−9}`; `B₂`: centre `μ₂(k) = 1` in characteristic 2, so `G_sc(k) ≅ G_ad(k)` on points | holds over algebraically closed `k`; signs left existential per index | stated on `geckPoints` with `[IsAlgClosed k]`; README explains the `B₂` transport |
| `charEval` | `n = 1`, `χ = (2)`, `s = (a)` | `a²`; `χ = 0` gives `1` | correct | none |

Signature check: I appended `#check @name` for all five declarations to `Suggested.lean`, built it once with the allowed build command, and then restored the file. Every hypothesis is in the declaration's own signature: `[IsAlgClosed k]` and `[CharP k p]` in both C5 theorems, and `[Fact p.Prime]` plus `htp` in `exists_specialIsogeny`. The file has no section `variable`s, so nothing can silently drop out. Each signature agrees with its README statement.

Ownership:
- Searching the roadmaps by object finds no other owner of these three statements. The names `closure_geckRootSubgroupPoints_eq_top`, `exists_geckWeightTorusPoints_eq_mul_inv` and `exists_specialIsogeny` have no match on main or in any open pull request.
- `charEval` also exists in `PadicMeasuresIwasawaAlgebras` on main, in a different namespace and with a different meaning, so there is no clash of fully qualified names.
- The pinned library already has the Geck graph automorphism on points with its simple-root equations (`TauCeti.DynkinType.geckGraphAutPoints_geckRootSubgroupPoints`) and the Frobenius (`TauCeti.DynkinType.geckFrobenius`), so neither is restated.

Sources: no source was fetched this round, and no `needs-references.toml` was written. The new coefficient claims were verified by the exact computations above rather than taken from a text. The existing Steinberg locators (Chapter 3, Lemma 15; Chapter 5, Theorem 7; Chapter 10, Theorem 28) are unchanged and were not re-read here.

## Build and gate

`lake build TauCetiRoadmap.ChevalleyGroups.Suggested`: `Build completed successfully (9269 jobs).` The only warnings are three `declaration uses 'sorry'`, at lines 57, 84 and 101.

Gate: `gate ChevalleyGroups: set_option=0 blob=0 latex=0 tex=0 prnum=0 sorry-data=0 sorry-examples=0 residue=0 private-paths=0 imports=0 mathlib-subimports=0 no-import-mathlib=0 lean-lines=0 forbidden=0 dropped=0 readme-ids-missing=0 empty-sections=0 round-labels=0 long-fences=0 layer-ids=0 target-ids=0 depcheck=0 metadata=0 dirty=0 outside-folder=0 source-material=0 OK`

Depcheck (`--movable`): `depcheck: 148 roadmaps, 999 edges, 0 problem(s)`. There are no UPWARD, CYCLE or `moved:` lines.

Citations: `roadmaps resolve` reports no cross-roadmap citations and no Lean names found nowhere.
