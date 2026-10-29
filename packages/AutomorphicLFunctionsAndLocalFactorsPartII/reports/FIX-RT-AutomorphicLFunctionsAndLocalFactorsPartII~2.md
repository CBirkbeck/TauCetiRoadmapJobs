# FIX-RT-AutomorphicLFunctionsAndLocalFactorsPartII~2

Two red-team reviews (pass a and pass b) give eight findings. None of them overlaps another, so each one is settled in its own section below.

## RT-AutomorphicLFunctionsAndLocalFactorsPartII~2a/F01 (P2) — applied

I checked the witness and it holds. Over ℚ₂, the embedded x has A⊕D matrix ((x+1,x−1),(x−1,x+1))/2. For the product lattice, the lower-row norm relative to the identity is 2·max(1,|x|) when x is a nonunit, so Z=1+2t³/(1−t)=3/2 and d₁Z=2. For the stabilizer K_W of ℤ₂⊕ℤ₂ in the original coordinates, the norm is max(1,|x|), so Z=(1+t)/(1−t)=3 and d₁Z=4. Both subgroups are hyperspecial and contain ι(ℤ₂×). EHLS line 2082 uses its integral model G₄(ℤ_ℓ).

What changed in §2.3:
- Old: "hyperspecial spherical section f°". New: K_W is the stabilizer of L⊕L in V⊕(−V), for a self-dual lattice L; K_W is transported to A⊕D through ι and the Haar measures.
- The qualifier "residue characteristic ≠2" is removed. The Iwasawa entries are now measured on L⊕L.
- A dyadic Check with both values was added to the Layer 2 Examples.

Same pattern elsewhere: §6.8 now fixes K_G=G(O) and K_H=H(O) in the coordinates of §0.3 and §5.3 (CFK line 568), and its Needs line now includes §5.3.

## RT-AutomorphicLFunctionsAndLocalFactorsPartII~2a/F02 (P3) — applied

The witness holds: with a=2, the two omissions give 1/2 and 2.

What changed in the §6.1 Check: old "omitting either factor leaves a" → new "omitting the coefficient multiplier leaves a⁻¹, omitting the section multiplier leaves a; with a=2 these are 1/2 and 2".

## RT-AutomorphicLFunctionsAndLocalFactorsPartII~2a/F03 (P3) — disputed

The Cauchy decomposition of §4.4 is not one of this roadmap's headline theorems.
- **It is a classical input.** GL_u×GL_u duality on polynomials on Mat_u is a textbook theorem of invariant theory (EHLS Lemma 4.4.8 quotes it as background).
- **It is not an end theorem.** It is consumed only by §§4.5–4.7. The Summary and the end theorems (doubling L-functions, entireness, weak and coarse transfer) do not mention it.
- **The acceptance file is not a catalogue.** Its rule asks for the deep results the roadmap is built to reach, not for every statable supporting lemma.
- **The other review agrees.** Pass b, in its round-1 re-verification row "a.F02", concurs that the absence is not a defect.

`Suggested.lean` keeps its docstring sentence naming §4.4 as a classical input and a README target.

## RT-AutomorphicLFunctionsAndLocalFactorsPartII~2a/F04 (P3) — applied

The finding is right: the classical root transform evaluates W(r_z), which uses δ and the Levi coordinates of the doubling geometric datum. That datum needs only §0.3 and §5.1.

What changed:
- The two subsections are swapped. Old §5.4 "generalized doubling geometric datum" is now §5.3; old §5.3 "root elimination" is now §5.4.
- Every internal single-section reference to §5.3 or §5.4 is renumbered: eleven occurrences across Layers 5–9. The `Suggested.lean` docstring now reads "§§5.1–5.2 and 5.4".

## RT-AutomorphicLFunctionsAndLocalFactorsPartII~2b/F01 (P3) — applied

The finding is right: §6.7 used the pair (α,β), which was first defined in §6.11.

What changed:
- The SO₂≅GL₁ and GSpin₂≅Gₘ×Gₘ identifications, the split-torus pair, the relations αβ=χ_π and α⊕β=r∘t_π, and the remark that the pair is unordered now sit in §0.3.
- Two §0.3 Checks were added. One uses GSpin₂ with χ_π(ϖ)=−1: det(α⊕β)=χ_π, while the pair (σ,σ⁻¹) gives 1.
- §6.7 now cites "the split-torus pair (α,β) of §0.3", and its Needs line adds §0.3.
- §6.11 now refers to §0.3 instead of repeating the identifications.

## RT-AutomorphicLFunctionsAndLocalFactorsPartII~2b/F02 (P3) — applied

The witness holds: CFK line 345 starts Theorem 2.1 and Definition 2.2 starts at line 356; EHLS line 1850 is in the §4.1 preamble and §4.1.1 starts at line 1862.

What changed: §10.1 now cites CFK line 356 (was 345), and §0.1 cites EHLS line 1862 (was 1850).

## RT-AutomorphicLFunctionsAndLocalFactorsPartII~2b/F03 (P3) — applied

The finding is right. MetaplecticAutomorphicForms §6.2 builds Siegel–Weil sections in I_n(s₀,χ_V). Its §3.3 requires the restriction of χ_V to F× to be ω^{dim V}, so the character χ=(ϑ,1) is excluded.

