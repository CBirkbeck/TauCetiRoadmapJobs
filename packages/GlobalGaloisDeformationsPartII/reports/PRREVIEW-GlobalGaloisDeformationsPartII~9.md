# Review of GlobalGaloisDeformationsPartII (pull request #1837 at 3a70e41)

**Verdict:** needs changes

Incremental re-review of the 2 lines changed since b362276 (one Check bullet of §4.4 in `README.md`; `Suggested.lean` and everything outside the folder unchanged). The two findings of the r8 review are accounted for under `## Previous findings`: the first is repaired and the repair is correct; the second is unchanged and is carried as R01.

## R01 (P3) — The Whitehead and generator citations follow main's Tau Ceti pin, not this branch's

**Location.** `TauCetiRoadmap/GlobalGaloisDeformationsPartII/README.md:64`: "`LieModule.Cohomology.exists_eq_lie_of_d₁₂_eq_zero` and `LieModule.Cohomology.exists_d₁₂_eq` in `TauCeti/Algebra/Lie/Whitehead.lean`" and "`TauCeti.UniversalEnvelopingAlgebra.ι_mem_augmentation` in `TauCeti/Algebra/Lie/UniversalEnveloping/Augmentation/Basic.lean`"; the `*Needs:*` lines of §4.4 (line 924) and §4.5 name the two Whitehead lemmas again.

**Claim.** These declarations and files exist at the pinned Tau Ceti.

**Witness.** This head's `lake-manifest.json` still pins Tau Ceti 358314d (Mathlib f6090c7); main pins 2fd255d (Mathlib 1b1ccf4). Of the 11 Tau Ceti file paths the README cites, 9 exist at both pins; `Algebra/Lie/Whitehead.lean` (lemmas at its lines 105 and 113) and `UniversalEnveloping/Augmentation/Basic.lean` (generator lemma at its line 82) exist only at 2fd255d. At 358314d no file declares `exists_eq_lie_of_d₁₂_eq_zero` or `exists_d₁₂_eq`, and `ι_mem_augmentation` is at `UniversalEnveloping/Augmentation.lean:82`. The pull-request description does not say which pin the paths follow. The targeted build passes at 358314d only because `Suggested.lean` imports neither module.

This is r8 R02 (and r7 R04), not repaired: the commit since b362276 touches only the §4.4 Check.

**Repair.** Merge `origin/main` into the branch so that the manifest pins Tau Ceti 2fd255d and Mathlib 1b1ccf4; the folder is new, so the merge has no conflicts, and r8 recorded that `Suggested.lean` elaborates against those pins with only the two `sorry` warnings. If the merge is deferred, say in the description that the README's Tau Ceti citations follow main's pin 2fd255d and name the two files. No README text changes under either option.

## Previous findings

- R01 — repaired: `README.md:922` now reads "For this Γ the conclusion nevertheless holds, with a=1 … It cannot simply be dropped for finite groups: for the trivial group acting on V=ℤ₃, `H⁰(Γ,ℤ/3ʳ)=ℤ/3ʳ` has exponent 3ʳ … For finite Γ the conclusion holds exactly when V^Γ=0". Every new claim is computed below and holds; the repair introduced no new problem.
- R02 — not repaired: the manifest pins Tau Ceti 358314d and the description is silent on the pin; `Whitehead.lean` and `Augmentation/Basic.lean` are still cited as pinned. Carried as R01 above.

## Verified sound

**Gate.** The worker's gate at 3a70e41 passes with every check 0, including the targeted build. I reran it on this head with the build: `gate GlobalGaloisDeformationsPartII: set_option=0 blob=0 latex=0 tex=0 prnum=0 sorry-data=0 sorry-examples=0 residue=0 private-paths=0 imports=0 mathlib-subimports=0 no-import-mathlib=0 lean-lines=0 statement-hygiene=0 forbidden=0 dropped=0 readme-ids-missing=0 empty-sections=0 round-labels=0 long-fences=0 layer-ids=0 target-ids=0 depcheck=0 metadata=0 stray-files=0 dirty=0 outside-folder=0 source-material=0 build=0 OK`, exit 0. `git diff --stat origin/main...HEAD` outside the folder is empty. The folder holds `README.md`, `Suggested.lean`, `metadata.toml`.

**Dependency check**, complete output: `depcheck: 237 roadmaps, 2310 edges, 0 problem(s)`. No UPWARD, CYCLE or moved line.

