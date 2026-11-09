# Review of GlobalGaloisDeformationsPartII (pull request #1837 at b362276)

**Verdict:** needs changes

Incremental re-review of the 103 lines changed since 837c272 (the diff of `README.md` and `Suggested.lean`; nothing changed outside the folder). The five findings of the r7 review are accounted for under `## Previous findings`; four are repaired, one is partly repaired and carried as R02. One repair introduced a false sentence in a new Check (R01).

## R01 (P3) — The last Check of §4.4 claims the all-degree conclusion for every finite Γ, which fails in degree zero

**Location.** `TauCetiRoadmap/GlobalGaloisDeformationsPartII/README.md:922`: "For every finite Γ the hypothesis forces V=0. The conclusion still holds for finite Γ, every class being killed by |Γ|, so the hypothesis is sufficient and not necessary."

**Claim.** For every finite Γ the conclusion of the all-degree theorem (one power of ϖ kills `H^i(Γ,V/ϖʳ)` for every i≥0 and every r) holds, because |Γ| kills every class.

**Witness.** Take Γ the trivial group (dimension 0, Lie algebra 0, semisimple), O=V=ℤ₃. Then `H⁰(Γ,ℤ/3ʳ)=ℤ/3ʳ`, of exponent 3ʳ, unbounded in r, and |Γ|=1 kills nothing. The theorem `uniformTorsion` (`Suggested.lean:152`) quantifies over `∀ n r`, so n=0 is part of its conclusion; |Γ| kills `H^i` only for i≥1.

The example the Check actually computes is fine: for Γ=C₃ on O=ℤ₃[ζ₃], `H⁰(C₃,O/ϖʳ)={x : ϖx∈ϖʳO}=ϖ^{r−1}O/ϖʳO≅𝔽₃` for r≥1, and the positive degrees are killed by 3, so a=1 works there.

**Repair.** Replace the two quoted sentences by: "For every finite Γ the hypothesis forces V=0. For this Γ the conclusion still holds, with a=1: `H⁰(C₃,O/ϖʳ)=ϖ^{r−1}O/ϖʳO≅𝔽₃` for every r≥1, and every positive-degree class is killed by |Γ|=3; so the hypothesis is sufficient and not necessary. It cannot simply be dropped for finite groups: for the trivial group on ℤ₃, `H⁰(Γ,ℤ/3ʳ)=ℤ/3ʳ` has exponent 3ʳ." Tested on the two instances above: the C₃ computation gives exponent 3 in every degree, the trivial group gives exponent 3ʳ in degree 0.

## R02 (P3) — The Whitehead and generator citations follow main's Tau Ceti pin, not this branch's

**Location.** `README.md:64`: "`LieModule.Cohomology.exists_eq_lie_of_d₁₂_eq_zero` and `LieModule.Cohomology.exists_d₁₂_eq` in `TauCeti/Algebra/Lie/Whitehead.lean`" and "`TauCeti.UniversalEnvelopingAlgebra.ι_mem_augmentation` in `TauCeti/Algebra/Lie/UniversalEnveloping/Augmentation/Basic.lean`"; `README.md:15`: "The Whitehead lemmas in degrees one and two … are already in Tau Ceti"; also the `*Needs:*` lines at 924 and 999.

**Claim.** These declarations and files exist at the pinned Tau Ceti.

**Witness.** This head's `lake-manifest.json` pins Tau Ceti 358314d (Mathlib f6090c7); main pins 2fd255d (Mathlib 1b1ccf4). A two-way check of every backticked Tau Ceti name and file path in the README under both trees: 9 names and 9 paths exist at both pins; `Whitehead.lean` with its two lemmas, and `Augmentation/Basic.lean`, exist only at 2fd255d (`Whitehead.lean:105, 113`; at 358314d the generator lemma is at `UniversalEnveloping/Augmentation.lean:82`). The pull-request description does not say which pin the paths follow, as the r7 repair asked.

This is r7 R04, partly repaired: the Whitehead lemmas are now cited by name, correctly at 2fd255d, but the branch still pins 358314d.

**Repair.** Merge `origin/main` into the branch so that the manifest pins Tau Ceti 2fd255d and Mathlib 1b1ccf4; the folder is new, so the merge has no conflicts. I elaborated a copy of `Suggested.lean` against those pins from the main checkout: exit 0, only the two `sorry` warnings, so the targeted build stays green. If the merge is deferred, say in the description that the README's Tau Ceti citations follow main's pin 2fd255d and name the two files. No README text changes under either option.

## Previous findings

