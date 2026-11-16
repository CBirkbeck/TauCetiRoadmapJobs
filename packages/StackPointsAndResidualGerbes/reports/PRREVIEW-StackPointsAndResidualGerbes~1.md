# Review of StackPointsAndResidualGerbes (pull request #2429 at 3688535)

**Verdict:** needs changes

## R01 (P3) — The base of a gerbe and 2.4 are not related to AlgebraicModuliForArithmeticGeometry §5.1's rigidification

**Location** `TauCetiRoadmap/StackPointsAndResidualGerbes/README.md:1083` "Prove that an algebraic stack `𝒳` is a gerbe iff `I_𝒳 → 𝒳` is flat and locally of finite presentation"; also 2.1 (lines 997–1000) and the Scope line 98–99 "rigidification belong to AlgebraicModuliForArithmeticGeometry Layers 4–5".

**Claim** When `𝒳` is locally of finite presentation over `S` and its inertia is flat and finitely presented, main's AlgebraicModuli §5.1 already gives the "if" half of 2.4: `𝒳 → 𝒳▹I_𝒳` is a gerbe onto a target with trivial inertia, which is 2.1's `𝒳^♭`. Neither 2.1 nor 2.4 says this or how they differ.

**Witness** AlgebraicModuliForArithmeticGeometry/README.md (main) line 8428: "The entire inertia is rigidifiable when the inertia itself is flat and finitely presented"; line 8485, `Rigidification.geometry`: "ρ is an fppf gerbe"; `stabilizer_kernel`: `Aut(ρx) ≅ Aut(x)/G_x`.

**Repair** Add this API bullet to 2.1: "When `𝒳` is locally of finite presentation over `S` and `I_𝒳 → 𝒳` is flat and of finite presentation, AlgebraicModuliForArithmeticGeometry §5.1's rigidification of `𝒳` by its whole inertia is a gerbe over an algebraic space with trivial inertia, and the uniqueness of the base identifies it with `𝒳^♭` under `𝒳`." Add "AlgebraicModuliForArithmeticGeometry §5.1 (`ArithmeticModuli.Rigidification.geometry`, `.stabilizer_kernel`), for the comparison bullet" to 2.1's *Needs:* and to the §4.1 supplier bullet. In Scope, after "stay in that roadmap's Layers 4–5", add: "2.1 and 2.4 hold for every algebraic stack; where §5.1's rigidification by the whole inertia is defined, it is the base `𝒳^♭` (2.1)."

## R02 (P3) — The statement promised to FunctionFieldArithmeticPartII is not a target

**Location** `README.md:2102–2107` "the statement it asks of SchemeAndStackFoundations on zero-dimensional Deligne–Mumford stacks … is the worked example below, from 0.3, 0.5, 1.4, 3.3, 4.5 and 6.4".

**Claim** A consumer can cite only a target. This statement lives only under `## Worked examples`, so it has no section id.

**Witness** FunctionFieldArithmeticPartII README line 53 (head of its open pull request) declares gap:zero-dimensional-dm-residual-gerbes for this exact statement. That roadmap is 412th in the merge order, after this one (38th).

**Repair** In 6.4, insert before **Checks.**: "The API consists of the following fact. - For `K` algebraically closed and `𝒳` a Deligne–Mumford stack of finite type over `K` with quasi-compact diagonal and `|𝒳|` finite and discrete, `𝒳_red` is the disjoint union of the residual gerbes `𝒵_x`, and for a `K`-point `x` with `p ∘ x = id` in each, `𝒵_x ≃ BG_x` with `G_x` a finite constant group (0.3, 0.5, 1.4, 3.3, 4.5; the worked example)." Add 0.3, 0.5, 1.4 and 3.3 to 6.4's *Needs:*. Add the Check "`Bℤ` over `K` is Deligne–Mumford, of finite type and one-point, with `G_x = ℤ`: the diagonal hypothesis is needed." In Downstream consumers, replace "is the worked example below" with "is 6.4's API bullet, proved in the worked example below".

## R03 (P3) — 2.4 restates Lemma 101.28.10 with undefined `T₁`, `T₂`, `x₁`, `x₂`

**Location** `README.md:1086–1087` "and so are the induced `T₁ ×_𝒳 T₂ → T₁ ×_𝒴 T₂` and `Isom_𝒳(x₁, x₂) → Isom_𝒴(f∘x₁, f∘x₂)`".

