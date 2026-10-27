# GATE-FormalConnectionsOpers~1: answers to human review

Three comments since the last reply: two reviews by roed-math and one author reply by kim-em. The
kim-em comment reports the repairs made in `2ccf0a56` and raises no new claim, so it gets no
number. H01–H07 come from the first roed-math review and H08–H09 from the second. Repairs are in
commit `e2a605fd` on the branch, not pushed.

## H01 (roed-math) — applied

The finite-projectivity hypothesis is in F2.1–F2.3 at the reviewed head: zero curvature stays the
general definition, and the bracket criterion is stated only when `Ω¹_A/k` is finite projective.
The reviewer's counterexample is now a negative-control Check in F2.3 (`TauCetiRoadmap/FormalConnectionsOpers/README.md` line 228). It was recomputed: `A=k[x,y]/(x,y)²`, `Ω²≃k·dx∧dy`, curvature sends 1 to `dx∧dy≠0`, and every derivation satisfies `xξ(y)=0`, so `∇_ξ=ξ`. The vector-field `Connection`/`IsFlat` prototype is no longer in `Suggested.lean`; see the Lean note below.

## H02 (roed-math) — applied

F2.2 owns the characteristic-free all-order contract that ComplexComparisonPartII C5.1 consumes: the order predicate, `P^m=((A⊗A)/I^(m+1))⊗_(A,right)M`, universal factorization, transitions and composition maps, and localization with its separate finite-presentation condition. Its central statement is now a Lean headline, `principalParts_universal`, with `IsDifferentialOperator`, `principalPartsRelations`, `PrincipalParts` and `principalJet` (README line 190). The locators were checked against the Stacks project: Definition 10.133.1 (09CI), Lemma 10.133.3 (09CK), and Lemma 10.133.9 (0H90), which identifies `P^k` with `(S⊗M)/J^(k+1)(S⊗M)`.

## H03 (roed-math) — applied

The supplier table (line 48) and F2.1/F2.3 import CrystallineCohomology CR.1.3's `Crystalline.Connection` with its extension, curvature, horizontal maps, tensor, Hom/dual and base change. This roadmap keeps the vector-field comparison, gluing, formal versions, operators, jets, Lie–Rinehart PBW and principal-group connections. CR.1.3 and its `Crystalline.Connection.*` items were confirmed at CrystallineCohomology's current head. That roadmap's own README (around its line 130) records the same split.

## H04 (roed-math) — applied

The table (line 51) and F2.4 consume ComplexComparisonPartII C−1.1's `complexSchemeAnalytification` with its analytic ring sheaf, C0.3–C0.4's `holomorphicBundleDictionary` and coherent pullback, and C5.1–C5.2's `DifferentialOperatorAnalytification` and `holomorphicConnectionDictionary`. F2.4 keeps the fixed-model atlas, tangent, toric, group and gauge applications. All these names were confirmed at ComplexComparisonPartII's current head. Its README (lines 137–138) records the reciprocal split.

## H05 (roed-math) — applied

F7.5 applies AffineLieAlgebras A8's generic mode/completion phase to the classical algebra `W_cl` before any critical-centre theorem. It names the map `w_i[a]↦q_(i,−a−1)` (line 966). It states explicitly that the regular charged screenings are not extended as continuous derivations on punctured Cartan currents. A8 was confirmed on main.

## H06 (roed-math) — applied

F6 converts F1's right substitution to `ρ_φ=σ_(φ⁻¹)`, fixes `D=−ε(t)∂`, and proves `Ad_(g,1)(B,D)=(Ad_g B−D(g)g⁻¹,D)` by conjugation in the semidirect product (line 811), which keeps central directions. This is compared with Frenkel–Zhu §5 Lemma 10.

## H07 (roed-math) — applied

F1.3 and F3.2 cite Drinfeld, *Infinite-dimensional vector bundles in algebraic geometry*, v4: Theorem 3.3 (line 136), Lemma 3.9 and Theorem 3.10, and Theorem 3.11 (line 413). The reference list repeats them (line 1079).

## H08 (roed-math) — applied differently

ComplexComparisonPartII at its current head (`2d50a88`) no longer declares or opens anything in `TauCetiRoadmap.FormalConnectionsOpers`. Its `Suggested.lean` lives only in `TauCetiRoadmap.ComplexComparisonPartII`, so the consumer-side repair the reviewer proposed is done. A search of every open head and main for `commutatorWith`, `IsDifferentialOperator` and `namespace TauCetiRoadmap.FormalConnectionsOpers` finds them only in this roadmap. On this side, `Suggested.lean` now declares `IsDifferentialOperator` as the F2.2 owner. It drops `commutatorWith`: the commutator is written inline in the recursion, with the same order `D(a•m)−a•D(m)`.