What changed:
- Scope, §1.3 and the MetaplecticAutomorphicForms supplier contract now restrict the identification with §6.2 to splitting characters χ_V. For general χ, §1.3 uses only the AutomorphicSpectralTheory specialization.
- The §6.2 parentheticals in §1.3's Needs line and in the Layer 1 dependencies now read "Siegel–Weil sections, for the splitting-character comparison".

## RT-AutomorphicLFunctionsAndLocalFactorsPartII~2b/F04 (P2) — applied

The finding is right: the old `needs` sentence named no field, groups or twist. The new sentence is identical in README "Exact supplier contracts" and in the `gaps` entry of `design/plan.json`:
- **Setting:** a nonarchimedean characteristic-zero field F; G_c = Sp_c, SO_c or GSpin_c with c>1; supercuspidal σ_i on GL_(β_i)(F) with Σβ_i=l and 2l≤c; a supercuspidal π₀ on G_(c−2l)(F).
- **Statement:** every irreducible subquotient of (σ₁×…×σ_d)⋊π₀ is a quotient of the induction from a Weyl-conjugate datum. The Weyl element permutes the blocks and replaces some σ_i by χ_π⊗σ_i∨.

The suggested route was corrected: second adjointness is SR.2a.1 in the supplier, not SR.2.2–2.3. The plan `section` changes from "SR.2, SR.3.3 and SR.5.3" to "SR.2, SR.2a, SR.3.1 and SR.3.3".

I checked the statement is true. A finite-length cuspidal Jacquet module along P̄ has an irreducible subrepresentation σ′. Second adjointness then makes π a quotient of i_P̄(σ′). Finally, the Levi GL_β×G is conjugate to its opposite by a Weyl element, which turns σ′ into the stated dual twist.

## Checks

- **Lean:** `lake env lean packages/AutomorphicLFunctionsAndLocalFactorsPartII/Suggested.lean`, run from the content checkout, exited 0 with no output. The file declares nothing, so the `#check @name` signature comparison had nothing to compare and was not run. The only change to the file is the section reference in its docstring.
- **Build warning repaired:** the targeted build warned that `Suggested.lean` imports `Mathlib`, which is designed for the module system, without declaring itself a module. The file now begins with a `module` line, then a blank line, then `import Mathlib`. Nothing else changed. The file declares nothing, so the module system's default privacy affects no declaration. The gate's import scanner does not treat `module` as a command, so `import Mathlib` still counts as the first import of the header. A second run of `lake env lean` on the file exited 0 with no output.
- **Dependency check:** `gate --depcheck … --movable` printed `depcheck: 201 roadmaps, 1421 edges, 0 problem(s)`. There is no UPWARD, CYCLE or moved line.
- **Citation resolver:** `roadmaps resolve` found no unresolved citations and no unresolved Lean names.
- **Ownership:** no new carrier was introduced. The new supplier references (MetaplecticAutomorphicForms §3.3, and SmoothRepresentationsOfLocalGroups SR.2a.1 and SR.3.1) were resolved at the heads given by the roadmap tool.

## Adversarial pass on changed statements

| Statement | Instances | Values | Result |
|---|---|---|---|
| §2.3 with K_W = Stab(L⊕L) | ℚ₂, split rank one, β=χ=1, s=1/2 | shells t^m; Z=3, d₁=4/3, product 4 = L = (1−1/2)⁻² | holds |
| §2.3, negative control | GL₂(ℤ₂) in A⊕D coordinates | shells t^(m+2); Z=3/2, product 2 ≠ 4 | excluded by the new hypothesis |
| §2.3, odd residue characteristic | ℚ₃, x=3 | A⊕D matrix ((2,1),(1,2)); 1/2 is a unit, so the two lattices coincide and both give Z=(1+t)/(1−t) | consistent with the old text |
| §2.3 β=i Check, unchanged | X=Y=−i/2 | (3/4+i)⁻¹ | still holds |
| §0.3 split-torus pair | GSpin₂: σ=1, χ_π(ϖ)=−1; SO₂: μ(ϖ)=2 | det(α⊕β)=χ_π, (−1 = −1); μμ⁻¹=1 | holds |
| §6.11 Checks after the move | values 4, 9/8, 81/52, 18/5 | unchanged, because the pair is unchanged | hold |
| §6.1 central Check | a=2 | omissions give 1/2 and 2; product 1 | holds |
| classical-support-quotient | d=0; Sp₂ with σ=χ (a character), π₀ trivial on Sp₀ | trivial case; St and 1 of SL₂ are quotients of χ⋊1 or χ∨⋊1 | holds |
| §1.3 splitting restriction | χ=(ϑ,1) on ℚ₃×ℚ₃ | χ(2,2)=−1, not a χ_V; the text claims nothing about §6.2 for it | consistent |
| Layer 5 order | new §5.3 needs §0.3 and §5.1; new §5.4 needs §5.2 and §5.3 | no forward reference left | holds |

## Notes for the maintainer

- **Section numbers changed.** §5.3 and §5.4 of this roadmap swap numbers: root elimination is now §5.4 and the geometric datum is now §5.3. No other roadmap cites these sections, as far as `roadmaps grep` shows.
- **The plan's node order no longer matches the README.** In the plan's `nodes` list, root elimination still comes before the geometric datum. This job may only edit the `gaps` list, so the nodes were left as they were.
- **Supplier contract made more precise.** MetaplecticAutomorphicForms §6.2 is now consumed only for splitting characters.