**Claim** The sentence never introduces `T_i` or `x_i`. The `Isom` clause needs both `x_i` to share one source. The source's hypothesis that the `T_i` are algebraic spaces is lost.

**Witness** stacks-06QB lines 2779–2785: (3) is stated for algebraic spaces `T_i` with `x_i : T_i → 𝒳`; (4) for one algebraic space `T` with `x₁, x₂ : T → 𝒳`.

**Repair** Replace the quoted clause with: "and, for algebraic spaces `T₁`, `T₂` with morphisms `x_i : T_i → 𝒳`, so is `T₁ ×_{x₁,𝒳,x₂} T₂ → T₁ ×_{f∘x₁,𝒴,f∘x₂} T₂`; for `x₁, x₂ : T → 𝒳` from one algebraic space `T`, so is `Isom_𝒳(x₁, x₂) → Isom_𝒴(f∘x₁, f∘x₂)`".

## R04 (P3) — A 5.1 Check claims both alternatives of Lemma 101.48.3 are needed but witnesses only one

**Location** `README.md:1491–1497` "The two alternatives of Lemma 101.48.3 are both needed. … the first alternative makes `X × BG_k` decent, the second does not reach it."

**Claim** The example shows only that the first alternative reaches a case the second misses. Nothing shows the converse.

**Witness** Folded line `X = 𝔸¹_k/(Δ ⊔ Γ)`, `char k ≠ 2` (SchemeAndStackFoundations §1.12 `foldedLine_space`): `Δ ⊔ Γ → 𝔸¹ × 𝔸¹` is quasi-compact, so `X → Spec k` is quasi-separated; `X` is not a scheme.

**Repair** Append to the Check: "Conversely, the folded line `X = 𝔸¹_k/(Δ ⊔ Γ)` of SchemeAndStackFoundations §1.12 (`char k ≠ 2`) is quasi-separated, since `Δ ⊔ Γ → 𝔸¹ × 𝔸¹` is quasi-compact, and is not a scheme. So `X → Spec k` is representable by algebraic spaces and quasi-separated but not representable by schemes: the second alternative makes `X` decent, and the first does not reach it."

## R05 (P3) — The description says the roadmap follows the Stacks Project

**Location** Pull-request description, summary block: "The local structure of an algebraic stack at a point, following the Stacks Project:".

**Claim** The head only adopts the Stacks Project's conventions. Its layer order is the order its *Needs:* lines force, not the Stacks Project's.

**Witness** README line 3–4: "in the conventions of the Stacks Project". Layers 0 and 3 come from Ch. 100, interleaved with Layers 1, 2, 4 and 5 from Ch. 101; Layers 6–7 are its own.

**Repair** Replace the phrase with "The local structure of an algebraic stack at a point, in the conventions of the Stacks Project:".

## R06 (P3) — The description's dependency paragraph names no roadmap and leaves out ReductiveGroups

**Location** Pull-request description: "Dependencies (the roadmaps the README cites by name and section, and what they in turn need; the Lean imports none of them)." The prose before it names only SchemeAndStackFoundations and AlgebraicModuliForArithmeticGeometry.

**Claim** The paragraph lists no supplier. ReductiveGroups is a supplier, and gap:homogeneous-quotient-scheme is declared to it.

**Witness** README lines 490–506 (`### From TauCetiRoadmap.ReductiveGroups`, gap:homogeneous-quotient-scheme). `design/plan.json` declares 17 gaps: 15 to SchemeAndStackFoundations, 1 to AlgebraicModuliForArithmeticGeometry and 1 to ReductiveGroups.

**Repair** Replace the paragraph with: "Dependencies, all on main: SchemeAndStackFoundations §§1.2, 1.7–1.9, 1.12–1.23, 4.8, 4.12–4.13; AlgebraicModuliForArithmeticGeometry §§4.1, 8.1, 8.3; ReductiveGroups Layers 1 and 3. The README declares 17 supplier gaps: 15 to SchemeAndStackFoundations, 1 to AlgebraicModuliForArithmeticGeometry §8.1 and 1 to ReductiveGroups Layer 3."

## R07 (P3) — The description misdescribes `Suggested.lean`

**Location** Pull-request description: "the Lean states only real-bodied definitions and theorems statable against the pinned Mathlib and Tau Ceti" and "the targeted Lake build succeeds with `sorry` as the only warning".

