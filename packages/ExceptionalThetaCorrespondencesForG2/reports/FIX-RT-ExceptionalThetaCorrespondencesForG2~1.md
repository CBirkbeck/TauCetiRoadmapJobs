# Repair findings: exceptional theta correspondences for G₂ (red team round 1, passes a and b)

The two passes number their findings independently (F01–F06 in pass a, F01–F04 in pass b). Their findings do not overlap in substance, so each is settled once, under its own pass heading.

# Pass a

## F01 (P2) — disputed

The finding asks to put the §0.2 null-subspace bound and the two transitivity statements back into Suggested.lean as acceptance theorems. They are statable at the pins, but they are not headline theorems. The Summary names the end results: finite-length big lifts, the Howe duality theorems, the dichotomy, the lift tables, the trichotomy, period nonvanishing and cuspidality. §0.2 is a Layer 0 input, consumed by §§0.3, 3.2 and 3.6–3.8. The brief limits Suggested.lean to the deep results the roadmap is built to reach. Input statements stay in the README as targets. These five declarations (`IsOctonionAutomorphism`, `IsNullSubspace`, `nullSubspace_finrank_le_two`, `nullSubspace_transitive`, `nullFlag_transitive`) were in the original package. An earlier independent review had them deleted on exactly this ground (see the round-2 package report). Putting them back would reverse that decision. The prose targets in §0.2, with their hypotheses, locators and Checks, are unchanged. The docstring says that no *headline* theorem is statable, and that remains true. If this is raised again, a human should decide.

## F02 (P1) — applied

Old: §4.3 used RD(E)|G₂=πdeg[1]⊕supercuspidal, which only §5.1 supplied, and §5.1 depends on §4.8→§4.7→§4.3. New §3.12 (Sav Prop. 5.1, Cor. 5.2, §6; GS Prop. 7.1(i)–(ii)) decomposes the division minimal model without Howe duality or periods. §4.3 now states and derives RD(E)≅πdeg[1]⊕C_E. §5.1 consumes §3.12; only its irreducibility and injectivity use §4.8.

## F03 (P1) — applied

Old: "AL.4 for unramified L-group Euler factors and the degree-eight spin representation". New: AL.4 supplies det(1−T r(t)) for a supplied r. Here r is the spin representation from RepresentationTheory/SpinRepresentations Layer 4 (main, line 665), of dimension 1+3+3+1=8. The witness is (1−T)⁸ versus 1−T. The same supplier was added to the §8.9 Needs line and the Layer 8 Dependencies.

## F04 (P1) — applied

Added gap `prime-degree-torus-distinction` (SmoothRepresentationsOfLocalGroupsPartII, SRU.3) to the README contracts and the plan's `gaps`. It covers representations of dimension greater than one (LT lines 309–330). §5.2 proves the one-dimensional χ∘Nrd case by local existence (the cyclic cubic E with N(E×)=ker χ). It cites ClassFieldTheory Layers 5 and 8, and a Check was added.

## F05 (P3) — applied

The §6.1 Check was false. ω⁻χ with χ≠1 has Whittaker support a_χF×², which omits 1, so its split SO₃ lift is 0 and its anisotropic lift is χ∘Nrd (GG lines 745–799, read). The Check now separates ω⁻ with trivial χ (lift St) from ω⁻χ, which only the hypothesis excludes. §8.5's exclusion sentence and Check now give the reason: the JL antecedent is St⊗χ, not a supercuspidal.

## F06 (P3) — applied

§1.8 has two new Checks. Unipotent-radical invariants of every proper parabolic are 0 for the cuspidal types and 1 for the trivial type. The K-supported functions give a nonzero copy of σ, and there are no K-fixed vectors. §10.1 has two new Checks. The first is the dimension count 27+79+27=133 versus 15+36+15=66 (D₆), with the branching 133=14+21+7·14 (∧²₀). The second covers the frame products and N(diag(1,2,3))=6, with homogeneity excluding N².

# Pass b

## F01 (P2) — applied

§1.12 now states that I₃(σ×1) is irreducible for every unitary discrete series σ of PGL₂ (σ supercuspidal with ωσ=1, or stχ with χ²=1). The supercuspidal case is §1.11 at s=0. The Steinberg case has trivial R-group: L(2s,1) has a pole at 0, and the trivial principal series π(1,1) of PGL₂ is irreducible. §8.2 now cites §1.12. `gap:rank-one-plancherel` (README and plan) now covers Levi maximal parabolics and the commuting-algebra theorem. §1.11's route uses induction in stages.

## F02 (P3) — applied

"imported from Metaplectic MP.3" → "imported from MetaplecticAutomorphicForms §3.39". Checked: the MetaplecticAutomorphicForms README at its head contains no "MP.3", and its §3.39 is "Minimal orthogonal theta lift". There is no other MP.3 occurrence in this roadmap.

## F03 (P3) — applied

Recomputed: the P₁ radical is Hom(⟨e₂..e₅⟩,e₁)⊕Hom(e₆,e₁), with determinant t⁴ν⁻²·t²ν⁻¹=t⁶ν⁻³. In the coordinate (t/ν)h on ⟨x12,…,x15⟩ this is (t²/ν)³. In the coordinate t⁻¹h on ⟨x26,…,x56⟩ it is |ν/t²|⁻³. §0.9 now fixes M₁≅GSp₄ by the ⟨x12,…,x15⟩ coordinate. Its Check records the value q³ in the other coordinate.

## F04 (P3) — applied

"the E₆ outer extension adds two components" → "the E₆ outer extension E₆⋊C₂ has two components (one added by the involution)". §0.5 already said this correctly. There is no other occurrence.

## Checks

