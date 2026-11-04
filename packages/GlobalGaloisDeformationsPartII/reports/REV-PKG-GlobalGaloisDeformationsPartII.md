<!-- from @CBirkbeck, https://github.com/TauCetiProject/TauCetiRoadmapJobs/pull/1174#issuecomment-6386005327 -->
Review (claude) of 7ceac20

Verdict: needs changes

1. **F01** (P1) The design gap behind the doubling chain has no owner

   **Location.** `packages/GlobalGaloisDeformationsPartII/design/plan.json`, gap `auxiliary-field-independence`: it has no `supplier` and no `section`. `packages/GlobalGaloisDeformationsPartII/README.md` line 723: "The arithmetic target is to establish such a uniform ε and arbitrarily long finite test families for the cocycles used by doubling under C1,C3,C4".

   **Claim.** README lines 17 and 21 say that §3.2 "owns" the replacement, so the gap counts as closed.

   **Witness.** The plan still declares the slug with no supplier, and the README never cites `gap:auxiliary-field-independence`. No source proves the estimate: FKP22 derives it from Lemma 3.7 (FKP22 line 784 and FKP22 line 799), and Lemma 3.7 is false (verified below). §3.4 depends on it (README line 763), then §3.6 (line 791), then §6.3 (line 1062), then Layers 7–10.

   **Repair.** Give G1 an owner in `design/plan.json`: supplier `GlobalGaloisDeformationsPartII`, section `§3.2`, and as its needs the exact estimate of README lines 723 and 727 (a uniform ε, arbitrarily long test families, tuple density). If the design freeze forbids editing an existing gap entry, the board must hand this to a human. Do not cite §3.2's arithmetic half to FKP22 as if the source proves it; keep the FKP22 locator only for where the need arises.

   **Tested.** On the witness: after the repair, every gap entry the README relies on has a supplier and a section. The §2.9 counterexample rows below still refute Lemma 3.7 and leave §3.2's conditional density bound untouched.

2. **F02** (P1) Five superseded design gaps are still declared with no supplier

   **Location.** `design/plan.json` gaps `small-dimensional-finite-group-input`, `positive-characteristic-duality-contract`, `polarized-coefficient-convention`, `all-coefficient-place-monodromy` and `large-prime-reductive-group-inputs`. None has a `supplier` or a `section`.

   **Claim.** The package report says the six accepted design gap records "remain in the plan".

   **Witness.** The README cites none of these five slugs. Their content now lives in named contracts:
   - `gap:small-dimensional-finite-images` (line 106);
   - `gap:function-field-selmer-numerics` (line 77);
   - `gap:polarized-tangent-convention` (line 69);
   - `gap:all-place-symplectic-monodromy` (line 200);
   - the four ReductiveGroupsPartII RG2.1 gaps (lines 90–96).

   As they stand, the intake would announce five unowned gaps.

   **Repair.** For each entry, either set `supplier` and `section` to the contract that replaces it (G6 maps to the four RG2.1 slugs), or retire the entry. The package may only add gaps, so the intake or a human applies this.

   **Tested.** After the repair, every entry of `gaps` has a supplier and a section, and every slug the README uses is in the plan. The comparison script used for this review reports 17 matching named contracts today.

3. **F03** (P2) Two supplier citations name a section that does not state the cited result

   **(a) Location.** README line 19: "GlobalShtukasAndFunctionFieldLanglands GS.6 owns the global GLₙ Langlands correspondence; it is consumed in both directions." Line 190 addresses `gap:function-field-langlands-lattice-witness` to GS.6, “The global correspondence for GL_r”.

   **Witness.** At the board head e5b7994 of `packages/GlobalShtukasAndFunctionFieldLanglands/README.md`, GS.6 is titled "coefficient fields, companions and the GL_r excursion comparison". That roadmap's Scope gives L. Lafforgue's correspondence to AutomorphicLFunctionsAndLocalFactors §AL.3 and says that GS.6 restates none of it. AL.3's target "Leveled shtukas and ramified rank induction" (open head 5d22a23) constructs both directions.

   **Repair.**
   - Repoint line 19, the line 190 contract, the *Needs* of §§9.1–9.5 and the plan gap's supplier and section to AutomorphicLFunctionsAndLocalFactors §AL.3 ("Leveled shtukas and ramified rank induction"). It is earlier in the merge order (line 95 against 301).
   - Keep as gap needs only what AL.3 does not state: a finite coefficient field and retained stable-lattice reductions.

   **(b) Location.** README line 196: "together with Layer 5's quadratic-CM descent". Lines 19, 1523 and 1532 make the same citation.

   **Witness.** ModularityAndLanglandsExtensions Layer 5 (head 2d70821) consists of §§5.1–5.11 on generic transfer and frontier statements, and contains no CM descent. That roadmap imports cyclic base change and descent from EndoscopicTransferAndUnitaryTraceComparison §6.24 (head 40d60b6). That section in turn takes it from AutomorphicSpectralTheory §7.1, "Solvable GLₙ base change and descent" (head c5cfb92, merge order line 97).

   **Repair.** Cite AutomorphicSpectralTheory §7.1 for the descent from L′=LF′ to F′, then rerun the dependency check.

   **Tested.** Both replacement sections contain the cited statements at the heads given.

