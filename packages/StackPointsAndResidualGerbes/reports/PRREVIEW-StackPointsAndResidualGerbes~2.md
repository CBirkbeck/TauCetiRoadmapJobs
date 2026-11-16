# Review of StackPointsAndResidualGerbes (pull request #2429 at bc166a2)

**Verdict:** needs changes

## R01 (P3) — 6.4's zero-dimensional route does not name its "unramified over `K̄` ⇒ finite constant" input

**Location** `TauCetiRoadmap/StackPointsAndResidualGerbes/README.md:1852–1855` "for the API bullet, also 0.3, 0.5, 1.2, 1.4 and 3.3, Mathlib `finite_of_finite_type_of_isJacobsonRing` … and gap:stack-separation-axioms"; line 2172 "(1.4; unramified, and quasi-compact because the diagonal is), hence constant".

**Claim** 1.4's target only makes `G_x` a scheme. The step "an unramified, quasi-compact scheme over an algebraically closed `K` is a finite disjoint union of copies of `Spec K`" is not a target, a supplier section or a cited declaration. 1.4 states it only in a Check (line 971).

**Witness** The pin proves exactly this step, in Mathlib `Algebra.FormallyUnramified.finite_of_free` (`RingTheory/Unramified/Finite.lean:167`) and `Algebra.FormallyUnramified.bijective_of_isAlgClosed_of_isLocalRing` (`RingTheory/Unramified/Field.lean:61`). The README cites neither.

**Repair** In 6.4's *Needs:*, after "(a field of finite type over `K` is finite over `K`)", insert: ", `Algebra.FormallyUnramified.finite_of_free` and `Algebra.FormallyUnramified.bijective_of_isAlgClosed_of_isLocalRing` (an unramified algebra of finite type over `K` is finite over `K` and each of its local factors is `K`, so the quasi-compact unramified `G_x` is a finite disjoint union of copies of `Spec K`)". Add both names to Layer 6's Dependencies. Add to From Mathlib: "- `Algebra.FormallyUnramified.finite_of_free` (`Mathlib/RingTheory/Unramified/Finite.lean:167`) and `Algebra.FormallyUnramified.bijective_of_isAlgClosed_of_isLocalRing` (`Mathlib/RingTheory/Unramified/Field.lean:61`): an unramified algebra essentially of finite type over a field is finite over it, and a local one over an algebraically closed field is that field. They make `G_x` finite and constant in 6.4's API bullet." At line 2172, replace "(1.4; unramified, and quasi-compact because the diagonal is)" with "(a scheme by 1.4; unramified; quasi-compact because the diagonal is; hence, by the Mathlib lemmas of 6.4, a finite disjoint union of copies of `Spec K`)".

## R02 (P3) — The description's summary drops the hypotheses of the statement FunctionFieldArithmeticPartII receives

**Location** Pull-request description, `<!-- roadmap-summary -->`: "FunctionFieldArithmeticPartII gets the reduction of a zero-dimensional Deligne–Mumford stack as a disjoint union of classifying stacks of finite groups."

**Claim** The statement is false without finite type, an algebraically closed base and a quasi-compact diagonal. 6.4's API bullet assumes all three.

**Witness** README lines 1882–1885 (a 6.4 Check): `Bℤ` over `K` is Deligne–Mumford and one-point, and is its own residual gerbe, but `G_x = ℤ_K` is infinite.

**Repair** Replace the clause with: "and FunctionFieldArithmeticPartII gets from 6.4 that, over an algebraically closed field, the reduction of a Deligne–Mumford stack of finite type with quasi-compact diagonal and finite discrete underlying space is a disjoint union of classifying stacks of finite constant groups."

## Previous findings