**Claim** `Suggested.lean` declares nothing and elaborates with no warning at all. A reader must learn that no headline theorem is stated.

**Witness** `Suggested.lean` lines 56–58: the namespace opens and closes with nothing between them. `lake env lean` on the file printed nothing and exited 0.

**Repair** Replace both sentences with: "`Suggested.lean` declares nothing: its module docstring lists the headline theorems and records that none is statable at the pins, which have no algebraic stack. The targeted Lake build succeeds with no warning."

## Verified sound

| Target | Instances tried | Values computed on each side | Result | Change |
|---|---|---|---|---|
| 0.2 monomorphisms (sample) | `Spec ℂ→Spec ℝ`; `Spec k→Spec k[ε]`; `Spec k→BG` | `ℂ⊗_ℝℂ=ℂ×ℂ`: 2 points, injective on points, not mono; `k[ε]`: mono, not iso; `Spec k×_{BG}Spec k=G≠Spec k` | holds | none |
| 0.2 rigidity route | `T→Spec k` mono, `V` affine étale over `T` | `V×_TV=V×_kV`; projection étale; Mathlib `DescendsAlong @Etale …` (LocalFlatDescent.lean:48) gives `V→Spec k` étale | sound | none |
| 0.3 immersions (sample) | generic point of `𝔸¹_k`; `Spec k⊔Spec k` | complement of `{η}` = closed points, not closed: mono, not immersion; two equivalent, unequal open substacks | holds | none |
| 1.1 / 4.1 finite type points (sample, headline) | `η∈𝔸¹_k`; generic point of `Spec ℤ_(p)` | `k[t]↪K` lft ⇒ `K` finite over `k[t]` ⇒ `k[t]` a field: false; `ℚ=ℤ_(p)[1/p]`; `𝒵_η=Spec k(t)` exists, not lft | holds | none |
| 1.2 field-valued points (sample) | `Spec ℚ(i)`, `x=id`, `y=σ`; `B(ℤ/2)_ℝ`; `𝔸¹_ℝ` | `a=σ,b=id`: `σ∘id=σ=id∘σ`; `ι≠ι∘σ` as `ι(i)≠−ι(i)`; 2 classes → 1 point; `t²+1` missed | holds | none |
| 2.1 base of a gerbe | `𝔸¹_k`; `B𝔾_{m,𝔽_p}`; `B𝔾_{m,ℤ}` | `0≇1` locally: not `IsGerbe`; no objects over `ℚ`; base `Spec ℤ`, equal to `𝒳▹I_𝒳` of AlgebraicModuli §5.1 | holds | R01 |
| 2.4 inertia criterion (sample, headline) | `[𝔸¹/𝔾_m]`; `Bμ_p` | inertia fibres `𝔾_m` at 0, trivial at 1: not flat; `μ_p` finite flat: gerbe | holds | R03 |
| 2.6 dense open gerbe (sample, headline) | `[Spec k[ε]/𝔾_m]`; Example 101.29.2 | `B=k[ε][λ^{±1}]/((λ−1)ε)`: `λ−1` kills `ε`, `λ−1∉εB`: not flat; one point; `tx₀=x₀⇒t=1` | holds | none |
| 3.2 rigidity (sample) | `X=U/G` (Ex. 100.11.6); `Spec k→BG` | `U×_X Spec ℚ̄=G×Spec ℚ̄` discrete, `U` not: mono, not equivalence; no lfp point; `Spec k→BG` not mono | holds | none |
| 3.4 properties (sample) | origin of `k[x,y]/(xy)`; `Spec ℚ(t)/ℤ`; `[𝔸¹/𝔾_m]→Spec k` | `𝒵=Spec k` regular; `ℤ×Spec ℚ(t)` infinite vs `ℚ(t)⊗_Fℚ(t)` finite: base not a field; pullback is the whole stack | holds | none |
| 3.5 functoriality (sample) | `Spec k→BG`, `BG→Spec k`; `G=ℤ/2, μ_p, 1` | fibre products: 1 vs 2 points; length 1 vs `p`; `G=1`: identity | holds | none |
| 4.2–4.4 existence (headline) | `Bμ_p`; `B𝔾_m`; `Bℤ`; `Spec ℚ(t)/ℤ` | `Spec 𝔽_p→Bμ_p` finite flat: `𝒵=Bμ_p`; `B𝔾_m` not quasi-DM, quasi-compact inertia; `Bℤ` gerbe, inertia `⊔_ℤ`; locally Noetherian space: `𝒵=X` | holds | none |
| 4.5 closed points (headline) | `[𝔸¹/𝔾_m]`; DVR; `U/G` | `0`: `B𝔾_m` closed immersion; `1`: open, not closed; `Spec R/𝔪` closed; `U/G`: closed point, `Spec ℚ̄→X` not closed immersion | holds | none |
| 5.1 decent stacks (sample) | `B𝔾_m`; `𝔸¹_ℚ/ℤ→Spec ℚ`; two copies of `Spec k[x₁,…]`; folded line | affine diagonal; diagonal pulls back to `⊔_ℤ𝔸¹`, not qc; scheme-representable, not qs; folded line qs, not a scheme | holds | R04 |
| 5.3 residue field (sample, headline) | `[Spec ℂ/(ℤ/4)]_ℝ`; `Spec ℚ(t)/ℤ`; `𝔸¹_ℚ` at `t²+1` | `H¹(ℝ,ℤ/4)={0,2}`, both ↦ 0 in `H¹(ℝ,ℤ/2)`: no real object, `κ=ℝ`; base not a field; `κ=ℚ(i)` | holds | none |
| 5.4 algebraicity of points (headline) | glued `Spec k[x₁,…]`; `𝔸¹_ℚ/ℤ` | `𝒵=Spec A`, preimage `⋃D(xᵢ)` not qc; `t^{d−1}`-coefficient `a+dn≠a`: only nonempty open is the whole space | holds | none |
| 6.1 representative (sample) | `Spec κ`, `k/κ` Galois with group `Γ`; `BG_k`; `[𝔸¹/𝔾_m]` at 0 | `R_x=Γ×Spec k`, `G_x=1`, quotient `Spec κ`; `R_x=G`; `R_x=𝔾_m`, `𝒵=B𝔾_m` | holds | none |
| 6.2–6.3 (headline) | `[Spec ℂ/(ℤ/4)]`; `(t,−1)` over `ℚ(t)` | `𝒵×_ℝℂ≃B(ℤ/2)_ℂ`, not `𝒵`; tame residue at `t=0` is `−1∉ℚ^{×2}`; `t↦t²` gives split `(t²,−1)` | holds | none |
| 6.4 rational points (headline) | `Bμ_p/𝔽_p(t)`; `Spec κ`, `k=κ(√t)`; `Spec k[x₀,…]` | `G_x=μ_p` not smooth, `𝒵=BG_x`; degree 2, not iso, though `κ≅k` abstractly; origin lft, not lfp | holds | R02 |
| 7.1 neighbourhoods (sample) | `𝔸¹` at 0; `𝔸²` at 0; `BG` | lengths `1,2,3` (`ℐ^{n+1}`) vs `0,1,2` (`ℐ^n`); length 3; ideal 0 | holds | none |
| 7.2 normal space (sample) | `[𝔸¹/𝔾_m]`; `[𝔸ⁿ/GLₙ]`; `BG` | `ℐ/ℐ²=k·t` weight −1, `N` weight +1; `N=kⁿ` standard; `N=0` | holds | none |
| 7.3 tangent–normal sequence (headline) | `Bμ_p`; `[𝔸¹/μ_p]`; cusp; `[𝔸¹/𝔾_m]` | `(1+aε)^p=1`: `T=k`, `N=0`; `T=k²` = 1+1; cusp 2 = 0+2; `dim Lie−dim G`: `μ_p` 1−0, `𝔾_m` 1−1 | holds | none |
| 7.4 quotient stacks (sample) | `SL₂` on binary forms at `uv`; `E×𝔾_m` on `E×𝔸¹`; `ℤ` on `(ℤ×𝔸¹)⊔𝔸¹` | stabiliser = diagonal torus, antidiagonal: `uv↦−uv`; orbit dim 3−1=2; `d(disc)=2db≠0`; `N=k·∂_t` on both sides | holds | none |
| Convention 5/8 action | `[𝔸¹/𝔾_m]` at 0, `τ=bε` | `g·(τ,α)=(τ,α∘g⁻¹)` is a left action; class `gα⁻¹b`, weight +1 in both notations | consistent | none |

