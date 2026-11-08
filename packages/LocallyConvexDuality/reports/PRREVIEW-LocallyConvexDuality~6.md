# Review of LocallyConvexDuality (pull request #1782 at 32064cd)

**Verdict:** needs changes

Incremental re-review of the 81 lines changed since fb54a01. All six findings of the previous review are repaired (R01 by consuming AutomorphicSpectralTheory §0.11 and SpectralManifolds SM3, which resolve at their open heads; R04 by defining `weakTopology B` as Mathlib's instance, checked by `rfl`; R06 by dropping `[CompleteSpace E]`). Two P3 notes remain, both in the one sentence of §5.1 that the repair of R05 rewrote: its locator points at the wrong numéro of Grothendieck 1952, and the proof route it names for the subspace clause of 5.4 does not reach it. The gate passes, the dependency check shows no UPWARD or CYCLE line, the file elaborates with `sorry` as the only warning, and the one changed Lean statement resists the one-tactic probe.

## R01 (P3) — The ε-product respecting subspaces is not a route to the subspace clause of 5.4

**Location.** `TauCetiRoadmap/LocallyConvexDuality/README.md` lines 566–568, §5.1: "The completed injective tensor product respects subspaces (Grothendieck 1952, Ch. I, no. 5) and commutes with arbitrary products, a direct check on the defining seminorms; these are the route to the subspace and product clauses of 5.4."

**Claim.** That `M ⊗̂ε F ↪ E ⊗̂ε F` for a subspace `M ⊆ E` is the route to "every subspace of a nuclear space is nuclear" (5.4, Théorème 3, 2°).

**Witness.** With `E` nuclear and `M ⊆ E`, the ε clause gives `ε_M = ε_E|_M = π_E|_M ≤ π_M` on `M ⊗ F`; the missing inequality `π_M ≤ ε_M` is the whole content, and `π` does not respect subspaces: grothendieck1952 lines 475–483 (Ch. I, no. 6, p. 84: `u₁ ⊗̂π u₂` is not a topological isomorphism in general when the `uᵢ` are, and is one iff equicontinuous bilinear forms on `E₁ × E₂` extend), lines 500–506 (a Banach subspace with the extension property for `G = F′` has `E″` complemented in `F″`), and line 1175 (2° is one of the two hard assertions of Théorème 3; the others "follow fairly simply from the criteria of Théorème 1"). For the product clause the tensor route also needs `π` to commute with products, which the NoncommutativeGeometry N1 contract (README lines 109–114) does not list.

**Repair.** Replace "these are the route to the subspace and product clauses of 5.4" by a route that works: the subspace clause of 5.4 follows from Théorème 1's criterion (c) through Hilbert seminorms (Grothendieck 1955, Ch. II, §2, no. 2; Pietsch 1972, Ch. 5), and the product clause from the definition consumed in 5.2, since a continuous seminorm on `∏ Eᵢ` factors through finitely many factors and finite sums are SpectralManifolds SM3's; keep the ε subspace and product statements in 5.1 as targets in their own right (they enter the identification `E ⊗̂ε F = E ⊗̂π F` for subspaces once 5.4 is known). The instance that refutes the original route, a nuclear `E` with a subspace `M` and `π_M ≠ π_E|_M`, is exactly the situation Grothendieck's remark at lines 475–478 describes.

## R02 (P3) — Locator: the ε-product respects subspaces is Ch. I, no. 6, Théorème 5, p. 83

**Location.** README line 566–567: "(Grothendieck 1952, Ch. I, no. 5)".

**Witness.** grothendieck1952 lines 368–397 (Ch. I, no. 5, pp. 81–82) define the bi-equicontinuous topology and `E ⊗̂ε F` and say nothing about subspaces. The statement that `u₁ ⊗̂ε u₂` is a topological isomorphism into when each `uᵢ` is one is the second sentence of Théorème 5, grothendieck1952 lines 441–445, Ch. I, no. 6, printed p. 83 (marker page 12, + 71). The previous review's R05 suggested no. 5; that suggestion was wrong, and this finding corrects it.

**Repair.** Write "(Grothendieck 1952, Ch. I, no. 6, Théorème 5, p. 83)" and keep "Ch. I, no. 5, pp. 81–82" for the definition.

## Previous findings

- R01 — repaired: lines 44–50 now say §0.11 "defines Fréchet spaces, nuclear maps and nuclear spaces, the last by Banach factorisation of the maps `Ê_q → Ê_p`" and SM3 "extends the definition to real scalars"; 5.2 consumes it and "defines no second notion of nuclear space"; supplier contracts and Layer 5 Dependencies list both. Both citations resolve (below).
- R02 — repaired: line 177, "(Proposition 1 and its corollary, p. 6)"; bourbaki1950 lines 80–90 are on marker page 3, printed p. 6.
- R03 — repaired: line 669, "*Summa Brasil. Math.* 3 (1954), 57–123".
- R04 — repaired: `Suggested.lean` line 135, `weakTopology B := WeakBilin.instTopologicalSpace B`; README line 100 names the instance. A scratch `example … : weakTopology B = WeakBilin.instTopologicalSpace B := rfl` elaborates.
- R05 — partly repaired: Jarchow is gone from the text and the references, but the replacement locator is the wrong numéro (R02 here) and the route sentence it sits in overclaims (R01 here).
- R06 — repaired: `dfSpace_strongDual` (line 220) has no `[CompleteSpace E]`; README 4.2 lines 491–496 state the metrizable case, say why completeness is not used, and add 1.2 to `*Needs:*`; the module docstring (line 34) agrees.

## Verified sound

**Gate and dependency check.** The worker's gate at 32064cd: every check passed (`build=0`, `depcheck=0`, `set_option=0`, `sorry-data=0`, `outside-folder=0`). I reran the dependency check with the merge-order candidate:

```
depcheck: 240 roadmaps, 2353 edges, 0 problem(s)
```

No UPWARD, CYCLE or `moved:` line. AutomorphicSpectralTheory is line 82 and SpectralManifolds line 223 of the merge order, LocallyConvexDuality line 224, so both new suppliers are earlier. `git diff --stat origin/main...HEAD` outside `TauCetiRoadmap/LocallyConvexDuality/` is empty: the 180-file list in the change summary is the merge of main into the branch, not the pull request's own change.

**Lean elaboration.** `lake env lean` on `Suggested.lean` at this head: exit 0, thirteen `declaration uses 'sorry'` warnings (lines 73, 100, 108, 118, 152, 160, 167, 183, 193, 220, 228, 236, 243) and nothing else. Scratch probe: `dfSpace_strongDual` with its `sorry` replaced by `first | infer_instance | rfl | simp | exact?` fails ("`exact?` could not close the goal"), so the widened statement is not padding; `#check @weakTopology` and `#check @dfSpace_strongDual` give the types in signatures.md, and the elaborated `dfSpace_strongDual` is `[UniformSpace E] [IsUniformAddGroup E] [ContinuousSMul 𝕜 E] [PolynormableSpace 𝕜 E] [T2Space E] [FirstCountableTopology E] → DFSpace 𝕜 (StrongDual 𝕜 E)`, the README's "metrizable locally convex space" (a first-countable topological vector space is metrizable; `T2` is Bourbaki's "séparé"). The signature tool's "looks dropped `[TopologicalSpace E]`" lead on `barrelledSpace_of_bornologicalSpace` is the same false lead as last round: that theorem binds `[UniformSpace E]` itself. The twelve untouched statements keep the signatures the previous review compared with the README.