- **Suggested.lean elaboration:** ran `lake env lean` on packages/ExceptionalThetaCorrespondencesForG2/Suggested.lean from the content checkout. Exit 0, no output. The file is unchanged: `import Mathlib`, the module docstring and an empty namespace. No Tau Ceti module was needed.
- **Elaborated signatures:** the file declares nothing, so the `#check @name` comparison has nothing to compare. No binder changed.
- **Dependency check:** `depcheck: 56 roadmaps, 652 edges, 0 problem(s)`. There is no UPWARD, CYCLE or moved line.
- **Citation resolver:** "Lean names found nowhere: None." No cross-roadmap citation is unresolved.
- **README/Lean gate scanners:** ran on a scratch copy of the README and Suggested.lean. residue, tex, latex, prnum, private-paths, imports, sorry-data, long-fences, layer-ids, target-ids and depcheck all report 0. The only failures were metadata and git, which come from the scratch layout and not from the package.
- **Earlier attempt:** its README, sources.toml and plan gaps were put back after re-verification. Its two failures are repaired. The report now has one heading per finding id. In the §1.12 parameter Check the process word "packet" became "the tempered parameter has a single member". "either proper parabolic" in §1.8 became "every proper parabolic".

## Adversarial pass on new or changed statements

| Statement | Instances | Computed values | Result |
|---|---|---|---|
| §3.12 decomposition | τ=1, τ≠1, split model | dim 1^(PE×)=1; Sav Cor. 5.2 gives Π_U=(πdeg[1])_U along both radicals, so the complement of πdeg[1] in Π_D has Jacquet modules 0; split model (§3.3) has 2 regular GL₂ pieces | consistent; split model excluded by a Check |
| §4.3 RD(E) | E a cubic field; E a nonfield | πdeg[1] has multiplicity 1; for a nonfield E, RD(E)=0 (§4.1, Sav Ex. 5.5(3)) | consistent with §§4.1–4.2 |
| §4.3 Ext of C_E | G₂ has trivial center and no unramified characters | each cuspidal block is semisimple, so each summand is projective; Ext¹(⊕A_i,π)=∏Ext¹(A_i,π)=0 | holds for every π |
| §5.2 characters | χ=1; unramified cubic χ; totally ramified E′ | Nrd(a)=a³ on F× forces χ³=1; ker χ = valuations in 3ℤ = N(unramified E×); on E′ the norm of the uniformizer has valuation 1, so χ∘Nrd≠1 | the choice of E depends on χ |
| torus-distinction gap | ℓ=3: E unramified/K ramified; E ramified/K unramified; ℓ=p | q^{(ℓ−1)(ℓ−2)m/2}=q^m=2 at q=2,m=1; q^{(ℓ−1)(…)}≥1; ℓ=p excluded | some K always gives a positive dimension |
| §1.12 st×1 | χ=1, χ quadratic; σ supercuspidal | 7-dim parameter 2·Sp₂⊕3·1; centralizer Sp₂×SO₃ connected; W(σ⊗1)=(Z/2)², both reflections have μ(0)=0 | 1 constituent versus 2 for a selfdual discrete series |
| §1.12 coverage | φ₀⊕1 | φ₀ irreducible with det 1 (ωσ=1), Sp₂⊗χ with χ²=1, or χ⊕χ⁻¹ (Borel case) | complete |
| §0.9 M₁ coordinate | t=1, ν=ϖ | (t²/ν)³ gives q⁻³; (ν/t²)⁻³ gives q³ | convention fixed |
| §6.1 odd Weil | a_χ∈F×² versus a_χ∉F×² | 1∈F×²: lift St; 1∉a_χF×²: split lift 0, θ′=χ∘N | old Check false, corrected |
| §8.5 exclusion | ω⁻ trivial χ; ω⁻χ, χ≠1 | θ′(ω⁻)=0 since 1∈F̂; θ′(ω⁻χ)=χ∘N is one-dimensional, so not JL(ρ) | 0 admitted odd inputs |
| §1.8 types | σ cuspidal unipotent; σ=1 | U-invariants 0 versus 1; K-fixed 0 versus 1; evaluation at 1 recovers σ≠0 | the label permutation alone is no longer the only test |
| §10.1 dimensions | Albert; H₃(quaternions) | 27+79+27=133; 15+36+15=66; 14+21+98=133 with ∧²₀ (−1∈Sp₆ trivial) | ∧³₀ would not descend to PGSp₆ |
| §10.1 norm | diag(1,2,3); N² | 6 versus 36; N²(2·1)=64≠8 | homogeneity excludes N² |
| AL.4 spin | r=spin; r=trivial | (1−T)⁸ versus (1−T) at t=1 | r is pinned by SpinRepresentations Layer 4 |

## For the maintainer

- Two supplier gaps in the README and in `design/plan.json` (`gaps` only) are owed by SmoothRepresentationsOfLocalGroupsPartII SRU.3. `rank-one-plancherel` is widened and `prime-degree-torus-distinction` is new. That design does not yet contain either statement.
- New prose target §3.12 (Layer 3). No Lean name was added or removed, and no name cited by another roadmap changed.
- New suppliers cited, both on main: RepresentationTheory/SpinRepresentations Layer 4, and ClassFieldTheory Layers 5 and 8.
- sources.toml: GG's locator adds §6 (Props. 6.5, 6.8, 6.11). Sav's locator names Prop. 5.1 and Cor. 5.2, and its cited_for adds `division-ext-vanishing`. No new source was needed, so no references were requested.
- Ownership was checked against main, the board packages and the open pull-request heads through the roadmap service. No other roadmap owns the division-model decomposition or the torus-distinction theorem. No suspicious instructions were found in either review.