- About 110 source locators, covering all 15 seeded targets, were checked against the cached texts and all agree: stacks-04XE/06ML, stacks-06QB/06RD, stacks-decent-spaces, stacks-sheaves-on-stacks, stacks-algebraic-stacks, stacks-artin, stacks-formal-defos, stacks-morphisms-spaces, sga3-vi-a, ahr2020, alper-moduli, rydh2011.
- 41 Mathlib and Tau Ceti declarations were opened at the pins (Mathlib `1b1ccf4`, Tau Ceti `2fd255d`). Every file, line and fully qualified name cited in the README and the docstring is as stated.
- Cross-roadmap citations resolved on main: SchemeAndStackFoundations §§1.7–1.23, 4.8, 4.12, 4.13 (every name, including the 9 leads of citations.md); AlgebraicModuliForArithmeticGeometry §§4.1, 5.1, 5.4, 8.1, 8.3; ReductiveGroups Layers 1, 3 and 3A.
- Consumer sections resolved: LanglandsParameterStacks §1.16, MotivicStructuresInModuliOfCurves §§7.3, 8.4, 8.6, VirtualFundamentalClasses §1.2, FunctionFieldArithmeticPartII line 53.
- All 17 gap slugs appear in both `design/plan.json` and the README, each with one named supplier. None asks for what main's suppliers, Mathlib (`ResidueField.lean`, `AlgClosed/Basic.lean`) or Tau Ceti already provide.
- The gate, re-run at 3688535, reports OK with every check at 0.
- Dependency check: `depcheck: 241 roadmaps, 2261 edges, 0 problem(s)`.
- `lake env lean Suggested.lean` printed nothing and exited 0. The file has no declarations to `#check` or probe. Every headline needs an algebraic stack, and the pins have none: `SchPseudofunctor` (`Stack/Basic.lean:37`), `IsStack` (`IsStack.lean:49`) and `IsAlgebraicSpace` (`AlgebraicSpace/Basic.lean:195`) are as the docstring says, and the only "inertia" hits are Galois inertia.