**Cross-roadmap citations resolved.** AutomorphicSpectralTheory §0.11 at the head of its open pull request (its README line 279): "For Hausdorff locally convex complex `E`, define Fréchet by completeness and a countable seminorm topology. Nuclear maps admit Banach factorizations … nuclear spaces require these factorizations for strengthened seminorm quotient maps", which is what README lines 44–47 and the supplier contract (lines 120–122) attribute to it. SpectralManifolds SM3 at its open head (README line 91): consumes §0.11's definitions "stated there for complex scalars, and use the same definition over ℝ; prove independence of the defining family, the nuclear-space consequences for N1's existing completed projective tensor, and the finite-sum, closed-subspace and Hilbert-scale criteria"; its supplier row (line 26) says the same. So the LCD contract (lines 124–125: real scalars, independence of the family, finite-sum and closed-subspace criteria) is exactly what SM3 owns, and LCD's 5.4 keeps arbitrary subspaces, separated quotients, arbitrary products, countable sums, `⊗̂π` and the strong-dual clause, which SM3 does not state. SM3's "nuclear-space consequences for N1's completed projective tensor" are the Fréchet tensor identifications it uses in SM10, not Théorème 1's equivalence `π = ε`, so there is one owner for each statement. NoncommutativeGeometry N1 and BanachSpaceTheory B4 on main are unchanged since the previous review. `roadmaps grep` for the bi-equicontinuous topology and the injective tensor product of locally convex spaces over the 460 open pull requests and main finds only this roadmap, so the ε-product has one owner. Ownership against the open pull requests was checked for the objects the diff touches (nuclear spaces, ε-product); the rest carries forward from the previous review.