4. **F04** (P2) Vague or compound gap requests

   **Location.**
   - README line 92 (`gap:good-characteristic-centralizers`): "…under the stated non-torsion-prime hypotheses, centralizers of tori as Levi subgroups, and the torus/root/Weyl description needed for bounded powers of semisimple group elements."
   - Line 106 (`gap:small-dimensional-finite-images`): "…the precise small-dimensional complete-reducibility and character-twisted H¹ input used by FKP19 Lemma A.1 and the noninjective-Levi-projection argument, together with the Larsen–Pink normal series…"

   **Witness.** The hypotheses are referred to but never stated, the content is deferred to source proofs, and each sentence bundles three or four independent theorems. The sources state the hypotheses explicitly:
   - FKP19 Lemma A.1 needs p>2(dim gᵈᵉʳ+1) and no normal p-subgroup (FKP19 line 2706, FKP19 line 2720).
   - FKP19 Lemma A.2 needs p>5 and p∤n+1 in type Aₙ (FKP19 line 2723).
   - The bounded-power statement is FKP19 Lemma A.5 (FKP19 line 2791).

   Line 154 (`gap:full-torus-ordinary-character`) is likewise compound: a torus-character fix, ordinary and Steinberg conditions, and the GL₂ determinant normalisation.

   **Repair.** Split into one slug per export, with the hypotheses inline. For example:
   - nilpotent centralizer: for p>5 and p∤n+1 in type Aₙ, the centralizer of a nonzero nilpotent X is smooth and lies in a proper parabolic;
   - semisimple Lie centralizer: connected reductive, generated by T and the U_α with dα(X)=0;
   - torus centralizers are Levi subgroups;
   - bounded power: there is n_G with C_G(sⁿ) a Levi, n∣n_G;
   - twisted H¹ vanishing: finite Γ≤G(k) with O_p(Γ)=1 and p>2(dim gᵈᵉʳ+1) gives H¹(Γ,gᵈᵉʳ⊗χ)=0 for every χ;
   - the exact splitting statement used in the proof of FKP22 Corollary 8.3;
   - the Larsen–Pink normal series (LP11 Theorem 0.2, with the §12 bounds of p.1156).

   Split line 154 into its three exports. Record each new slug in `design/plan.json`.

   **Tested.** Each proposed sentence names its prime bound and its conclusion, checked against FKP19 lines 2706, 2723 and 2791.

5. **F05** (P3) §2.2 cites the wrong FKP19 lemma

   **Location.** README line 581: "(FKP22, Opening of §3 and Lemma 3.4 setup, pp.10–11; FKP19 Lemma 5.13, pp.38–39; FKP22 line 477.)"

   **Witness.** FKP19 Lemma 5.13 (FKP19 line 1723) prescribes the torus values of Frobenius at the doubling primes. Killing Sha¹ by trivial primes is FKP19 §5.1, p.27 (FKP19 line 1189).

   **Repair.** Replace "FKP19 Lemma 5.13, pp.38–39" with "FKP19 §5.1, p.27 (FKP19 line 1189)".

6. **F06** (P3) Other locator and generality slips in the sampled targets

   - **Line 727.** The tuple density is defined in the set-up before FKP19 Proposition 5.12, not in its proof: the definition is FKP19 line 1535 (p.34), the statement FKP19 line 1565 (p.35). Write "discussion preceding Proposition 5.12, p.34".
   - **Line 805.** Definition 6.2 and Lemma 6.3 are both on p.45 (FKP19 lines 2017 and 2028). Write "p.45".
   - **Line 880.** Definition 6.6 is on p.46 only.
   - **Line 375.** "In the adjoint case there is also n_G" is narrower than the source: FKP19 Lemma A.5 holds for every split connected reductive G (FKP19 line 2791). Drop "In the adjoint case" for n_G. Keep adjointness for a_G, whose proof uses it (FKP19 line 2820).
   - **Lines 684 and 693.** FKP19 Proposition 7.8 and Remark 7.9 are cited without pages. Add "pp.59–60 (FKP19 line 2653; FKP19 line 2676)".
   - **Lines 375 and 1002.** Remove the stray source keys in "(FKP19, FKP19 Lemmas …" and "(FKP22, FKP19 Claim 6.13 …".

7. **F07** (P3) §8.9: the Ribet10 exercise range does not match what is used

   **Location.** README line 1355 and the References entry at line 1568 ("§1.3, Exercises 1.5–1.9, p.8"); `sources.toml` Ribet10 `locator`.

   **Witness.**
   - Exercise 1.8 (subgroups, Ribet10 line 329) and Exercise 1.9 (the Iwahori example, Ribet10 line 335) support no claim of §8.9.
   - The coefficient-extension and subdivision claim corresponds to Exercise 1.10 (Ribet10 line 339).
   - The apartment route is the hint of Exercise 1.6(b) (Ribet10 line 318).

   **Repair.** Cite "§1.2, Proposition 1.4 and Lemmas 1.3–1.5, pp.6–7; §1.3, Exercises 1.5–1.7 and 1.10, p.8 (Ribet10 line 239; Ribet10 line 243; Ribet10 line 265; Ribet10 line 308; Ribet10 line 318; Ribet10 line 339)" at lines 1355 and 1568 and in the manifest locator. You may also record that FKP22 itself cites these notes as [Bel, §1] (FKP22 line 1686). The mathematical content of §8.9 is otherwise sound (see Verified sound).

8. **F08** (P3) Citation labels and library claims that do not match the cited object

   - **Line 856.** "NoncommutativeAndEquivariantIwasawa NE.0" and "AutomorphicFormsOnReductiveGroups AF.1a" are not labels in those roadmaps (heads 3ec4ff3 and c00e220), which use Layer 0 with §§0.2, 0.13, F.2, and Layer 1 respectively. Replace with "NoncommutativeAndEquivariantIwasawa §§0.13, F.2" and "AutomorphicFormsOnReductiveGroups Layer 1".
   - **Line 51.** "The arithmetic work specializes its family of restriction maps": `ContinuousCohomology.tateShafarevich` is a kernel on `Field.absoluteGaloisGroup K` (`Mathlib/RepresentationTheory/Homological/ContCohomology/Sha.lean:71`). It is not the Γ_{F,T} kernel Sha¹_T of §2.2. Name ArithmeticGaloisDuality R02.4.3's Ш¹_S as the carrier, and the Mathlib kernel as its absolute counterpart.
   - **Line 409, §1.4.** The first assertion is an instance of Mathlib's `CompositionSeries.jordan_holder` (`Mathlib/Order/JordanHolder.lean:454`). Cite it as the engine, applied to the lattice of Γ-stable normal subgroups.