- R01 — repaired: "where its §5.1 defines the rigidification `𝒳▹I_𝒳` by the whole inertia, it is the base `𝒳^♭` of 2.1 (2.1's comparison bullet)" (lines 99–100). See also the comparison bullet (1027–1035), the *Needs:* (1009–1012) and the supplier bullet (474–478).
- R02 — repaired: "The API consists of the following fact. - Zero-dimensional Deligne–Mumford stacks: let `K` be an algebraically closed field and `𝒳` a Deligne–Mumford stack of finite type over `K`" (lines 1857–1864). See also the `Bℤ` Check (1882–1885) and the consumer bullet (2146–2151).
- R03 — repaired: "for algebraic spaces `T₁`, `T₂` with morphisms `x_i : T_i → 𝒳`, so is `T₁ ×_{x₁,𝒳,x₂} T₂ → T₁ ×_{f∘x₁,𝒴,f∘x₂} T₂`; and for `x₁, x₂ : T → 𝒳` from one algebraic space `T`" (lines 1105–1108).
- R04 — repaired: "Conversely, the folded line `L = 𝔸¹_k/(Δ ⊔ Γ)` … is quasi-separated … and is not a scheme (`foldedLine_space`). … the second alternative makes `L` decent, the first does not reach it" (lines 1518–1523).
- R05 — repaired: the description now reads "The geometry of an algebraic stack at a point, in Stacks Project conventions".
- R06 — repaired: "Dependencies, all on main …: SchemeAndStackFoundations §§1.2, 1.7–1.9, 1.12–1.23, 4.8 and 4.12–4.13; AlgebraicModuliForArithmeticGeometry §§4.1, 5.1, 8.1 and 8.3; ReductiveGroups Layers 1 and 3." This matches the README's citations.
- R07 — repaired: "`Suggested.lean` declares nothing: its module docstring lists the headline theorems and records that none is statable at the pins"; "the targeted Lake build succeeds with no warning".

## Verified sound

| Target | Instances tried | Values computed on each side | Result | Change |
|---|---|---|---|---|
| 2.1 comparison with rigidification (sample) | `Bμ_p/𝔽_p`; `[Spec ℂ/(ℤ/4)]/ℝ`; `B(𝔾_a/ℤ)/ℚ`; `[𝔸¹/𝔾_m]` | `Bμ_p▹μ_p = Spec 𝔽_p` = base; `▹I_𝒳 = Spec ℝ` = base; `𝔾_a/ℤ` not qc: §5.1 silent, 2.4 gives base `Spec ℚ`; inertia not flat: neither | holds | none |
| 2.4 Lemma 101.28.10 (3)–(4) | gerbe `Bμ_p → Spec 𝔽_p`, `T₁ = T₂ = Spec 𝔽_p`; non-gerbe `Spec k → B(ℤ/2)` | `T₁ ×_{Bμ_p} T₂ = μ_p → Spec 𝔽_p`: surjective, flat, fp; non-gerbe: `Spec k → (ℤ/2)_k` is the unit, not surjective | holds; matches stacks-06QB 2779–2788 | none |
| 1.3 Lemma 101.5.4 bullet (sample) | `B(ℤ/2)/ℝ`, `x₁` trivial, `x₂ = Spec ℂ`, `T = Spec ℝ` | `Isom(x₁,x₂) = Spec ℂ` has no ℝ-point; `(ℤ/2)_ℝ` acts simply transitively after `⊗ℂ`: a pseudo-torsor, not a trivial torsor | holds | none |
| 5.1 folded-line Check (sample) | `L = 𝔸¹_k/(Δ ⊔ Γ)`, `char k ≠ 2`; non-qs `X` glued along `⋃ D(xᵢ)` | `R ≅ 𝔸¹ ⊔ 𝔾_m` affine → `𝔸²` qc: `L` qs, decent by alt. 2; `L` not a scheme: alt. 1 fails; `X`: alt. 1 only | holds; matches stacks-06RD 4699–4721 | none |
| 6.4 API bullet | `K = ℂ`: `B(ℤ/2) ⊔ Spec ℂ`; `[Spec ℂ[ε]/(ℤ/2)]`, `ε ↦ −ε`; `Bμ_p/𝔽̄_p`; `K = ℝ`: `Spec ℂ` | `BG` with `G = ℤ/2, 1`; `𝒳_red = B(ℤ/2) ≠ 𝒳`; `μ_p` ramified: not DM, not constant; no `x` with `p∘x = id` | holds; reduction, DM and `K = K̄` each needed | R01 |
| 6.4 `Bℤ` Check | `Bℤ` over `K` | `Δ` pulled back along `(x,x)`: `⊔_ℤ Spec K → Spec K`, not qc; `|Bℤ|` is one point; atlas `Spec K` étale; `G_x = ℤ_K` infinite | holds; qc diagonal needed | none |
| Worked example, rational representative | `𝔸¹_ℂ` at `t = a`; `𝔸¹_ℝ` at `t² + 1` | `ℂ → ℂ` finite (Zariski), so an isomorphism; `ℝ → ℂ` has degree 2, so no `x` with `p∘x = id` | holds; `K = K̄` needed | none |
| Description summary sentence | `Bℤ` over `K` | DM, zero-dimensional, reduction `Bℤ`, `G_x = ℤ_K` infinite, against "classifying stacks of finite groups" | fails | R02 |