**Sources, changed locators.** Printed page = marker + 3 (bourbaki1950) and marker + 71 (grothendieck1952: marker page 11 is printed p. 82, marker page 30 is p. 101; the previous review's "+ 72" was a slip, its line numbers are right).

| Target | Locator at this head | Source lines | Result |
|---|---|---|---|
| 0.2 | Bourbaki Prop 1 and corollary, p. 6 | bourbaki1950 80–90 (marker page 3) | correct (R02 of the previous review repaired) |
| 4.2 | Grothendieck 1954, Part I, metrizable case | not readable (below); the route stated in the README (1.2 + 3.3 + countable basis) uses only targets of this roadmap | not verifiable, consistent |
| 5.1 definition | G1952 Ch. I, no. 5, pp. 81–82 | grothendieck1952 368–397 | correct |
| 5.1 subspaces | G1952 Ch. I, no. 5 | the statement is Théorème 5, lines 441–445, no. 6, p. 83 | wrong numéro (R02) |
| 5.1 products | "a direct check on the defining seminorms" | equicontinuous subsets of `(∏ Eᵢ)′` lie in finite sums of equicontinuous subsets of the `Eᵢ′`, so the ε-seminorms of `(∏ Eᵢ) ⊗ F` are finite maxima of those of the `Eᵢ ⊗ F`; `(∏ Eᵢ) ⊗ F` is dense in `∏ (Eᵢ ⊗ F)` (agree on finitely many coordinates); completion commutes with products | correct |
| 5.2 | G1952 Ch. II, no. 2, p. 100 and Théorème 1 | grothendieck1952 1098–1113: definition `E ⊗̂π F = E ⊗̂ε F` for all l.c. `F`, Banach `F` suffice, `E` nuclear iff its completion is; (a) ⇔ (b) every continuous linear map to a Banach space nuclear ⇔ (c) equicontinuous disks `A ⊆ B` with `E′_A → E′_B` nuclear | correct; §0.11's "Ê_q → Ê_p nuclear" is the transpose form of (c) |
| 5.4 | G1952 Ch. II, Théorème 3, p. 102 | grothendieck1952 1165–1174: 1° (F) or (DF) iff dual; 2° every vector subspace, every quotient; 3° arbitrary products, countable sums; 4° `E ⊗̂ F` | correct; "separated quotients" is the safe reading of 2°, and "closed subspaces and finite sums by SM3" is a special case of 2° and 3° |

The remaining seeded targets (0.1, 0.3, 1.2, 1.4, 1.5, 2.4, 3.1, 3.2, 3.3, 4.1, 4.3, 5.3) are untouched by the diff; their locators were checked in the previous review (its table) and carry forward.

**Adversarial table.** Rows for the changed statements have computed values; untouched statements cite the previous report.

| Statement | Instances | Values computed | Result | Change |
|---|---|---|---|---|
| `dfSpace_strongDual` (now without `CompleteSpace`) | `c₀₀` with the sup norm (metrizable, not complete); Banach `E`; `ℝ^ℕ`; `ℝ^(ℕ)` (negative control) | `c₀₀`: bounded sets are norm-bounded, `E′ = ℓ¹` with the norm topology, a (DF)-space by 4.1's first Check, so the dropped hypothesis is not needed on an incomplete instance. Banach: dual Banach, (DF). `ℝ^ℕ`: dual `ℝ^(ℕ)`, (DF) by the previous report's `DFSpace` row. `ℝ^(ℕ)`: not first countable, dual `ℝ^ℕ` not (DF) (previous report), so `FirstCountableTopology` cannot be dropped. Route: metrizable ⇒ bornological (1.2) ⇒ strongly bounded subsets of `E′` equicontinuous (3.3), so the polars `Uₙ°` of a countable basis are a fundamental sequence | true at the widened generality; hypotheses now Grothendieck's | none |
| `weakTopology` (now `WeakBilin.instTopologicalSpace B`) | `F = 0`; `E = F = ℓ²`; `rfl` test | `F = 0`: the induced topology from the one-point function space is indiscrete, as before. `ℓ²`: `eₙ → 0` weakly, not in norm, so `σ` is strictly coarser than the norm, as 2.1's Check says. The scratch `rfl` example elaborates, so the README's "is this instance on `E`" is a declared fact | same object, now Mathlib's | none |
| 5.2 with §0.11's definition | `𝕜ⁿ`; `ℓ²`; `s` | `𝕜ⁿ`: every `Ê_q → Ê_p` is finite-rank, hence nuclear. `ℓ²`: the only seminorm is the norm, `Ê_q → Ê_p` is the identity of `ℓ²`, not compact, not nuclear; consistent with `π ≠ ε` on `ℓ² ⊗ ℓ²` (5.1 Check). `s`: `aₙ^(k) = n^k`, `Σ n^k / n^(k+2) < ∞`, so `Ê_(k+2) → Ê_k` is a diagonal nuclear map; nuclear by both definitions | the consumed definition and the two owned properties agree on the three Checks | none |
| 5.4 split (SM3 closed subspaces and finite sums; here the rest) | `ℓ² × 𝕜`; closed subspace of `s`; `𝕜^ℕ` | `ℓ² × 𝕜` is a finite sum, and SM3's finite-sum criterion plus the quotient clause here agree that it is not nuclear (quotient `ℓ²`). A closed subspace of `s` is nuclear by SM3, and by 2° here. `𝕜^ℕ`: arbitrary product, here | the two owners' clauses are disjoint and consistent | none |
| 5.1 route sentence | `M ⊆ E` nuclear, `F` Banach | `ε_M = ε_E|_M = π_E|_M ≤ π_M`; the reverse inequality is not supplied by the ε clause (R01) | route incomplete | R01 |
| 1.1–1.5, 2.1–2.4, 3.1–3.4, 4.1, 4.3, 4.4, `IsBarrel`, `barrelledSpace_iff`, `IsBornivore`, `BornologicalSpace`, `mackeyFamily`, `mackeyTopology`, `mackey_arens`, `mackeyTopology_eq_of_*`, `completeSpace_iff`, `completeSpace_strongDual`, `DFSpace`, `DFSpace.*` | as in the previous report | unchanged by the diff; the previous report's rows (Review of fb54a01, adversarial table) stand | carried forward | none |

**Declared gaps.** None declared; none needed.

**Other README checks on the changed passages.** No LaTeX delimiters, process words, pull-request numbers or paths; "Completeness is not used" is a mathematical remark, not process narrative. Jarchow no longer occurs in the text or the references. The Scope paragraph (lines 31–33) now owns "the permanence properties of Layer 5 beyond closed subspaces and finite sums", matching 5.4 and the SM3 contract. The headline list of the module docstring (line 34) matches 4.2.

## Not verifiable

- **Grothendieck 1954, Summa Brasil. Math. 3** (4.1–4.5, including the metrizable form of 4.2): no legal copy of the French text; the sources service reached only the Mathnet landing page of the Russian translation. The route the README gives for the metrizable case uses only 1.2, 3.3 and the countable basis.
- **Grothendieck 1950, 1950b (C. R. Acad. Sci. 230)**, **Grothendieck 1955 (Memoirs)**, **Pietsch 1972**, **Köthe 1969**, **Waelbroeck 1971**, **Floret 1980**, **Wengenroth 2003**, **Dierolf–Roelcke 1981**, **Bourbaki volumes**, **Schaefer–Wolff**, **Trèves**: as in the previous review; paywalled or unreachable, cited by locator only.

## Source issues

- **Misprint** in bourbaki1950 at the bibliography, item [6], printed page 16: the source gives Mackey's paper as pp. 520–537 of Trans. Amer. Math. Soc. 60; it should be pp. 519–537; affects nothing.