9. **F09** (P3) Process narrative

   **Location.** Titles at lines 456 ("Corrected block criteria for GL_n"), 1193 ("The corrected torus criterion") and 1206 ("A corrected GSp₄ Siegel example"); "uncorrected" at line 528; "corrected" at lines 1210 and 1472; "demanding equal coefficients is a regression" at line 760.

   **Repair.**
   - Retitle: "Block criteria for GL_n", "The torus criterion", "A GSp₄ Siegel example".
   - Say what is meant mathematically, for example line 528: "the character det r would instead give c²".
   - Line 760: "requiring equal coefficients is false for p≠3".

   Corrections of the source belong in the source-issue register, not in titles.

10. **F10** (P3) Formatting and machine-readable gap references

   - **Line 839.** The code span is malformed (doubled backticks around the factor `|O/ϖ^r|^{[F_v:Q_p]dim Flag(G⁰)}`). Make it a single span.
   - **Eleven *Needs* lines** (791, 799, 919, 932, 940, 1088, 1109, 1163, 1225, 1504, 1553) write "gaps:root-cocycle-lattices, smooth-local-approximation". As a result `gap:root-cocycle-lattices` occurs with its prefix only once (line 150). Write "gap:root-cocycle-lattices and gap:smooth-local-approximation".
   - **Line 1348.** "forces t=s" uses an undefined s. Write "between the representations for t and s forces t=s".
   - **Line 1366.** Remove the repeated "ArithmeticGaloisRepresentations §1.11".
   - **Repeated Checks.** The fourth Check bullet in §§0.1–0.5, 1.3, 1.9, 2.1, 4.1 and 9.1 repeats the first three with numbers. Merge them so each bullet tests something new.

Five blocking findings (two P1, three P2) and six non-blocking notes (P3). The mathematics of the README holds up under the computed pass below, including the package's central claim that FKP22 Lemma 3.7 is false. The blocking items concern gap ownership, the content of `Suggested.lean`, and two supplier citations that name the wrong owner.

## R03 (P2, blocking under the project rule) — `Suggested.lean` states a non-headline lemma

**Location.** `packages/GlobalGaloisDeformationsPartII/Suggested.lean` lines 46–70 (`IsCharacterExtension`, `infinitely_many_actual_extensions`) and docstring lines 9–11: "The infinite-family theorem of Layer 8 is statable on native representations and native degree-one group cohomology."

**Claim.** This is the one headline theorem that is statable at the pins.

**Witness.**
- The source labels it Lemma 7.6 (FKP22 line 1666) and proves it in four lines by counting L×-orbits (FKP22 line 1672).
- It feeds only Remark 7.8 (README §8.11). README line 3 lists the end theorems, and §8.8 is not among them.
- The helper predicate restates Mathlib `CategoryTheory.ShortComplex.ShortExact` (`Mathlib/Algebra/Homology/ShortComplex/ShortExact.lean:34`), which Mathlib already uses on `Rep` (`Mathlib/RepresentationTheory/Homological/GroupCohomology/LongExactSequence.lean:43`).
- The one-tactic probes (`simp`, `infer_instance`) fail, so the theorem is not padding by that test. It is padding because it is not a headline.

The project rule makes a non-headline declaration blocking. The brief's default grade would be P3.

**Repair.**
- Delete both declarations from `Suggested.lean`.
- Replace docstring lines 9–11 with: no headline theorem is statable at the pins. Keep the list at lines 13–37, and add §6.6 to the geometric-lifts item.
- In the README, keep §8.8 as a prose target. Drop the backticked Lean names and the Lean-specific sentences: line 35 (last sentence), line 49 (last two sentences), line 214 (last sentence) and the `Suggested.lean` sentences of line 1333.

**Tested.** The resulting file, with `import Mathlib`, the docstring and the namespace only, elaborates with no message. `roadmaps resolve` then finds no orphan backticked name.

## Verified sound

### Principles and Lean form

- **Principles.** No sorry'd data, no `set_option` and no other-roadmap import. The single `import Mathlib` is correct. No computational algorithm and no copied source passage were found in the passages checked.
- **Elaboration.** `lake env lean` on `packages/GlobalGaloisDeformationsPartII/Suggested.lean`, run from the content checkout at Mathlib 6b7abb3c7686 and Tau Ceti a91d3aafa8cd, finished in 6 s. Its only message is `Suggested.lean:61:8: warning: declaration uses sorry`.
- **Binder audit.** One scratch file with `#check @IsCharacterExtension` and `#check @infinitely_many_actual_extensions`: the def keeps `[Field L] [Group Γ]`, and the theorem keeps `Field`, `Infinite`, `Group` and `Finite`. No binder was lost, and the generality equals README §8.8.
- **One-tactic probes.** On copies, `simp` leaves the goal unsolved and `infer_instance` fails (the goal is not a class). As stated, the theorem is true: two independent classes c₁, c₂ give a ↦ [c₁+a c₂], which is injective into P(H¹). Its hypothesis is not vacuous: H¹(S₃, 𝔽₃(sign)) has dimension 1, below the threshold.

### Headline theorems (step 7)

The README's headline theorems are:
- §3.6 controlled towers (FKP22 Theorem 4.4);
- §5.4 annihilation of relative Selmer groups;
- §6.3 the main lifting theorem (FKP22 Theorem 5.2), with §§6.4–6.6;
- §7.6 Levi-valued lifts (FKP22 Corollary 6.6);
- §8.5 reducible modularity (FKP22 Theorem 7.4) and §8.10 (Proposition 7.7);
- §§9.2–9.5 function-field automorphy (FKP22 Theorem 8.1, Corollaries 8.3–8.4);
- §§10.1–10.3 symplectic lifts (FKP22 Proposition 9.1).