**Elaboration.** `lake env lean` on a scratch copy of `Suggested.lean` (unchanged since r8) with six `#check @name` lines appended: exit 0 in 13.4 s; the only messages for the file's declarations are `declaration uses 'sorry'` at lines 125 and 143. The elaborated types agree with the worker's `signatures.md` and with the README: `uniformTorsion` keeps `CompactSpace`, `IsTopologicalGroup`, `LieGroup … ω`, `LieAlgebra.IsSemisimple ℚ_[p] (GroupLieAlgebra …)`, `IsDomain`, `IsDiscreteValuationRing`, `Module.Finite ℤ_[p] O`, `Irreducible ϖ`, `Module.Finite O V`, `Module.Free O V`, `∀ r, ContinuousSMul G (ModPow ρ ϖ r)` and `hfix : ∀ (U : OpenSubgroup G) v, (∀ g ∈ U, ρ g v = v) → v = 0`, with `G V : Type u`; `uniformTorsion_H1` the same without `hfix` and with `V` in its own universe. The worker's phantom `in` declaration at line 14 is its parser reading the `module` header. No binder is lost. The one-tactic probes of r7 and r8 stand, the Lean file being unchanged.

**The changed passage, computed.** Γ=C₃ on O=ℤ₃[ζ₃] by ζ₃, ϖ=ζ₃−1: `ϖ²=ζ₃²−2ζ₃+1=−3ζ₃`, so ϖ is a uniformiser with e=2 and 3=unit·ϖ². `H⁰(C₃,O/ϖʳ)={x : ϖx∈ϖʳO}/ϖʳO=ϖ^{r−1}O/ϖʳO≅O/ϖ=𝔽₃` for r≥1, killed by 3; H^i(C₃,·) for i≥1 killed by |C₃|=3; so a=1 and `uniformTorsion`'s conclusion holds although `hfix` fails at U=⊥ (open, Γ being discrete). Trivial group on ℤ₃: `H⁰=ℤ/3ʳ`, annihilator exactly 3ʳ, so no a works. The sequence `0→V^Γ/ϖʳV^Γ→H⁰(Γ,V/ϖʳ)→H¹(Γ,V)[ϖʳ]→0` is the long exact sequence of `0→V→V→V/ϖʳ→0` (ϖʳ injective since V is free over the domain O): the cokernel of ϖʳ on V^Γ, then the kernel of ϖʳ on H¹(Γ,V). Recomputed on both examples: for C₃, V^Γ=0 and `H¹(C₃,O)=ker(1+ζ₃+ζ₃²)/(ζ₃−1)O=O/ϖO=𝔽₃`, whose ϖʳ-torsion is all of it, giving 𝔽₃ as directly computed; for the trivial group, `V^Γ/3ʳV^Γ=ℤ/3ʳ` and H¹=0. "Exactly when V^Γ=0": if V^Γ≠0 it is a nonzero torsion-free finite O-module, hence free of rank k≥1, and `(O/ϖʳ)^k` contains an element of annihilator ϖʳ, unbounded in r; if V^Γ=0, H⁰ embeds in H¹(Γ,V), killed by |Γ|, and every positive degree is killed by |Γ|. A non-trivial a=0 case: C₂ by −1 on ℤ₃, V^Γ=0, `H⁰(C₂,ℤ/3ʳ)={x : 2x=0}=0`, positive degrees killed by the unit 2, so a=0. Consistent with the section's equivalence `hfix` ⇔ no 𝔤-invariants (𝔤=0 for finite Γ, so the invariants are all of V⊗ℚ₃) and with the sentence "includes the zero Lie algebra of a finite group" at line 907.

**Library declarations opened at the pins.** Tau Ceti 2fd255d: `LieModule.Cohomology.exists_eq_lie_of_d₁₂_eq_zero` (`Algebra/Lie/Whitehead.lean:105`) and `exists_d₁₂_eq` (`:113`); `TauCeti.UniversalEnvelopingAlgebra.ι_mem_augmentation` (`UniversalEnveloping/Augmentation/Basic.lean:82`). Tau Ceti 358314d: the same generator lemma at `UniversalEnveloping/Augmentation.lean:82`; no Whitehead file or lemma (R01). The remaining 9 cited Tau Ceti files exist at both pins. Mathlib declarations in the Lean (`TopRep.of`, `ContRepresentation`, `continuousCohomology`, `OpenSubgroup`, `LieGroup`, `GroupLieAlgebra`, `LieAlgebra.IsSemisimple`) were opened in r8 and the file is unchanged; they elaborate at 358314d/f6090c7 as above.

**Cross-roadmap citations.** The diff adds none; the citations tool's one lead (PotentialAutomorphyInfrastructurePartII §8.17 "found nowhere") is the board package, earlier in the merge order, as r8 resolved. The overlaps tool reports no pull request changing this roadmap, no dropped id, no id defined only by an open revision; the closest roadmaps in vocabulary (PotentialModularityAndCompatibleSystems, GL2ModularityLifting, PotentialAutomorphyInfrastructure, ModularityAndLanglandsExtensions, GlobalGaloisDeformations) are suppliers this roadmap cites, and the ownership comparison of r5–r8 stands. Ownership against the open pull requests whose files the brief gives was not re-checked beyond this; the diff states no new object.