## H09 (roed-math) — disputed

A joint-import check (`import TauCetiRoadmap.FormalConnectionsOpers.Suggested` together with `import TauCetiRoadmap.ComplexComparisonPartII.Suggested`) cannot be added. A roadmap's `Suggested.lean` may import only `Mathlib` and pinned `TauCeti.*` modules, and the gate refuses any other import. The name collision it would detect is excluded by the namespace search in H08 instead.

## Further repairs

- **`Suggested.lean` rewritten as the acceptance test.** The head file failed the gate: 20 `Mathlib.<submodule>` imports, no `import Mathlib`, 25 sorry'd data definitions, and API lemmas. It now has `import Mathlib`, `TauCeti.Algebra.AlgebraicGroup.PointsFunctor` and `TauCeti.Algebra.AlgebraicGroup.Reductive.Basic`, and states three headlines with real-bodied supporting definitions:
  - `principalParts_universal` (F2.2);
  - `regularGauge_constantCoeff_bijective` (F2.4): regular formal connections over a ℚ-algebra are classified by their fibre at `t=0`;
  - `formalLoop_eq_polynomial_mul_positive` (F3A.2): `G(R((t)))=G(R[t,t⁻¹])·G(R⟦t⟧)` for connected reductive complex `G` and every complex algebra `R`.

  The docstring names the headlines that cannot be stated at the pins and the carrier each lacks: the F2.1/F2.3 curvature comparison, F4.3 DS/Kostant, F4–F5 opers, F6 Frenkel–Zhu, F7–F8. The README names every new declaration and carries Checks for each (lines 190, 380, 462).
- **Plain citations.** The gate flagged six commit-pinned blob links, a `\(` display and two `_{…}` subscripts. These are now plain roadmap/section citations or relative links on main, prose, and `x_(±α)`/`q_(i,j)`. The same pattern was repaired in the `/pull/NNN` roadmap links and the "proposal279" names, which now read "ComplexManifolds Milestone n".
- **Česnavičius locator.** v3 of the paper was fetched and read. The polynomial-loop presentation is Theorem 19, the presheaf quotient is Theorem 17, and Česnavičius–Fedorov Theorem 4.2 is restated there as Theorem 16 (`Cesnavicius2024` lines 332, 359–365). The README previously cited "Theorem 3.6" of the v2 HTML.
- **Ownership.** PadicDifferentialEquationsAndRigidCohomology, which is earlier in the merge order, owns the cyclic-vector theorem (§§RD.1.2–RD.1.6) and the formal normal forms (§RD.6.52a). Its line 153 assigns their ℂ-specialization to this roadmap's F6. F6 planned them again, so it now consumes them; a supplier row was added at line 58. F6 keeps the flag/oper equivalence and the lattice estimates.
- **Ownership against open work.** `IsDifferentialOperator` and principal parts are assigned to F2.2 by ComplexComparisonPartII. Regular formal trivialization and polynomial/formal loops are assigned here by KacMoody KM8A and ReductiveGroups. No other roadmap on main or at an open head declares or plans these objects.

## Elaborated signatures

All twelve declarations were elaborated with `#check @name`, appended temporarily to `Suggested.lean`, built once with the permitted `lake build` command, then removed. Each elaborated type carries every binder its README statement needs: `[IsScalarTower k A M]` and `[IsScalarTower k A N]` on the principal-parts declarations, `[Algebra ℚ R]` on the gauge theorem, and `hG : reductiveCommHopfAlgProperty ℂ H` on the loop theorem. No binder was lost. One fix was needed: `LaurentSeries R` has two `k`-algebra structures, one coefficientwise and one through `R⟦t⟧`. A local instance pins the coefficientwise one for the loop maps and the loop theorem; without it, the product in the loop theorem did not typecheck.

## Adversarial pass