None is statable at the pins. Mathlib and Tau Ceti have no G-valued Galois deformation carriers, no newform Galois representations, no Lafforgue attachments and no p-adic Hodge conditions. A scan of Tau Ceti for newform, deformation and automorphic carriers found only unrelated matches. The docstring's list of non-statable headlines is accurate, apart from omitting §6.6 (R03).

### Seeded source sample: 15 of 15 read

| Target | Locator read | Result |
|---|---|---|
| 0.5 | FKP22 §1.3 pp.6–8 (FKP22 line 272); Lemma 3.7 (FKP22 line 666); FKP19 Notation 5.1 p.25 (FKP19 line 1106) | Sound; definition of strong disjointness matches |
| 1.2 | FKP19 Lemmas A.3, A.5, A.6 (FKP19 lines 2771, 2791, 2812); LP11 Theorem 0.2 p.1106 (LP11 line 52); LP11 §12, p.1156 | Sound; README adds the needed large p; R07 narrowing note |
| 1.3 | FKP22 p.44 (FKP22 line 2001) | Sound; index misprint of the source corrected |
| 2.2 | FKP22 p.11 (FKP22 line 477) | Statement sound; FKP19 locator wrong (R06) |
| 2.7 | FKP22 p.15 (FKP22 line 657) | Sound: η=θ_b+θ_b^{(v)}, inertia e_b* at v and t_b, unramified at t₀ and at t_{b′} for b′≠b |
| 3.2 | FKP22 pp.17–19 (FKP22 line 830); FKP19 p.34 (FKP19 line 1535) | Abstract (1−ε)^s bound sound; locator note (R07); ownership R01 |
| 3.4 | FKP22 Proposition 3.8 (FKP22 lines 712, 756) | Sound; README correctly keeps −X and 2X distinct |
| 4.1 | FKP19 Definition 6.2, Lemma 6.3 (FKP19 lines 2017, 2028) | Sound; page note (R07) |
| 4.6 | FKP19 Definition 6.6 (FKP19 line 2077) | Sound: all four conditions match |
| 4.8 | FKP19 Proposition 4.7(3), Lemma 4.9 (FKP19 lines 1030, 1071) | Sound; size `|H⁰|·|O/ϖ^r|^{[F_v:Q_p]dim Flag}` matches dim(Res G⁰/B) |
| 5.5 | FKP19 Claim 6.13 (FKP19 lines 2296–2328); FKP22 p.24 (FKP22 line 1037) | Sound; stray key (R07) |
| 6.1 | FKP19 Claim 6.14 (FKP19 line 2386) and its footnote (FKP19 line 2441) | Sound; the buffer lifts need not be compatible, as stated |
| 8.5 | FKP22 Theorem 7.4 (FKP22 line 1601); Pan22 Theorem 1.0.2 (Pan22 line 100) | Sound; the Pan p=3 exclusion is on the ratio ω, so the scalar ratio 1 is admissible |
| 8.9 | Ribet10 Proposition 1.4, Lemmas 1.3–1.5, text pp.6–7 (Ribet10 lines 221–286); Exercises (Ribet10 lines 308–340); FKP22 Proposition 7.7 proof (FKP22 line 1681) | Sound (details below); exercise range (R08) |
| 9.1 | FKP22 §8 p.38 (FKP22 line 1717) | Sound: cuspidal π, finite-order central character, stable lattice, actual reduction |

### §8.9 against Ribet10 (local text)

- **Manifest.** Ribet10 is `licence_class = "operator-local"`, `status = "certified"`, and its sha256 matches the cached text.
- **The segment.** "Stable lattices form a finite segment": the fixed set is convex (Lemma 1.3, Ribet10 line 239); it is bounded when ρ is irreducible and K is complete (Lemma 1.5, Ribet10 line 265); and with χ₁≠χ₂ each vertex has at most two neighbours (Ribet10 line 283). Hence the fixed set is a finite segment.
- **Reductions.** By Lemma 1.4 (Ribet10 line 243), the endpoints are nonsplit and the interior vertices split. The opposite orientations at the two ends come from Remark 1.1 (Ribet10 line 225) and Exercise 1.5.
- **Apartment formula.** I recomputed it. ρ(g)e₁ lies in Λ_s if and only if v(c_g)≥s, and ρ(g)ϖ^s e₂ lies in Λ_s if and only if v(b_g)≥−s. The eigenprojectors (ρ(g₀)−λ₂)/(λ₁−λ₂) are integral because λ₁−λ₂ is a unit.
- **Example.** With bounds (2,1) one gets s∈{−2,…,1}: four vertices, endpoint off-diagonal ranks (1,0) and (0,1), interior (0,0). After ramification index 3 the range is −6..3: ten vertices, the endpoints are the scalar extensions, and the new interior lattices are split.
- **Misprints.** The README does not reproduce the source's misprints (see Source issues).

### The FKP22 Lemma 3.7 counterexamples (README §2.9), verified independently

- **C1 fails, C4 holds.** F=ℚ, trivial SL₂ image, k=𝔽_p, p≥5, M*=𝔽_p(κ̄)³. Then ζ_w=η₁^{(w)}−η₂^{(w)} has ζ_w(τ_w)=1−1=0, so ζ_w lies in the finite group H¹(Γ_{ℚ,T},𝔽_p(κ̄)). Pigeonhole gives ζ_w=ζ_{w′}, so the image of Γ_K in 𝔽_p⁴ lies in x₁−x₂−x₃+x₄=0, and strong disjointness fails. H¹(Gal(ℚ(μ_p)/ℚ),𝔽_p(κ̄))=0 because the order p−1 is prime to p. So C4 holds and C1 fails.
- **C1–C4 hold, repeated constituent.** For k=𝔽_p, a constituent W of multiplicity m≥2: the cyclic span of the tuple has W-multiplicity at most dim W, while the product has at least m·dim W. The quotient unramified at w lies in a fixed finite extension and repeats. FKP19 Proposition 7.8 and Remark 7.9 (FKP19 lines 2653 and 2676) give F₄-valued images A₆ and PSL₂(𝔽₁₃) with multiplicities above 1.
- **The source itself.** FKP22 §1.3 already notes that a k-basis loses disjointness when multiplicities exceed 1 (FKP22 line 322). No erratum was found on the authors' pages.