- R01 — repaired: `uniformTorsion` (`Suggested.lean:143–154`) states the all-degree theorem with `hfix` over `OpenSubgroup G`, G and V in `Type u`, and conclusion `∃ a, ∀ n r, (p^a : ℤ) • x = 0`; README §4.4 names it and states the equivalence with no 𝔤-invariants. The repair's new Check sentence is R01 above.
- R02 — repaired: `README.md:670` now requires L "linearly disjoint over K from the compositum of K∞ with the fields K_ψ cut out by all classes ψ∈`H¹(Γ_{F,T},M*)`", FKP22's hypothesis (line 531–533), with the separate-disjointness counterexample as a new Check (line 678).
- R03 — repaired: PL.7 is now PotentialAutomorphyInfrastructurePartII §8.17 with §§7.3, 7.4 and 7.14 (lines 19, 260, 1577–1586, 1620); ND.0 and the LocallyAnalyticDistributionsPartII subsection are gone, replaced by NoncommutativeAndEquivariantIwasawa §§0.2, 0.6 and 0.7 (lines 15, 172, 913, 924); NoncompactQuantumSymmetry is no longer cited (count 0).
- R04 — partly repaired: Whitehead is cited by name from Tau Ceti, but at main's pin, not the branch's; the description is silent on the pin. Carried as R02 above.
- R05 — repaired: the §0.7 Checks (lines 396–397) now compute K_z=ℚ(μ₉) for F=ℚ, p=3, and separates the quotient condition from a submodule condition with W and W′.

## Verified sound

**Gate.** The worker's gate at b362276 passes with every check 0, including the targeted build. I reran it on this head: `gate GlobalGaloisDeformationsPartII: set_option=0 blob=0 latex=0 tex=0 prnum=0 sorry-data=0 sorry-examples=0 residue=0 private-paths=0 imports=0 mathlib-subimports=0 no-import-mathlib=0 lean-lines=0 statement-hygiene=0 forbidden=0 dropped=0 readme-ids-missing=0 empty-sections=0 round-labels=0 long-fences=0 layer-ids=0 target-ids=0 depcheck=0 metadata=0 stray-files=0 dirty=0 outside-folder=0 source-material=0 build=0 OK`. `git diff --stat origin/main...HEAD` outside the folder is empty. The folder holds `README.md`, `Suggested.lean`, `metadata.toml`.

**Dependency check**, complete output: `depcheck: 238 roadmaps, 2322 edges, 0 problem(s)`. No UPWARD, CYCLE or moved line.

**Elaboration.** `lake env lean` on a scratch copy of `Suggested.lean` with six `#check @name` lines appended (`ModPow`, `modPowSub`, `modPowRep`, `modPowCont`, `uniformTorsion_H1`, `uniformTorsion`): exit 0 in 17.6 s apart from the probes below; the only messages for the file's own declarations are `declaration uses 'sorry'` at lines 125 and 143. Every binder stays in each declaration's own signature; `uniformTorsion` keeps `CompactSpace`, `IsTopologicalGroup`, `LieGroup … ω`, `LieAlgebra.IsSemisimple ℚ_[p] (GroupLieAlgebra …)`, `IsDomain`, `IsDiscreteValuationRing`, `Module.Finite ℤ_[p] O`, `Irreducible ϖ`, `Module.Finite O V`, `Module.Free O V`, `∀ r, ContinuousSMul G (ModPow ρ ϖ r)` and `hfix`, with `G V : Type u` as the README says. The worker's phantom `in` declaration is its parser reading the `module` header. The same copy elaborates against main's pins (Tau Ceti 2fd255d, Mathlib 1b1ccf4) in 8.7 s with the same two warnings.

**One-tactic probes on `uniformTorsion`** (scratch copy, same signature): `simp` made no progress; `⟨0, fun n r x => by simp⟩` left `x = 0`; `⟨0, fun n r x => Subsingleton.elim _ _⟩` failed to synthesize `Subsingleton`; `aesop` made no progress. It is not padding. `uniformTorsion_H1` was probed in r7 and is unchanged.