The rows for statements the change does not touch stand as in the review of 3688535.

- 14 source locators checked against the cached text, all agreeing: stacks-06QB lines 2613–2663 (Definition 101.28.1, Lemmas 101.28.2–101.28.5) and 2775–2820 (Lemma 101.28.10); stacks-06RD lines 544–564 (101.5.4), 637–657 (101.6.1), 1593–1601 (101.18.6), 4686–4735 (Definition 101.48.1, Lemmas 101.48.2–101.48.5).
- 4 Mathlib declarations opened at `1b1ccf4`: `finite_of_finite_type_of_isJacobsonRing` (`RingTheory/Jacobson/Ring.lean:691`), the Artinian Jacobson instance (line 102), `Algebra.FormallyUnramified.finite_of_free` (`Unramified/Finite.lean:167`), `.bijective_of_isAlgClosed_of_isLocalRing` (`Unramified/Field.lean:61`).
- 8 cross-roadmap citations resolved on main: AlgebraicModuliForArithmeticGeometry §5.1 "entire inertia rigidifiable" (line 8428), `.stack` (8441), `.stabilizer_kernel` (8475), `.geometry` (8485), hypotheses as the supplier bullet states; SchemeAndStackFoundations §1.9 folded-line Check (3080), §1.12 `foldedLine_space` (3178), §1.19 `IsDeligneMumford` (3623), §1.20 `setoid_criterion` (3642).
- 1 consumer citation resolved: FunctionFieldArithmeticPartII line 53, at the head of its pull request.
- Gate at bc166a2: OK, every check 0; outside-folder diff empty; dependency check `depcheck: 245 roadmaps, 2296 edges, 0 problem(s)`, with no UPWARD or CYCLE line.
- Elaboration: `lake env lean Suggested.lean` printed nothing and exited 0; the file is unchanged since 3688535 and declares nothing, so there is nothing to `#check` or probe, and the change adds no statable headline.
- Gaps: the change declares no new gap; 6.4's *Needs:* uses gap:stack-separation-axioms only for "Deligne–Mumford ⇒ quasi-DM", which that gap covers.

Overlap check: scopes of SchemeAndStackFoundations, AlgebraicModuliForArithmeticGeometry, EquivariantIntersectionTheory (main) and SchemeAndStackFoundations, NashBlowups, GroupSchemesOverABase, VirtualFundamentalClass, PurityForFlatCohomology (open) stand as read at 3688535; reread for the change: whole-inertia rigidification owned by AlgebraicModuliForArithmeticGeometry §5.1 (cited, not restated), the base `𝒳^♭` owned here; a search of main and every open head finds no other owner of 6.4's zero-dimensional statement.

Source independence: changed passages only; 7 passages compared (Scope line 99, §5.1 supplier bullet, 1.3 bullet, 2.1 comparison bullet, 2.4 restatement, 5.1 Check, 6.4 bullet with its worked example) with 1 source (stacks-06QB/06RD) and with AlgebraicModuliForArithmeticGeometry §5.1 and FunctionFieldArithmeticPartII line 53; longest shared run 7 words, the forced property list "surjective, flat and locally of finite presentation"; no layer added, removed or reordered, so the contents comparison of 3688535 stands (largest share stacks-06QB/06RD, about 134 of about 350 locators; independent).

## Not verifiable

- lmb2000, Chapter 11, Définition 11.2 (cited in 5.5, which this change does not touch): uncertified (paywalled). It is cited by its locator only and was not read.

## Source issues

- none

## For the human reviewers

- AlgebraicModuliForArithmeticGeometry §5.4 (main, 37th in the merge order) uses closed substacks of Deligne–Mumford stacks without defining them (main README line 8710, `DMSchematicClosure`). Their only owner is this roadmap (38th), as its README lines 65–66 record.