### Gaps: 17 named contracts, checked mechanically against `design/plan.json`

All 17 slugs and needs sentences match the README word for word. Each is minimal against the pins and the suppliers at their heads:
- ArithmeticGaloisDuality R02.5.1 is stated for number fields only, while R02.4.5 supplies only function-field Poitou–Tate and the Euler characteristic.
- GL2ModularityLifting §10.15 assumes CC1–CC5 and LC.
- ReductiveGroups Layer 5P (main) is characteristic zero only.
- Mathlib has only low-degree Lie cochains (`Mathlib/Algebra/Lie/Cochain.lean`) and no Whitehead lemma.
- ModularityAndLanglandsExtensions §2.28 does not state ι-ordinarity of the seed.
- BLGGT14 Lemma 5.3.1 (BLGGT14 line 3273) is a statement about components and multiplicity, as the README says.

The exceptions are R04 (wrong owner) and R05 (vague or compound).

### Supplier order and citations

Dependency check (verbatim): `depcheck: 34 roadmaps, 322 edges, 0 problem(s)`. There is no UPWARD, CYCLE or moved line.

Citations resolved at the heads used here:
- **GlobalGaloisDeformations** (b0adf32): Layer R04.3 §§3.3–3.8; G7 §§8.1–8.4.
- **ArithmeticGaloisDuality** (09ad340): R02.1.2, R02.1.3, R02.2.1, R02.3.1, R02.3.4, R02.4.3, R02.4.5, R02.5.1, R02.6.2, D7.4 and D7.7.1–D7.7.4. R02.6.2 is GL₂ Taylor–Wiles specific, so the README's distinction from §2.2 holds.
- **ReductiveGroupsPartII** (1383569): RG2.0.3, RG2.1, RG2.2.
- **ArithmeticGaloisRepresentations** (bef111d): §§1.1, 1.2, 1.6–1.11, Layer 2, §§7.2–7.7.
- **NoncommutativeAndEquivariantIwasawa** (3ec4ff3): §§0.2, 0.7, 0.13, F.2.
- **LocallyAnalyticDistributionsPartII** (board design): ND.0.
- **ArithmeticLocallySymmetricSpaces** (7dca7ea): ALS.F.5.
- **FunctionFieldArithmetic** (42f4779): §5.8.
- **LocalGaloisDeformationRings** (11b2c65): §§1.17, 1.20, 1.21, 1.22, 2.5, 2.14, 2.28, 2.30, 3.11, 6.5, 6.17, 8.5, 8.10.
- **AlgebraicModularFormsAndSerreWeights** (4e550b1): R15.4, R15.5, R15.5A.2–3, R15.6.
- **ClassicalSerreModularity** (6c79d1c): R27.6, full-classical-serre-theorem.
- **OrdinaryAutomorphicFormsAndModularityLifting** (faca0d2): §§5.2, 5.3.
- **GL2ModularityLifting** (1e734ab): §10.15.
- **ModularityAndLanglandsExtensions** (2d70821): §2.28, §2.48.
- **PotentialAutomorphyInfrastructurePartII** (board design): PL.6, and PL.7 source-primitive-ant-lifting.
- **AutomorphicGaloisRepresentationsPartII** (fb0a94c): AG2.5, AG2.6.
- **Main (eafdde4):** Chebotarev Layer 10; ClassFieldTheory Layers 7 and 13; ModularForms Layers 4, 8G and 10C; ProfiniteCohomology Layers 2–8; ProfiniteProPGroups Layer 3; ReductiveGroups Layers 2, 7 and 8.

Two citations drift (R04) and two labels drift (R09).

### Library declarations opened at the pins

- `Representation` (`Mathlib/RepresentationTheory/Basic.lean:48`) and `Representation.trivial` (`:61`)
- `Rep.of` (`Mathlib/RepresentationTheory/Rep/Basic.lean:62`)
- `groupCohomology.H1` (`…/GroupCohomology/LowDegree.lean:965`)
- `Representation.IntertwiningMap` (`Mathlib/RepresentationTheory/Intertwining.lean:36`) and `Representation.Equiv` (`:312`)
- `TopRep` (`Mathlib/RepresentationTheory/Continuous/TopRep.lean:31`)
- `continuousCohomology` (`…/ContCohomology/Basic.lean:131`)
- `ContinuousCohomology.tateShafarevich` (`…/ContCohomology/Sha.lean:71`)
- `Submodule.span` (`Mathlib/LinearAlgebra/Span/Defs.lean:46`), `subset_span` (`:75`), `span_le` (`:80`)
- `Submodule.map_span` (`Mathlib/LinearAlgebra/Span/Basic.lean:73`)
- `Submodule.map` (`Mathlib/Algebra/Module/Submodule/Map.lean:52`)
- `Subgroup.map`, whose additive version gives `AddSubgroup.map` (`Mathlib/Algebra/Group/Subgroup/Map.lean:112`)
- `IsAbelianGalois` (`Mathlib/FieldTheory/Galois/Abelian.lean:25`)
- `TauCeti.ContCohomology.H1` (`TauCeti/RepresentationTheory/Homological/ContCohomology/LowDegree.lean:712`)
- `TauCeti.ContCohomology.explicitInfRes_exact` (`…/ContCohomology/Inflation/Basic.lean:350`)