**Library declarations opened at the pins.** Mathlib f6090c7 (and 1b1ccf4): `TopRep` and `TopRep.of` (`RepresentationTheory/Continuous/TopRep.lean:31, 64`; `of` takes a `ContRepresentation` on a topological module with `ContinuousSMul k`, which the discrete `ModPow` has over ℤ); `ContRepresentation` (`Continuous/Basic.lean:54`); `continuousCohomology` (`ContCohomology/Basic.lean`, homogeneous cochains `C(G, C(G, …, M))`, so G and M share a universe, as the README's Conventions now say); `OpenSubgroup` (`Topology/Algebra/OpenSubgroup.lean:49`); `LieModule.Cohomology.d₁₂` and `twoCocycle` (`Algebra/Lie/Cochain.lean:101, 156` at both pins). Tau Ceti 2fd255d: `LieModule.Cohomology.exists_eq_lie_of_d₁₂_eq_zero` (`Algebra/Lie/Whitehead.lean:105`, conclusion `∃ m, ∀ x, f x = ⁅x, m⁆`) and `exists_d₁₂_eq` (`:113`), under `[Field K] [CharZero K] [IsKilling K L] [FiniteDimensional K L] [FiniteDimensional K M]` (`:70–72`), exactly the hypotheses README line 64 states. The two-way name and path check is in R02.

**Cross-roadmap citations resolved (the changed ones).** NoncommutativeAndEquivariantIwasawa at #1307: §0.2 "Compact p-adic analytic groups" proves every compact ℚ_p-analytic group has an open normal uniform subgroup; §0.6 "Ordered coordinates of a uniform group" gives `c : ℤ_p^d → U`; §0.7 "Finite-rank p-valuations and the explicit valuation of a uniform group" owns ordered bases, saturation and ω_U. PotentialAutomorphyInfrastructurePartII (board package): §8.17 "The ANT lifting theorem with weak primitivity" proves its §8.8 with weak primitivity; §7.3 "Primitivity below the characteristic" (semisimple ρ, 0<n<p, weak ⇔ strong); §7.4 (p∤n, strong primitivity invariant under image-preserving restriction); §7.14 (weak primitivity invariant, any field, any rank). All four match the README's descriptions at lines 19 and 260. The citations tool's one lead (§8.17 "found nowhere") is the board package, earlier in the merge order (line 278); not a finding. The overlaps tool reports no pull request changing this roadmap, no dropped id and no id defined only by an open revision; no declaration of `Suggested.lean` reuses a name declared elsewhere (checked `modPowCont`, `uniformTorsion` by grep over the open heads and main).

**Seeded sample.** Of the fifteen seeded targets, the diff touches none; their r7 verification stands. Locators the changed passages cite were re-read: FKP19 Lemma B.1 (line 2842, p.64: one exponent n for all i>0 and all m, matching `∃ a, ∀ n r`); FKP22 Proposition 3.6 (lines 531–533: "linearly disjoint over K from the composite of K∞ and the K_ψ"); Lazard65 III (3.1.3) (line 3305, printed p.91: an open subgroup with integer p-valuation, rank r, p-saturated) and (3.1.7.4) (line 3415, p.94: closed subgroups of p-valuable groups are p-valuable), both as the README now states them.

**Headline theorems.** Unchanged list (§6.3, §§6.5–6.6, §7.6, §8.5, §§8.10–8.11, §§9.2–9.5, §§10.1–10.3, §4.4). Both forms of §4.4 are now stated; the docstring names every other headline with the carrier it lacks. The pull-request description still says the degree-one form "is the one headline statable" (its line 22); that is data for the worker to refresh, not a folder finding.

**Adversarial table.** Rows for untouched statements are carried from r7 by name; rows for changed statements carry this round's values.

| Statement | Instances tried | Values computed | Result | Change |
|---|---|---|---|---|
| §0.7 Check 1 (new) | F=ℚ, p=3, ρ̄ trivial | K=ℚ(μ₃), μ₉⊄K so D=1; the class cutting out the cubic C⊂ℚ(μ₉) has kernel Γ_{KC} on Γ_K, KC=ℚ(μ₉)=K(μ₉), degree 3 | holds | none |
| §0.7 Check 2 (new) | W: 0→𝔽_p(χ)→W→𝔽_p→0; W′ reversed; Δ=𝔽_p⋊𝔽_p^× | trivial line T⊂W meets 𝔽_p(χ) in 0 (χ≠1), so W=T⊕𝔽_p(χ), split; f:W′→𝔽_p is iso on 𝔽_p (splits) or 0 there (factors through 𝔽_p(χ)→𝔽_p=0); nonsplit W exists: H¹(Δ,𝔽_p(χ))=Hom_{𝔽_p^×}(𝔽_p(χ),𝔽_p(χ))=𝔽_p≠0 | holds | none |
| §2.5 hypothesis (repaired) | FKP22 line 531–533 | source: disjoint from the composite of K∞ and the K_ψ; README: same, over all ψ (a special case of "any collection") | holds | none |
| §2.5 Check 3 (new) | Gal(K_ψ/K)=𝔽_p trivial conjugation, K_ψ∩K∞=K | Gal(K_ψK₁/K)=𝔽_p², Gal(K/F) acts trivially on both factors so H={(x,x)} is normal and L is Galois over F; Frob_v↦a−b with a=ψ(σ_v)≠0, b≠0 fixed by q_i; a−b=−b forces a=0; L⊂K_ψK₁ fails the compositum hypothesis | holds | none |
| §4.4 all-degree statement | FKP19 B.1 line 2845; Lean `∃ a, ∀ n r` | source: one n with ϖⁿ killing H^i(G,M/ϖ^m) for all i>0, m≥0; README adds i=0 via H⁰(U,V)=0 and `0→H^i(C)/ϖʳ→H^i(C⊗O/ϖʳ)→H^{i+1}(C)[ϖʳ]→0`; for i>d both ends vanish; A=max(a_i+a_{i+1}), then ϖ^A[Γ:U] by res∘cores=[Γ:U] | holds | none |
| §4.4 `hfix` ⇔ no 𝔤-invariants | open U⊃H small; v∈V⊗ℚ_p fixed by U | (V⊗ℚ_p)^U⊂(V⊗ℚ_p)^H=(V⊗ℚ_p)^𝔤 (NEI §0.13a item 3, n=0); a fixed rational vector has a nonzero multiple in V since V is torsion-free | holds | none |
| §4.4 Check 4 (new) | SL₂(ℤ₃) on ℤ₃² | (I+3ᵏE₁₂)(x,y)=(x+3ᵏy,y) fixed iff y=0; (I+3ᵏE₂₁) iff x=0; common fixed vectors 0; ef+fe+h²/2=E₁₁+E₂₂+I/2=(3/2)I | holds | none |
| §4.4 Check 5 (new) | SL₂(ℤ₃) on ℤ₃ trivial | H⁰=ℤ/3ʳ; H³(sl₂,ℚ₃) one-dimensional, Ad-invariant; H³(Γ,ℤ₃) rank 1 so H³(Γ,ℤ/3ʳ)⊇ℤ/3ʳ; hfix fails at U=⊤ | holds | none |
| §4.4 Check 6 (new) | C₃ on ℤ₃[ζ₃]; trivial group on ℤ₃ | C₃: H⁰(C₃,O/ϖʳ)=ϖ^{r−1}O/ϖʳO≅𝔽₃, positive degrees killed by 3, so a=1; trivial group: H⁰=ℤ/3ʳ, exponent 3ʳ, |Γ|=1 kills nothing | the general sentence fails in degree 0 | R01 |
| `uniformTorsion` universes and binders | `#check @uniformTorsion`; `{G V : Type u}` | elaborated type keeps all 12 hypotheses listed above; `continuousCohomology` needs G and M in one universe (iterated `C(G,·)`) | holds | none |
| Whitehead citation | Tau Ceti 2fd255d `Whitehead.lean:70–72, 105, 113` | hypotheses CharZero, IsKilling, FiniteDimensional L and M; conclusion f x=⁅x,m⁆ and twoCocycle=range d₁₂ | holds at 2fd255d, absent at 358314d | R02 |
| Lazard (3.1.3), (3.1.7.4) | lines 3305, 3415 | open subgroup with integer p-valuation, rank r, p-saturated; closed subgroup of p-valuable is p-valuable | holds | none |
| Supplier ids §8.17, §§7.3/7.4/7.14, NEI §0.6 | board package lines 2014, 1488, 1502, 1660; #1307 line 304 | headings and hypotheses as the README describes (n<p semisimple; p∤n; any rank; ordered coordinates ℤ_p^d→U) | holds | none |
| §0.4, §2.4, §2.6, §2.7, §2.8, §3.3, §3.5, §4.4 degree one, §4.5, §5.4, §7.2, §8.2, §10.1, §6.3, §8.5, §8.10, §8.11, §9.2 | as in r7 | values as computed in the r7 table (unchanged text) | hold | none |

**Declared gaps.** `design/plan.json` is unchanged since r7 (26 gaps, 26 README contracts); nothing in the diff touches a contract.

## Not verifiable

- Gur99 Theorem A, NSW08 Theorems 8.6.7, 8.6.10 and 8.7.9, and BC14 Lemma 10, Propositions 11 and 32 and Definitions 29–30 are settled as uncertified and cited by locator only; they were not read.
- Locators in passages the diff does not touch were not re-read this round; their r7 verification stands.

## Source issues

- none new this round. The FKP22 and FKP19 issues registered in the r5–r7 reports stand as registered.