| Statement | Instances tried | Values computed | Result | Change |
| --- | --- | --- | --- | --- |
| `IsDifferentialOperator` | `n=0`; `d/dx` on `k[x]`; char p: `(d/dx)^p` and the Hasse operator `D^(p)` | order 0 is A-linearity; `[d/dx,x]=1` (order 0), so `d/dx` has order 1 but not 0; `(d/dx)^p x^n=n(n−1)⋯(n−p+1)x^(n−p)=0` mod p; `D^(p)(x^p)=1` while every `Σa_i∂^i` sends `x^p` to `a_0x^p` | sign `D(am)−aD(m)` matches Stacks 09CI | Checks added (line 190) |
| `PrincipalParts`, `principalJet` | `n=0`; `M=0`; generators | `n=0`: quotient by `(a⊗1−1⊗a)(1⊗m)` gives `A⊗M/…≃M`; `M=0`: 0; `J^(n+1)(A⊗M)` is the A-span of products of `n+1` differences applied to `1⊗m`, because J is generated by `g⊗1−1⊗g` (Stacks line 15929) | agrees with Stacks 0H90 | none |
| `principalParts_universal` | `n=0`; `A=k[x]`, `D=d/dx`, `n=1` | `n=0`: A-linear maps ↔ A-linear maps; `d/dx` factors through `P¹` via `1⊗1↦0`, `1⊗x−x⊗1↦1` | true for arbitrary k, A, M, N | none |
| `regularGauge` | composition sign | `gauge(g,A)=B ⇔ g'=gA−Bg`; `gauge(h,gauge(g,A))=hgA(hg)⁻¹−(hg)'(hg)⁻¹` | left convention as in F3.3 | none |
| `regularGauge_constantCoeff_bijective` | `n=1`, `A=1`, `B=0`; `A=B=0` over `𝔽_p`; `R=ℚ[ε]/ε²`, `A=εI`, `B=0`; `R=0`; `n` empty | `g=g₀e^t`; `1+t^p` is a second solution with `g(0)=1` (so ℚ is needed); `g=g₀(1+εt)` is checked by `g'=εg₀=εg`; `R=0` and empty `n`: singletons | true over ℚ-algebras, false in char p | Checks added (line 380) |
| `laurentPolynomialToLaurentSeries` | `T 1`, `C r` | `T 1 ↦ single 1 1 = t`, inverse `single (−1) 1`; `C r ↦ algebraMap r` (via `eval₂_C`) | coefficient inclusion | none |
| `formalLoop_eq_polynomial_mul_positive` | `G=1`; `G=G_m`, `R` a field; `R=ℂ[ε]/ε²`, `u=1+εt⁻¹` | trivial; `u=t^n·v` with `v∈R⟦t⟧^×`; `1+εt⁻¹∉t^n·R⟦t⟧^×` (n=0: `t⁻¹`-coefficient ε; n=−1: constant term ε is not a unit), so the polynomial factor is genuinely needed and is `u` itself | v3 Theorem 19 over any ring with totally isotropic `G_ad`; complex reductive groups are split | locator corrected; Checks added (line 462) |
| F2.3 converse without finite projectivity | reviewer's `A=k[x,y]/(x,y)²` | `Ω¹=(Adx⊕Ady)/(2xdx,2ydy,ydx+xdy)`, `Ω²=A/𝔪·dx∧dy≃k`; `∇²(1)=dx∧dy`; `ξ(x),ξ(y)∈𝔪` | converse false without the hypothesis | negative control added (line 228) |

Context: every theorem's binders are explicit in its own signature (no section `variable`s carry hypotheses into a `sorry`). Generality agrees between README and Lean: arbitrary `k, A, M, N` for F2.2; ℚ-algebras `R` and finite `n` for F2.4; connected reductive `G` over `ℂ` with arbitrary commutative ℂ-algebras `R` for F3A.2. F3A.2's README target is the bijection; the Lean file states its deep half, the factorization, and its docstring says so.

## Sources

Two sources were fetched through the sources service from open repositories:

- `Cesnavicius2024`: arXiv 2401.04314v3, Theorems 16, 17 and 19.
- `StacksDiffOps`: Stacks project, Algebra chapter, tags 09CI, 09CK and 0H90.

This job may edit only README and `Suggested.lean`, so the roadmap has no `sources.toml` entry for them yet. No text was missing, and `needs-references.toml` was not written.

## Build and gate

`lake build TauCetiRoadmap.FormalConnectionsOpers.Suggested`: **Build completed successfully (9095 jobs)**. The only warnings are three `declaration uses 'sorry'`, one per headline theorem.

Gate: `gate FormalConnectionsOpers: set_option=0 blob=0 latex=0 tex=0 prnum=0 sorry-data=0 sorry-examples=0 residue=0 private-paths=0 imports=0 mathlib-subimports=0 no-import-mathlib=0 lean-lines=0 forbidden=0 dropped=0 readme-ids-missing=0 empty-sections=0 round-labels=0 long-fences=0 layer-ids=0 target-ids=0 depcheck=1 metadata=0 dirty=0 outside-folder=0 source-material=0 FAIL`. The only failure is `depcheck: NOT IN ORDER: FormalConnectionsOpers (insert it after its last supplier)`. That is the not-yet-inserted design-stage case, which the brief says is not a defect.

Depcheck (`--movable`):

```
NOT IN ORDER: FormalConnectionsOpers (insert it after its last supplier)
depcheck: 148 roadmaps, 1006 edges, 1 problem(s)
```

There is no UPWARD and no CYCLE line.