All the README's file attributions are correct.

### Duplication and ownership

I searched the roadmaps on main, the 338 open roadmap pull requests at their heads, and the board packages, by object rather than by name. Patterns:
- FKP19 and FKP22, and Fakhruddin;
- relative Selmer, doubling, Khare–Larsen–Ramakrishna, Hamblen;
- Ribet's lemma, stable-lattice segments and the Bruhat–Tits tree;
- good characteristic, Springer isomorphism and torsion primes;
- Whitehead and Chevalley–Eilenberg.

Results:
- No other owner of the cyclic ramification classes, doubling, relative Selmer annihilation, the stable-lattice segment or the Levi modification.
- ModularityAndLanglandsExtensions §2.28 is the automorphic seed, not the p-adic lift of §10.1.
- ReductiveGroupsPartII RG2.2 owns the tree, not Ribet's reductions.

The only duplication is the helper predicate of R03.

### Adversarial pass: one row per section, with computed values

| Statement | Instances tried | Values computed | Result | Change |
|---|---|---|---|---|
| Conventions: weights | n=1, ξ=0; GL₂ det κ; a=2, w=2 and w=−1 | ξ_{2n−i+1}+i−1 gives 0,1; κ⁻¹ weight 1; {0,−1}; {0,−1,2,3}; {0,−1,−1,0} | consistent | none |
| Conventions: pairing | u(σ)=t(τ)=1 | inv(u∪t)=−1, inv(t∪u)=1, u∪u=t∪t=0 (FKP19 line 857) | sign matches | none |
| Conventions: levels | e=2, D=1; e′=3 | eD+1=3; ϖ² becomes ϖ′⁶ | consistent | none |
| Dual twist (0.1, 0.3) | κ̄(g)=2 in 𝔽₅ | V*: 2; double twist: 4 | discriminates | none |
| 0.1 lifting datum | GL₂ at p=3; G_m | dim sl₂=3 vs gl₂=4; G_m: Lie Gᵈᵉʳ=0, lift = μ | sound | none |
| 0.2 oddness | diag(1,−1); I; G_m over an imaginary quadratic field | fixed dim 1 = flag; 3≠1; 0=0 but not totally real | sound | none |
| 0.3 C1–C4 | M=0; trivial 𝔽₃; trivial 𝔽₉ line | all hold; C1–C3 fail; two prime-field factors | sound | none |
| 0.4 trivial primes | p=3, N=7 and 5; Frobenius diag(1,2) | 7≡1, 5≡2; rank(g−1)=1 | sound | none |
| 0.5 cocycle fields | C₂², three lines | degree product 8, compositum 4 | sound | none |
| 0.6 abelian compositum | S₃ over its quadratic subfield | transposition sends (123) to (132) without the hypothesis | sound | none |
| 0.7 cyclotomic layer | p=3, D=1 | intersection degree 1 or 3, never 9 | sound | none |
| 1.1 irreducible images | SL₂(𝔽₁₁) | [h,E₁₂]=2E₁₂; bound p>8: 11 passes, 7 fails | sound | none |
| 1.2 cyclic quotients | torus over 𝔽_{11^r} | quotient 11^r−1, unbounded | sound | R07 (n_G generality) |
| 1.3 central Γ-series | C₉; 𝔽₉ with generator action | factors 3,3; one simple factor of dimension 2 | sound | none |
| 1.4 Jordan–Hölder | Heisenberg group of order 27 | three trivial factors; a central C₃ gives one | sound | R09 (cite Mathlib) |
| 1.5 cyclotomic exclusion | trivial adjoint, κ̄ of order 2 | values 1 vs −1 on a generator | sound | none |
| 1.6 abelian root subgroup | (1,3) block in SL₄ over 𝔽₅ | diag(3,−1,−1,−1) acts by 4; scalars by 0; at p=2, 2=0 | sound | none |
| 1.7 block criteria | κ̄, ψ of order 10; blocks κ̄ψ², κ̄ψ, 1 | intersection degrees 1,1,2; remaining 10,10,5; joint field gives 1; uAu⁻¹=diag(1,−1)−2E₁₂ | sound | R10 (title) |
| 1.8 maximal parabolics | Siegel radical, (I,2) over 𝔽₅ | acts by 2⁻¹=3 | sound | none |
| 1.9 property D | s=t=N=1, χ=κ̄; ord κ̄=5, N=4 | (1,0) gives equality, fails; orders 5>4 | sound | none |
| 1.10 separation | blocks of dimension 2 and 4 | primitive exponents 2,−1; c⁴c⁻⁴=1 vs c⁸ | sound | none |
| 1.11 GSp₄ | (cI,c²); χ=κ̄ | χ=1; a=−1 gives order 1 | sound | none |
| 1.12 Borel criteria | sl₃(𝔽₁₁), t=diag(2,6,1) | Ad(t)N=4E₁₂+6E₂₃; bracket with N is −2E₁₃ | sound | none |
| 2.1 orbit spans | 𝔽₉, trivial action | V₁ has 3 elements, V has 9, V₀ has 1 | sound | none |
| 2.2 Sha killing | an inflated class without C4 | restriction to Γ_K is 0 | sound | R06 |
| 2.3 stabilization | 𝔽₃[C₃²]/(x,y)² | dimension 3, socle 2; dual coinvariants 2, so not cyclic | sound | none |
| 2.4 one-prime sequence | Z=0; Z=1 in 𝔽₉ | target 1 element; 3 elements | sound (FKP22 line 497) | none |
| 2.5 spanning classes | cokernel 𝔽₃² | rank 2 vs 1 under repetition | sound | none |
| 2.6 prescribed vector | k=𝔽₉ | allowed nonzero values 2 vs 8 | sound | none |
| 2.7 marked classes | two basis indices | inertia at t_b gives rank-2 matrix vs rank 1 | sound | none |
| 2.8 inertia disjointness | three subfields of a C₃² extension | product 27, compositum 9 | sound | none |
| 2.9 joint criterion | counterexamples above | relation (1,−1,−1,1); multiplicity ≤dim W vs ≥m·dim W | sound | R01 |
| 3.1 lift mod ϖ² | square-zero ε | (1+εX)(1+εY)=1+ε(X+Y) | sound | none |
| 3.2 density | ε=1/2, s=4; alternating 0–1 sequences | 1/16<1/10 vs 1/2; limsup of the product is 0 | abstract bound sound | R01 |
| 3.3 local pairing | 𝔽₅ | values 4,1,0,0 | sound (FKP19 line 857) | none |
| 3.4 doubling | p=5, 3, 2 | (−1,2)=(4,2); (2,2); 2=0 at p=2 | sound | R10 (line 760) |
| 3.5 congruence field | trivial-conjugation quotient | excluded by C1 and C3 | sound | none |
| 3.6 towers | e=2, D=1, M=6 | cutoff 3 unchanged | sound (FKP22 line 908) | none |
| 4.1 relative images | a↦(a,0) on 𝔽₃; zero map | image 3 of 9; 1 | sound | R07 |
| 4.2 exactness | C₃ acting on ℤ/9 by 4 | δ(1): g↦(4−1)/3=1≠0, so not injective | sound | none |
| 4.3 balance | orders 81, 27 | 81/27=3 vs 81/9=9 | sound | R11 (code span) |
| 4.4 uniform torsion | ℤ₃ with trivial ℤ₃ coefficients; sl₂ | H¹=ℤ/3ʳ unbounded; H¹=H²=0 | sound (FKP19 line 2842) | none |
| 4.5 deep reduction | C₃ acting on ℤ₃[ζ₃] by ζ₃ | H¹(O/ϖʳ)=O/ϖ of order 3 for every r; residual invariants of dimension 1 | sound | none |
| 4.6 Q_N | O=ℤ₃, M=2 | v₃(18)=2, v₃(108)=3; G_m: Q_N empty | sound | R07 |
| 4.7 root conditions | SL₂ over ℤ/9 | local H¹ 9⁶; L 9³; unramified part 9²; quotient 9 | sound (FKP19 line 2096) | none |
| 4.8 smooth points | trivial point, degree-one place | 9³ vs 9³·9=9⁴ | sound | none |
| 5.1 splitting field | dual invariant line | Hom(𝔽₃,M*) of dimension 1 vs 0 | sound | none |
| 5.2 root position | sl₂ trace form | Gram determinant −2, which is 1 in 𝔽₃ and 0 in characteristic 2 | sound | none |
| 5.3 one prime | 𝔽₃² projections; r∈{0,1,2} | (1,1) works; r=2 gives values 2,1 | sound | none |
| 5.4 annihilation | orders 81→27 | measure decreases while the dimension stays fixed | sound | none |
| 5.5 factor orbits | two factors swapped by C₂ | fibre product 2 vs product 4 | sound | none |
| 6.1 finite set | n=3, M=2 | buffer at levels 5 and 6 | sound | none |
| 6.2 full image | ℤ₃ | Frattini quotient 3; ℤ dense but proper | sound (FKP19 line 2444) | none |
| 6.3 main theorem | G_m; GL₂; t=2, e′=3 | kernel size 1; Lie dimension 3; exponent 6 | statement sound (FKP22 line 1008) | R01 |
| 6.4 sl₂ case | p=3, p=2 | dα(h)=2; coefficients 2,2; vanishing at p=2 | sound (FKP22 line 1152) | none |
| 6.5 without oddness | GL₂ at a degree-one place | dimension 6 vs 4 | sound | none |
| 6.6 irreducible case | dihedral induction | invariant lines 0 vs 2 | sound | none |
| 7.1 lattice change | diag(t,t⁻¹), e′=3 | exponents 2 and 1, both positive | sound | none |
| 7.2 extension spaces | W⁰ of dimension 1 | +1 per prime; m>d+c | sound | none |
| 7.3 full radical | A=𝔽₃² | 9 vs 3 | sound | none |
| 7.4 local lifts | p=3, q=7 | x²=7, x≡1 mod 3; u(a)↦u(7a) | sound | none |
| 7.5 invariants | split torus plus root group | invariant dimension 1→0 | sound | none |
| 7.6 Levi lifts | even diagonal GL₂ | fixed dimension 3≠1 | sound | none |
| 7.7 torus criterion | quadratic χ in SL₂ | root χ²=1, invariant dimension 3 | sound | R10 (title) |
| 7.8 GSp₄ example | a=2, w∈{0,−1,−2,2} | repeated weights for w=0,−1,−2; distinct for w=2 | sound | R10 (title) |
| 8.1 actual modularity | I vs I+E₁₂ over 𝔽₃ | rank(g−I) 0 vs 1, both of trace 2 | sound | none |
| 8.2 nonsplit criteria | ⟨diag(−1,1), I+E₁₂⟩ over 𝔽₅ | commutant forces 2a=0, so invariant dimension 0 | sound | none |
| 8.3 determinant | Teichmüller factor | μ reduces to χ̄ | sound (FKP22 line 1627) | none |
| 8.4 semisimplification | as in 8.1 | traces agree, actual representations do not | sound | none |
| 8.5 reducible modularity | p=3, χ̄ of ℚ(√−2) | odd; −2≡1 mod 3 so trivial at 3; κ̄⁻¹=ω ramified | sound | none |
| 8.6 Hamblen–Ramakrishna | trivial 𝔽₉ line | two prime-field factors | sound | none |
| 8.7 totally real case | F=ℚ | abelian conditions hold | sound | none |
| 8.8 extensions | C₃² over 𝔽̄₃ and over 𝔽₃; C₃; S₃ sign | (1,t) inequivalent; P¹(𝔽₃) has 4 points; dimension 1 fails | true | R03 |
| 8.9 segment | bounds (2,1); e′=3 | 4 vertices, then 10; endpoint ranks (1,0) and (0,1) | sound | R08 |
| 8.10 finiteness | length 1, e′=2 | 2 classes, then 3 | sound (FKP22 line 1676) | none |
| 8.11 boundary | m newforms | at most 3m classes vs infinitely many | sound | none |
| 9.1 automorphy | 𝔽₉× Teichmüller; 1+3 | order divides 8; infinite order | sound | none |
| 9.2 lifting hypotheses | p=3, n=2 vs n=3 | squaring on 1+3ℤ₃ is bijective; cubing is not | sound (FKP22 line 1734) | R04 (owner) |
| 9.3 irreducible case | q≡−1 mod p | κ̄=±1 by parity of degree | sound | none |
| 9.4 two blocks | n₁=1, n₂=3 | exponents 3,−1; c³c⁻³=1 | sound | R04 (owner) |
| 9.5 direct sums | as in 1.7 | joint degree 1 | sound | R04 (owner) |
| 10.1 symplectic lifts | n=1, n=2 | weights 0,1 and 0,1,2,3; multiplier weights 1 and 3 | sound | none |
| 10.2 ANT application | swap vs individually polarized | diag(1,−1) fixed vs negated; dimensions 3 vs 4; ANT needs l>3 and l∤n (ANT20 line 66) | sound | none |
| 10.3 compatible system | Steinberg places with residue characteristics 2, 5 | ℓ=2 uses the place over 5; ranks 1 vs 2 for n=2 | sound | R04 (descent owner) |
| 10.4 conjectural scope | GL₂ with finite determinant | derived dimension 3 vs 4 | sound | none |