Overlap check: read SchemeAndStackFoundations (main and its open revision), GroupSchemesOverABase, NashBlowups, VirtualFundamentalClass, PurityForFlatCohomology, AlgebraicModuliForArithmeticGeometry and EquivariantIntersectionTheory. Shared objects and their owners:
- locally Noetherian stacks: SchemeAndStackFoundations §1.20 (cited, 0.1);
- site-level gerbes: AlgebraicModuli §4.1 (cited);
- rigidification by the whole inertia: AlgebraicModuli §5.1 (not related here: R01);
- representability of `G/H`: ReductiveGroups Layer 3 through a declared gap (GroupSchemesOverABase §4.1 is not an earlier supplier);
- closed substacks: owned here; the board package VirtualFundamentalClasses §1.2 restates them for Deligne–Mumford stacks and is later in the merge order.

Nothing else is shared.

Source independence: 26 passages compared with 7 sources. The longest run shared with any source is 12 words, each such run a list of equivalent conditions, a hypothesis list or a bibliographic title. The largest share of locators is stacks-06QB/06RD (Morphisms of Stacks), about 134 of about 350. Contents compared with Ch. 101: independent. Layer 1 ↔ §§101.18–19, Layer 2 ↔ §§101.28–29, Layer 4 ↔ 101.18.7, 101.28.15, §101.31, 101.51.4, Layer 5 ↔ §101.48, 101.51.2, 101.50.2; Layers 0 and 3 come from Ch. 100; Layers 6–7 are the roadmap's own. The order inside each layer is forced by its *Needs:* lines (2.2→2.1, 2.3→2.1–2.2, 2.4→2.1–2.3, 2.5→2.4, 2.6→2.4; 3.2→3.1, …, 3.5→3.4).

## Not verifiable

- lmb2000, Chapter 11, Définition 11.2 (cited in 5.5): the manifest records it as uncertified (paywalled); it is cited by locator only and was not read.

## Source issues

- **Misprint** in alper-moduli at Exercise 4.5.11(a), printed p. 139: the source says the stabiliser acts by `g ∘ α`, although Definition 4.5.7 (p. 138) takes `α` from `x` to `τ|_k`, so the composite is undefined; it should be `α ∘ g⁻¹` (equivalently `g ∘ α⁻¹` on the inverse framing); affects nothing.

## For the human reviewers

- AlgebraicModuliForArithmeticGeometry §5.4 (main, 37th in the merge order) uses closed substacks of Deligne–Mumford stacks without defining them. This roadmap (38th) is their only owner: README lines 65–66 record it, and main's README line 8710 shows the use.