**Seeded sample.** Of the fifteen seeded targets the diff touches only §4.4, and only its last Check. FKP19 Lemma B.1 was re-read (line 2842–2847, p.64): semisimple Lie algebra, O the integers of a finite extension of ℚ_p, M finite free with continuous O-linear action, no trivial 𝔤-constituent in M⊗ℚ_p; one n with ϖⁿ killing H^i(G,M/ϖ^m) for all i>0 and m≥0, and i=1 without the hypothesis. The README's degree-zero addition is the argument recomputed above in the finite case. The other fourteen targets' r7 verification stands.

**Headline theorems.** Unchanged list (§6.3, §§6.5–6.6, §7.6, §8.5, §§8.10–8.11, §§9.2–9.5, §§10.1–10.3, §4.4). Both forms of §4.4 are stated; the docstring (lines 22–26) names every other headline with the carrier it lacks. The pull-request description still says the degree-one form "is the one headline statable at the pins"; that is data for the worker to refresh, not a folder finding.

**Adversarial table.** Rows for untouched statements are carried from the r8 report by name; the row for the changed Check carries this round's values.

| Statement | Instances tried | Values computed | Result | Change |
|---|---|---|---|---|
| §4.4 Check 6 (changed) | C₃ by ζ₃ on ℤ₃[ζ₃]; trivial group on ℤ₃; C₂ by −1 on ℤ₃ | ϖ²=−3ζ₃; H⁰(C₃,O/ϖʳ)=ϖ^{r−1}O/ϖʳO≅𝔽₃, H¹(C₃,O)=O/ϖ=𝔽₃, a=1; trivial: H⁰=ℤ/3ʳ, annihilator 3ʳ; C₂: H⁰=0, a=0; sequence 0→V^Γ/ϖʳ→H⁰→H¹(Γ,V)[ϖʳ]→0 from ϖʳ injective on free V | holds, including "exactly when V^Γ=0" | none |
| §4.4 all-degree statement | as in r8 (FKP19 B.1 line 2845; `∃ a, ∀ n r`) | one n for all i>0, m≥0; degree zero via H⁰(U,V)=0 and the coefficient sequence; A=max(a_i+a_{i+1}); ϖ^A[Γ:U] by res∘cores | holds | none |
| §4.4 `hfix` ⇔ no 𝔤-invariants | as in r8 | (V⊗ℚ_p)^U⊂(V⊗ℚ_p)^𝔤 for small U; a fixed rational vector has a nonzero multiple in V | holds | none |
| §4.4 Checks 4, 5 | as in r8 (SL₂(ℤ₃) on ℤ₃² and on ℤ₃) | (I+3ᵏE₁₂)(x,y)=(x+3ᵏy,y); Casimir (3/2)I; H³(sl₂,ℚ₃) one-dimensional, H³(Γ,ℤ/3ʳ)⊇ℤ/3ʳ | hold | none |
| `uniformTorsion` universes and binders | `#check @uniformTorsion` this round | all 12 hypotheses present, `G V : Type u` | holds | none |
| Whitehead and generator citations | 2fd255d `Whitehead.lean:105, 113`, `Augmentation/Basic.lean:82`; 358314d `Augmentation.lean:82`, no Whitehead | names exist only at main's pin | absent at the branch pin | R01 |
| §0.7 Checks 1–2, §2.5 hypothesis and Check 3, Lazard (3.1.3)/(3.1.7.4), supplier ids §8.17, §§7.3/7.4/7.14, NEI §0.6 | as in r8 | values as in the r8 table (unchanged text) | hold | none |
| §0.4, §2.4, §2.6, §2.7, §2.8, §3.3, §3.5, §4.4 degree one, §4.5, §5.4, §7.2, §8.2, §10.1, §6.3, §8.5, §8.10, §8.11, §9.2 | as in r7 | values as in the r7 table (unchanged text) | hold | none |

**Declared gaps.** `design/plan.json` is unchanged (26 gaps, 26 README contracts); the diff touches no contract.

## Not verifiable

- Gur99 Theorem A, NSW08 Theorems 8.6.7, 8.6.10 and 8.7.9, and BC14 Lemma 10, Propositions 11 and 32 and Definitions 29–30 are settled as uncertified and cited by locator only; they were not read.
- Locators in passages the diff does not touch were not re-read this round; their r7 and r8 verification stands.

## Source issues

- none new this round. The FKP22 and FKP19 issues registered in the r5–r7 reports stand as registered.