### Counts

- 15 seeded targets read;
- 17 named gaps checked, 6 unnamed gaps flagged;
- 66 supplier sections resolved, 4 drifts;
- 21 library declarations opened;
- 85 adversarial rows.

## Not verifiable

- **BC14** (Lemma 10, Proposition 11, Definitions 29–30, Proposition 32): uncertified and paywalled; the text was not read. §8.9 rests on Ribet10 and FKP22 instead.
- **Gur99, Theorem A**: uncertified; not read. The exact hypotheses of the small-dimensional input (R05) can therefore be fixed only through FKP19 Lemma A.1 as used.
- **NSW08, Theorems 8.6.7, 8.6.10 and 8.7.9**: uncertified. FKP22 cites the first edition under these numbers (FKP22 line 436); agreement with the second edition's numbering was not checked.
- **Pan22, Theorem 1.0.2**: the text extraction drops the inverse exponent in the p=3 exclusion (Pan22 line 103). The ratio reading follows GL2ModularityLifting §10.15 and the sense of the theorem; the PDF typography was not checked.
- **Outside the seeded sample**: the locators of Lazard65, BLGHT11, BLGGT14 Proposition 3.1.1 and Theorems 3.1.2 and 5.5.1 were not re-read. BLGGT14 Lemma 5.3.1 and ANT20 Theorem 1.1 were read.

## Source issues

- **Misprint** in Ribet10 at §1.2, discussion after Lemma 1.5, p.7: the source calls the endpoint reduction reducible but not indecomposable; it should be reducible and indecomposable, a nonsplit extension, as Lemma 1.4(b) gives; affects nothing.
- **Misprint** in Ribet10 at §1.2, final paragraph, p.7: the source gives the same orientation, χ₁ by χ₂, at both endpoints; it should be χ₂ by χ₁ at the second endpoint, as Remark 1.1 says; affects nothing.
- **Misprint** in Ribet10 at Exercise 1.6(b), p.8: the source asks to show that the segment length l equals n+1; with length counted in edges, Exercises 1.7 and 1.9 force l=n, meaning the fixed set has n+1 vertices; affects nothing.
- **Misprint** in Ribet10 at §1.2, p.7 and Exercise 1.9, p.8: the fixed-point set is called S; it should be C, the notation introduced before Lemma 1.3; affects nothing.
- **Error** in FKP22 at Lemma 3.7, pp.15–16: the source asserts strong disjointness of all K_{η_b^{(v)}} as v and b vary; it should assume that the conjugates of joint inertia at each v generate the product, which fails for repeated constituents; affects the proof.
- **Misprint** in FKP22 at Proposition 3.8, p.16: the source states equal root-group values at τ_{v_n} and τ_{v′_n}; it should give the values −X and 2X from the class used in the proof, nonzero but unequal unless p=3; affects nothing.
- **Misprint** in FKP19 at Proposition 5.12, p.35: the source states equal root-group values at τ_{v_n} and τ_{v′_n}; it should give −X_n and 2X_n, from the doubling class of equation (4); affects nothing.
- **Gap** in FKP22 at the proof of Lemma A.4, p.44: the source replaces Γ by π⁻¹(Γ̄), which loses the original Σ's factors; it should filter Σ by Σ∩U_i(k) and then apply Lemma A.3; affects the proof.
- **Misprint** in FKP22 at Appendix A, before Lemma A.3, p.44: the source indexes the factors Σ_{i+1}/Σ_i by i=1,…,n; it should be 0≤i<n; affects nothing.
- **Gap** in FKP19 at Lemma A.6, p.63: the proof invokes Lemma A.1(2), which assumes p>2(dim gᵈᵉʳ+1), and treats G as adjoint; it should obtain O_p(Γ)=1 by Borel–Tits and pass to the adjoint quotient; affects the proof.

<!-- tauceti-roadmap-review {"agent": "claude", "head": "7ceac20", "job": "REV-PKG-GlobalGaloisDeformationsPartII", "model": "opus", "worker": "fable-rev62"} -->
