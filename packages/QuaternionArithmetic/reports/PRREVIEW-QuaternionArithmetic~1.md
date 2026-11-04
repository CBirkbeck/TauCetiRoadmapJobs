# Review of QuaternionArithmetic (pull request #1722 at 44356b5)

**Verdict:** needs changes

## R01 (P1) — The cubic reduced discriminant does not square to the discriminant of an arbitrary lattice

**Location:** TauCetiRoadmap/QuaternionArithmetic/README.md:484; TauCetiRoadmap/QuaternionArithmetic/Suggested.lean:355–370.

**Claim:** The trilinear definition is used to claim both disc(I)=discrd(I)² and index multiplicativity for every lattice.

**Witness:** For the Lipschitz lattice L, disc(L)=16 and discrd(L)=4. For I=2L, disc(I)=4096 but discrd(I)²=32²=1024; [L:I]discrd(L)=64, not 32.

**Repair and retest:** Keep the cubic construction for orders, and formulate the general-lattice invariant using the trace determinant and its scalar-lattice correction. Explicitly distinguish the two invariants; do not assert the order identity on arbitrary lattices. On 2L the determinant square root is 64, whereas the cubic ideal has generator 32. Voight 15.4.5–15.4.7 itself contains this overclaim (voight lines 10651–10667).

## R02 (P1) — RightIdeal admits superorders and consequently makes class number one false

**Location:** TauCetiRoadmap/QuaternionArithmetic/Suggested.lean:523–530,620; TauCetiRoadmap/QuaternionArithmetic/README.md:567,674,770.

**Claim:** Right stability and invertibility relative to the lattice’s own multiplier orders do not make a proper, locally principal right O-ideal. The same omission affects the genus/type and idelic identifications, the norm-index identity, and “every right ideal ... is principal” in §4.1.

**Witness:** Take O=O₀(2)⊂M₂(ℤ) and I=M₂(ℤ). Then IO=I and I is invertible, but O_R(I)=M₂(ℤ)≠O. The classes of O and I cannot coincide: left multiplication preserves right orders.

**Repair and retest:** Require O_R(I)=O as well as invertibility, or define the carrier by local freeness of rank one over O. Restrict the principal-ideal corollary to that carrier. This excludes I; the corrected class set has one class. Likewise I=2M₂(ℤ)⊂O has [O:I]=8 but nrd(I)²=16, so the properness condition is needed in §3.1 too.

## R03 (P1) — The additive relative index is reversed

**Location:** TauCetiRoadmap/QuaternionArithmetic/Suggested.lean:485–487.

**Claim:** The proposed index formula uses O.relIndex O′ when O′≤O.

**Witness:** Mathlib GroupTheory/Index.lean:486 says H.relIndex K=1 iff K≤H. For Lipschitz O′⊂Hurwitz O the displayed equality is 4=1·2.

**Repair and retest:** Swap the two arguments: O′.toAddSubgroup.relIndex O.toAddSubgroup. The same example becomes 4=2·2. The norm-one index at line 481 already uses the correct direction.

## R04 (P1) — Division over an arbitrary complete DVR need not have discriminant the maximal ideal

**Location:** TauCetiRoadmap/QuaternionArithmetic/README.md:499–504; related §6.2.

**Claim:** The finite-residue local-field classification is asserted for every complete DVR.

**Witness:** For R=ℝ[[t]], B=Hamilton(ℝ)((t)), the maximal order Hamilton(ℝ)[[t]] has trace determinant −16, a unit. Its reduced discriminant is R, and B×/(F×O×) is trivial.

**Repair and retest:** Retain general complete-DVR order theory, distinguishing unramified division algebras from the ramified local-field case; give the displayed discriminant and C₂ quotient as the finite-residue specialization. The witness has ramification index 1 and quotient size 1, whereas the nonarchimedean-local-field case has index 2. Voight 13.3.11 and 15.5.4 use local fields (voight lines 8880 and 10698).

## R05 (P1) — The worked maximal order has the wrong Eichler symbols

**Location:** TauCetiRoadmap/QuaternionArithmetic/README.md:650–657.

**Claim:** The two ramified primes of O₆ are assigned symbol ∗, the split-matrix residue case.

**Witness:** At 2 and 3, O₆/rad(O₆) is respectively 𝔽₄ and 𝔽₉. Thus the symbols are −1,−1; the unit counts modulo pO are 12 and 72, not 6 and 48.

**Repair and retest:** Replace both ∗ entries by −1, and retain the two unit-count comparisons as negative controls. At an unramified maximal place, for example p=5, ∗ gives |GL₂(𝔽₅)|=480. This agrees with the definition in voight lines 16750–16760.

## R06 (P1) — The definition of Pic_R kills the class group which the next sequence injects

**Location:** TauCetiRoadmap/QuaternionArithmetic/README.md:719–725.

**Claim:** Pic_R(O) is defined by quotienting by all fractional central ideals {𝔞O}, then asserted to contain Cl R.

**Witness:** Let R=ℤ[√−5] and O=M₂(R). Every invertible two-sided ideal is M₂(𝔞), so the stated quotient is 1; Cl R≅C₂ cannot inject into it.

**Repair and retest:** Define Pic_R(O)=Idl(O)/{aO : a∈F×}, quotienting only by principal central ideals. Keep Idl(O)/Idl(R) as the distinct quotient in the second sequence. For this example Pic_R(O)=Cl R=C₂ and the final quotient is 1.

## R07 (P1) — A level-prime two-sided generator need not have norm p

**Location:** TauCetiRoadmap/QuaternionArithmetic/README.md:725–727.

**Claim:** The nontrivial local two-sided class at every discriminant prime is said to have reduced norm p, including Eichler level pᵉ.

**Witness:** For O₀(4), w=((0,1),(4,0)) satisfies w²=4 and nrd(w)=−4. Its two-sided ideal has reduced norm (4), not (2).

**Repair and retest:** At a level prime use norm pᵉ; at a division prime use norm p. For e=2 the generator squares to 4O and has norm ideal (4), consistent with §1.9. Keep the Hall-divisor indexing of §3.7.

## R08 (P1) — The norm theorem includes zero when the real ramification set is empty

**Location:** TauCetiRoadmap/QuaternionArithmetic/README.md:793–797.

**Claim:** For every n∈R positive at Ω the target demands an element of B× of norm n.

**Witness:** For B/ℚ indefinite, Ω is empty. Then n=0 satisfies the stated positivity condition, but every α∈B× has nrd(α)≠0.

**Repair and retest:** Write n∈R∖{0}, positive at Ω. If a zero case is wanted, state it separately for an element of B, namely α=0. The repaired unit-valued statement rejects n=0 and retains n=−1 over ℚ.

## R09 (P1) — The Brandt matrix is the transpose of the stated function operator

**Location:** TauCetiRoadmap/QuaternionArithmetic/README.md:263,1018–1023,1051–1055.

**Claim:** Columns count source ideals, but the operator on functions is declared to have this same matrix and the w-weighted pairing.

**Witness:** For D=11, T₂=((1,3),(2,0)). The stated function sum sends δ₁ to (1,3), whereas T₂δ₁=(1,2). With weights (2,3), the function operator gives adjoint pairings 9 and 4.

**Repair and retest:** Distinguish the divisor operator T from the pullback function operator Tᵗ. Use weights w on divisors and 1/w on functions, and align §7.5 with the supplier’s inverse-coset convention. The corrected function pairings are 3/3=2/2=1; the divisor pairings are 2·3=3·2=6.

## R10 (P1) — A norm ideal does not determine one Hecke double coset

**Location:** TauCetiRoadmap/QuaternionArithmetic/README.md:1080–1084.

**Claim:** Every η of norm ideal n is asserted to give the full Brandt operator T(n).

**Witness:** In the Hurwitz case η=3 is central and has norm 9. Its double coset has one right coset and acts as 1. The Brandt operator T(9) is 13.

**Repair and retest:** Identify T(n) with the sum of the relevant elementary-divisor double cosets. Give a single-double-coset comparison only with its specified local type. At n=9 the primitive type contributes 12 and the central type contributes 1, totaling 13; at a good prime there is just the usual type.

## R11 (P1) — CM points forget the two orientations of an embedding

**Location:** TauCetiRoadmap/QuaternionArithmetic/README.md:1225–1231.

**Claim:** The target identifies geometric CM points with all Γ̃-conjugacy classes of optimal embeddings and gives an incomplete existence criterion.

**Witness:** For D=6, N=1, S=ℤ[i], m(S,O;O×)=2 and m(S,O;O¹)=4, but there are only two CM points on Γ¹\ℍ. Conjugate embeddings fix the same point.

**Repair and retest:** Quotient embeddings by complex conjugation, or retain an orientation as extra CM data; for Γ¹ the geometric count is m/2=2. Include the local conditions at every finite prime: S=ℤ[2i] fails optimality at the ramified prime 2 although no prime of D splits and N=1 gives no level condition. This agrees with §§6.2 and 8.3. Also retain the selected complex CM type and gcd(c,N)=1 in the comparison to GrossZagierAndArithmeticHeights §0a.3 (its README:208); that supplied object is oriented, whereas §6.1 here forgets this data.

## R12 (P1) — Polarization does not force μ to normalize the order, and the Lean automorphism theorem also admits split algebras

**Location:** TauCetiRoadmap/QuaternionArithmetic/README.md:1269–1275; TauCetiRoadmap/QuaternionArithmetic/Suggested.lean:789,857–860.

**Claim:** The claimed cyclic subgroup always contains [μ], and card_autPmMu excludes cardinality 1 without requiring division or a normalizing polarization.

**Witness:** For O=M₂(ℤ), μ=((1,−6),(4,−1)), μ²=−23I and tr(μO)⊂ℤ, but Aut_{±μ}(O)=1. This satisfies every binder of card_autPmMu.

**Repair and retest:** Prove the classification for the actual general polarization definition, allowing smaller subgroups; separately state the stronger classification under μ∈N(O), and carry the intended division hypothesis in Lean. For the split witness, centralizing integral units are ±I. An anticommuting matrix has determinant −(4b²−11bc+9c²), never ±1, since (8b−11c)²+23c²=16 would be necessary. Even in the intended division setting, O₆ and μ=i+4j give nrd μ=13; at the split prime 13 a normalizer has even norm valuation, so [μ] is absent. Thus adding division alone does not repair the prose.

## R13 (P1) — The enhanced group maps onto an intermediate normalizer, not the whole normalizer or the μ-preserving group

**Location:** TauCetiRoadmap/QuaternionArithmetic/README.md:1311–1318.

**Claim:** Both π(G)=N(O)/ℚ× and Γ_G equal to the image of the μ-preserving normalizers are asserted.

**Witness:** The roadmap’s D=14, degree-1 example has |Aut±μ|=2 but |N(O)/(ℚ×O×)|=4. Also 2+i∈O₆¹ has norm 1 and does not conjugate i+3j to ±(i+3j).

**Repair and retest:** Define π(G)=(O×Aut±μ)/ℚ× and Γ_G as its positive part. Its image in W is the image of Aut±μ, not necessarily all W. The D=14 image has size at most 2, and the unit 2+i belongs to Γ_G without preserving ±μ. Update §§9.5–9.6 and the name Γ⁺_μ accordingly.

## R14 (P1) — The permutation genus formula drops the genus of the base curve

**Location:** TauCetiRoadmap/QuaternionArithmetic/README.md:1366–1370.

**Claim:** The formula uses −2[Γ_G:Γ_H] for every base X_G.

**Witness:** For (D,M)=(6,101), g(X₀)=17 and the seven nonidentity W fixed counts are 4,0,4,0,12,0,12. Riemann–Hurwitz gives g(X₀/W)=1, so g(X_G)≥1.

**Repair and retest:** Replace the first term by [Γ_G:Γ_H](2g(X_G)−2). For H=G all permutations have one singleton cycle: the original right side is −2 while the left is ≥0; the corrected identity has identical sides. The fixed counts, in Hall-divisor order 2,3,6,101,202,303,606, sum to 32, and 32=8(2·1−2)+32 verifies the witness. Do not impose genus zero on the general library.

## R15 (P1) — Full residue units can have nonzero fixed torsion at an Eichler prime

**Location:** TauCetiRoadmap/QuaternionArithmetic/README.md:1379–1385.

**Claim:** H containing (O/NO)× is asserted to force the fixed module to be zero.

**Witness:** Take D=15, Eichler level M=2, N=2. Locally O/2O has basis E₁₁,E₁₂,2E₂₁,E₂₂. Its four units fix the four-element subspace spanned by E₁₂ and 2E₂₁.

**Repair and retest:** Replace the universal vanishing assertion by the annihilator condition y(u−1)=0 for all residue units, and prove vanishing only under hypotheses that imply this annihilator is zero. For this witness the invariants are (ℤ/2)²; for M₂(𝔽₂) they are zero. Preserve the general torsion construction.

## R16 (P1) — The worked curve X₀(6;4) has no Eichler order

**Location:** TauCetiRoadmap/QuaternionArithmetic/README.md:1144,1591–1593.

**Claim:** A level-4 Eichler order in discriminant 6 is used to compute elliptic points and genus.

**Witness:** Every Eichler order is maximal at a ramified prime. Since 2 divides D=6, its level is prime to 2; gcd(6,4)=2 violates §1.10.

**Repair and retest:** Replace this dyadic-level example by (D,N)=(15,4): gcd=1, ν₂=ν₃=0, φ(15)ψ(4)=8·6=48, and genus is 5. Keep the local Gaussian embedding obstruction at level 4 and explicitly reject (6,4).

## R17 (P1) — The definite level-7 normalizer is not trivial

**Location:** TauCetiRoadmap/QuaternionArithmetic/README.md:1584–1589; TauCetiRoadmap/QuaternionArithmetic/Suggested.lean:601–605.

**Claim:** Absence of a norm-2 element is used to conclude that the whole normalizer quotient is trivial for D=2, level 7.

**Witness:** The two-sided class group is C₂² and acts on the two ideal classes. The stabilizer of either class has order at least 2. Absence of norm 2 only excludes that particular class.

**Repair and retest:** Use the stabilizer of the chosen ideal class. Here the norm-2 class interchanges the two classes, so the stabilizer, hence the normalizer quotient, has order 2, not 1 and not 4. Retain the valid unit index 24/6=4≠ψ(7)=8 as the indefiniteness control.

## R18 (P1) — The twisted and untwisted polarization cases are reversed

**Location:** TauCetiRoadmap/QuaternionArithmetic/README.md:1251–1253.

**Claim:** The target says μ and −μ are identified exactly in the untwisted case.

**Witness:** For O₆ and μ=i+3j, k anticommutes with μ, has norm −3, and normalizes O₆. Thus conjugation identifies μ and −μ, and §9.2 calls this twisted.

**Repair and retest:** Replace “untwisted” by “twisted”; in the untwisted case the two sign classes remain distinct. Test the displayed k and the defining absence of such χ in an untwisted example.

## R19 (P1) — The arithmetic Fuchsian supplier section does not exist on main

**Location:** TauCetiRoadmap/QuaternionArithmetic/README.md:176–188,555–565,1101–1124.

**Claim:** FuchsianOrbifolds L7.1–L7.2 is treated as supplying arithmetic discreteness, compactness, the order-to-building adapter and maximal-order covolume.

**Witness:** TauCetiRoadmap/FuchsianOrbifolds/README.md on main ends at Layers 0–6. FuchsianOrbifoldsPartII/README.md:7 also explicitly describes that stopping point and owns different extensions.

**Repair and retest:** Give each missing arithmetic prerequisite an actual earlier owner and exact target, or make it a named target here; alternatively declare a precise supplier gap through the required plan/README mechanism. No gap is declared now. Preserve the tests End(ℤ_p²)=M₂(ℤ_p), adjacent intersection O₀(p), and area(X₀(6;1))=2π/3. A revision of the existing Fuchsian roadmap is not a dependency.

## R20 (P1) — The Hurwitz supplier citation points to an unrelated section

**Location:** TauCetiRoadmap/QuaternionArithmetic/README.md:159–162,739.

**Claim:** QuaternionicModularForms §0.5 is said to supply the Hurwitz order, maximality, 24 units and class number one.

**Witness:** QuaternionicModularForms/README.md:326 has §0.5 “Checks on the scope of the arithmetic interfaces”: it treats split algebras over imaginary quadratic fields and infinite unipotent stabilizers, not the Hurwitz order.

**Repair and retest:** Repoint the class-number/unit facts to AdelicAlgebraicGroups §5.3 (README lines 5382,5414,5438), which states 1 class, 24 units and mass 1/12. Assign the remaining order construction/maximality explicitly; do not claim it is in QMF §0.5.

## R21 (P1) — The recorded push gate fails on the module-system warning

**Location:** TauCetiRoadmap/QuaternionArithmetic/Suggested.lean:1.

**Claim:** The worker gate records build=1 FAIL because importing Mathlib without module produces a non-sorry warning.

**Witness:** The targeted build was rerun: exit 0, “Build completed successfully”, but the same module-system warning persists. Direct elaboration is not a passing warning gate.

**Repair and retest:** Add module and make the completion’s characteristic-zero/invertible-2 instances explicit in the bridge proof at line 110 if necessary. Re-run the warning gate. A scratch copy with those local instances and module is used below; do not use set_option or suppress the warning. This is the mandatory P1 build finding under this review’s gate policy.

## R22 (P2) — The mass formula is a statable headline missing from Suggested.lean

**Location:** TauCetiRoadmap/QuaternionArithmetic/Suggested.lean:17–22,645; TauCetiRoadmap/QuaternionArithmetic/README.md:843–852.

**Claim:** The docstring lists the mass among the unstated targets even though all carriers needed for the rational mass identity already exist.

**Witness:** A scratch signature sums 2/Nat.card((leftOrderSubalgebra I)ˣ) over Fin n, with a bijection from the representatives to ClassSet O, and equates it to φ(D)ψ(M)/12. No new carrier is needed.

**Repair and retest:** After fixing RightIdeal, state §5.2 on those native carriers with definiteness and Eichler hypotheses. Hurwitz gives 2/24=1/12 and D=11 gives 2/4+2/6=5/6. Audit the other headlines similarly; list an actual missing carrier for each omitted headline rather than a catalogue of omitted objects.

## R23 (P2) — Generic supplied theory is restated as new roadmap work

**Location:** TauCetiRoadmap/QuaternionArithmetic/README.md:411–423,440–450,491–495; TauCetiRoadmap/QuaternionArithmetic/Suggested.lean:172–185,406.

**Claim:** The ramification classification, generic order carrier and multiplier-order/maximal-existence theory are kept as targets even while their existing owners are identified.

**Witness:** ClassicalArithmeticCompletion/README.md:14393,14829,14867,15757 owns §§7.4,7.20,7.21,7.56. GL2AutomorphicRepresentationsAndTransfer/README.md:1428 owns R17.1.5. The target explicitly says these are the same statements instantiated at the symbol algebra.

**Repair and retest:** Delete the repeated targets and admitted restatements, cite these suppliers in ownership/contracts, and keep only comparisons or genuinely quaternion-specific additions. Minimal native bundles needed to state the retained headlines may remain as definitions. The Hurwitz/Lipschitz maximality comparison still uses the supplied existence result. Also correct the “post-pin” claim: TauCeti/NumberTheory/LocalField/Quaternion/Invariant.lean:78 already has invMap_brauerGroupEquivBr_quaternionClass_eq_half_iff at this pin.

## R24 (P2) — The class-number classification is planned as a computational certificate

**Location:** TauCetiRoadmap/QuaternionArithmetic/README.md:889–894.

**Claim:** The proof deliverable is a checked certificate enumerating candidate orders and computing their class sets.

**Witness:** §5.5 explicitly requires a certificate consisting of class-set computations for a finite candidate list, rather than stating the mathematical classification and its structural proof inputs.

**Repair and retest:** Replace the certificate workflow by the exact classification theorem, the finite mathematical classification of local order types, and the mass/embedding arguments that eliminate or identify each type. Keep small numerical examples as README Checks. The five maximal discriminants {2,3,5,7,13} remain the same mathematical conclusion.

## R25 (P2) — The Hilbert-newform interface has the wrong level at ramified places

**Location:** TauCetiRoadmap/QuaternionArithmetic/README.md:1086–1093.

**Claim:** The odd-degree recipe chooses a finite ramified place dividing the newform level but still asks for an Eichler order of that entire level.

**Witness:** For F=ℚ and the weight-2 newform of level 11, it chooses discriminant 11 and Eichler level 11. Such an order cannot exist: gcd(D,M)=11, whereas the correct maximal order has M=1.

**Repair and retest:** State the global Jacquet–Langlands comparison with conductor/local-type hypotheses. In the squarefree case remove the discriminant factor from the Eichler level; at general exponents specify the local type. Remove all norm-character forms, not just constants when the base class group permits nontrivial ones. The level-11 example uses D=11,M=1 and its one-dimensional cuspidal complement.

## R26 (P3) — Suggested.lean contains boundary checks and one-tactic API padding

**Location:** TauCetiRoadmap/QuaternionArithmetic/Suggested.lean:124,236–245,350,415.

**Claim:** The acceptance file includes small worked values and elementary API consequences rather than only headline theorems.

**Witness:** Five admitted targets closed in scratch: isRamifiedAt_comm by the pinned Hilbert-symbol symmetry, normOne_le_units by h.1, IsEichler.of_isMax by O∩O=O, and both definiteness examples by simp.

**Repair and retest:** Delete them from Suggested.lean. Also delete discNat_neg_one_neg_one and discNat_three_neg_one, which are the explicit small Checks of §0.7. Keep their mathematics and examples in the README; do not replace the sorry proofs in place. Remove definitions used only by deleted checks and retain only definitions needed by genuine headline statements.

## R27 (P3) — The README does not meet the required per-definition and per-layer shape

**Location:** TauCetiRoadmap/QuaternionArithmetic/README.md:1,33,245,461–466,1598.

**Claim:** The prescribed Summary, Conventions, Exact supplier contracts and How to read the build structure is absent; layers have no Examples/Dependencies endings and several definitions have no three discriminating Checks.

**Witness:** §1.2 defines both unit groups but has zero Checks; §1.4 defines trace dual/codifferent without a Checks list; §3.7 defines AL(O) without one. All eleven numbered layers lack the required ending headings.

**Repair and retest:** Reorganize the existing detail into the prescribed headings; attach explicit API bullets and at least three discriminating Checks to every definition. For §1.2 use Hurwitz quotient size 1, O₆ quotient size 2, and 2∈O∖O× as concrete controls. Replace process wording such as “landed”, “post-pin”, “checked in Sage” by timeless mathematical statements.

## R28 (P3) — Source records and precise locators are incomplete

**Location:** TauCetiRoadmap/QuaternionArithmetic/README.md:581–596,1238–1253,1398–1446,1644–1655.

**Claim:** The bibliography lacks sources.toml, the seeded claims generally lack printed pages, several substantial claims have no source locator, and Rotger’s DOI does not resolve.

**Witness:** The cited DOI 10.1090/S0002-9947-03-03408-7 returns 404. The author-hosted published Rotger paper is readable. §§8.9,9.9,9.10 and10.1 provide no exact external theorem/table locator for their claims.

**Repair and retest:** Add the required source records and exact locators to the versions actually used; replace the invalid Rotger DOI with a verified bibliographic identifier or author link. Use the seeded-source ledger below for Voight pages. Record the inaccessible label knowl and table claims as uncertified rather than claiming they were checked. For §2.1 distinguish the actual Clifford theorem from the separate trace-zero assertion.

## Verified sound

This is a review of the whole folder at the specified head, not an approval. Both files were read in full. The numbered-target table below covers all 87 targets, with separate rows for additional failing assertions. Finite examples test statements; they do not prove the general theorems. “Retain” means the displayed instance agrees, not that surrounding defects disappear.

**Gate and elaboration.** The worker gate has one failure, build=1; all other scanners report zero, including stray-files, outside-folder, sorry-data, set_option and imports. The outside-folder diff is empty. Direct `lake env lean` elaboration of Suggested.lean exits 0 with 54 sorry warnings. The targeted build also exits 0 but replays the module-system warning, so the gate remains failing (R21). The full 115-declaration #check probe elaborated successfully. The 28 suspected dropped section binders were compared with their bodies: many are harmless weaker assumptions on definitions; no additional lost-binder counterexample was inferred from that count alone. The missing right-order condition and division/normalization hypotheses are the explicit defects R02/R12, not guessed binder failures.

**Padding and statability probes.** Every one of the 54 admitted theorems was tried with a one-tactic proof on a scratch copy; five closed as described in R26 and the other 49 did not close under the tried tactics. This does not certify that all 49 are headlines. The mass signature uses the existing left-order subalgebra, its native Units, a finite representative family and a genuine bijection to the class quotient; it is not a free predicate or an assumed conclusion. The final scratch copy with module, explicit local CharZero and Invertible 2 instances, and the mass signature exits 0 with exactly 55 sorry warnings and no other warning or error. All probes are finished; no Lean job is left running.

**Headline inventory.** The deep endpoints are: ramification classification (§0.6, supplied); maximality/discriminant and local Eichler classification (§§1.7–1.10); Clifford correspondence and Gorenstein saturation (§§2.1–2.3); finiteness and the idelic comparison (§§3.4–3.5); Eichler class-set/norm/normalizer theorems (§§4.1–4.6); rational and totally real mass formulas and class-number classification (§§5.2–5.5); embedding trace/local counts, class and type formulas (§§6.2–6.8); Brandt algebra, trace and theta comparison (§§7.2–7.7); arithmetic Fuchsian area/genus/Atkin–Lehner/CM results (§§8.1–8.9); and the general polarized-order/enhanced-group/curve invariants (§§9.1–9.8). Lean contains ramification, order/maximality, class-set, class-number/type-number and embedding headlines, but also API/check padding. The docstring mentions the missing mass, Brandt and geometric objects collectively; it does not justify each omitted headline by a missing native carrier. The statable rational mass omission is R22.

**Dependency check (run against the supplied candidate order):**

```text
depcheck: 204 roadmaps, 1568 edges, 0 problem(s)
```

No UPWARD or CYCLE line was produced. This mechanical result does not validate nonexistent sections. All Prerequisites lines and the supplier list were inspected; R19/R20 identify substantive drift. No supplier gaps are declared. No move of ownership was performed in this read-only review.

**Pinned declarations opened.** Mathlib pin `f6090c7095e1e56b3464c1daba5f24631f1290d2`; Tau Ceti pin `358314d4ab97483df4fc4cb8adcc02e74a8d9f5a`. The following ledger gives 17 file/line groups of concrete declaration and definition checks; several rows group related declarations.

| Pinned file and line | Declaration/content and scope checked |
| --- | --- |
| Mathlib/Algebra/Quaternion.lean:606 | QuaternionAlgebra.self_add_star′; the c₂=0 specialization supplies the trace identity. |
| Mathlib/Algebra/Module/Lattice.lean:67 | Submodule.IsLattice has finite generation and full scalar span; it does not say 1∈I or O_R(I)=O. |
| Mathlib/GroupTheory/Index.lean:62,486 | Subgroup.relIndex and relIndex_eq_one; direction used in R03. |
| Mathlib/NumberTheory/NumberField/DedekindZeta.lean:49,77 | NumberField.dedekindZeta and its residue-limit theorem; no Euler-product claim is certified merely by this file. |
| TauCeti/Algebra/Quaternion/NormForm.lean:78,88,130,146 | normForm, coordinate formula, normForm_mul, isUnit_iff_normForm_isUnit. |
| TauCeti/Algebra/Quaternion/NormForm.lean:158,175 | anisotropic_normForm_iff and pureNormForm; field/regular-2 assumptions retained where used. |
| TauCeti/Algebra/Quaternion/AlgEquiv.lean:93,114 | reducedTrace_eq_of_algEquiv and normForm_eq_of_algEquiv, with IsRegular 2. |
| TauCeti/Algebra/Quaternion/BaseChange.lean:142 | baseChangeTwoParams on the native tensor-product algebra. |
| TauCeti/NumberTheory/HilbertSymbol/Basic.lean:46,201,228 | hilbertSymbol, splitting criterion and symmetry; no independent Hilbert symbol is needed. |
| TauCeti/NumberTheory/HilbertSymbol/Archimedean.lean:59,80 | hilbertSymbol_real and its negative-value criterion. |
| TauCeti/NumberTheory/QuadraticForm/Global/Localization.lean:41,65 | unitAtFinitePlace and unitAtRealPlace. |
| TauCeti/NumberTheory/QuadraticForm/Global/HilbertSymbol.lean:94,120 | nondyadic-unit value and finite multiplicative support. |
| TauCeti/NumberTheory/LocalField/Quaternion/Subgroup.lean:114 | quaternionSubgroupSignEquiv for the local quaternion subgroup. |
| TauCeti/NumberTheory/LocalField/Quaternion/Invariant.lean:78 | invMap_brauerGroupEquivBr_quaternionClass_eq_half_iff is already at the pin. |
| TauCeti/NumberTheory/ClassFieldTheory/Brauer/Invariant.lean:195 | invMap. |
| TauCeti/NumberTheory/ClassFieldTheory/Global/LocalInvariant.lean:75,113 | infiniteInvAt and finiteInvAt. |
| TauCeti/NumberTheory/NumberField/Global/Orders/Basic.lean:59,228 | NumberFieldOrder and maximalNumberFieldOrder; finite ℤ-module plus full ℚ-span. |

**Ownership and resolved supplier ledger.** Object searches used `roadmaps grep` on main/open heads and `rg` on the board packages and pinned sources: orders, multiplier orders, discriminants, Gorenstein orders, Brandt operators, Hurwitz orders and Kronecker symbols. No second fully qualified TauCetiRoadmap.QuaternionArithmetic declaration was identified. The specialized arithmetic is a legitimate new scope; the repairable duplication does not justify rejecting the whole folder. Main-roadmap shape was compared with ClassicalArithmeticCompletion, ThetaSeries and FuchsianOrbifolds. Relevant resolved contracts:

| Supplier | Resolution |
| --- | --- |
| ClassicalArithmeticCompletion | §§7.4,7.20,7.21,7.44,7.56,7.60,7.72,7.77,7.78,7.98 occur at README lines 14393,14829,14867,15456,15757,15856,16146,16263,16313,16744; generic order, strong-approximation, norm, gluing, class and cancellation ownership is real. |
| GL2AutomorphicRepresentationsAndTransfer | R17.1.5 (README:1428) owns ramification realization/uniqueness; R17.3 supplies transfer with its local conditions. §7.5 here must retain them. |
| QuaternionicModularForms | §0.3 does state finite_classSet and DefiniteQuaternion.finite_stab; §3.1 supplies Hecke actions with inverse-coset/right-translation convention. §0.5 is the wrong Hurwitz citation. |
| HilbertModularVarietiesAndShimuraCurves | R18.1.3 (README:1626), R18.3.1 (:2703), R18.5.17a (:2373) exist. The latter explicitly distinguishes divisor Brandt matrices from dual function operators and retains central-idele quotients over general F. These are comparisons, not permission to rebuild the generic graph. |
| AdelicAlgebraicGroups | AA.3.4,4.2,4.6 and5.3 resolve. §5.3 supplies the Hurwitz class and weight examples. Its split-finite-place strong approximation alone is not the archimedean Eichler statement; CAC §7.44 supplies the latter. |
| GlobalNumberFields | Layers 1,2,4,6,11 resolve to approximation, ray classes, finite adeles, ideles, and orders/Picard groups. |
| QuadraticFormInvariants / GlobalQuadraticForms / ClassFieldTheory | The named presentation/local-symbol, Hasse–Minkowski/sign-prescription and local/global-invariant layers resolve; the symbol carrier comparisons retain their number-field assumptions. |
| ThetaSeries | Layer 7 supplies theta modularity. Its earlier quadratic-character work is also relevant to the Kronecker-symbol convention; the prime-2 correction here computes −1 for (−3,2), unlike the odd-denominator Jacobi convention. |
| Completed/NumberFieldArithmetic | Layers 1 and5 supply splitting and local-field completions; they do not identify every complete DVR with a finite-residue local field. |
| GrossZagierAndArithmeticHeights / FiniteGroupInvariants | The §0a.3 optimal-embedding (README:208) and §7.1 Gassmann (README:821) references resolve. The former retains the selected CM type and gcd(c,N)=1; the claimed identification here needs these data (R11). |
| FuchsianOrbifolds | Main supplies Layers 0–6 only; the arithmetic Layer 7 contract fails. Part II does not repair it. |

Ownership searches included the available sibling files and board packages; no conclusion is claimed about inaccessible open-PR files. The nine automated unresolved-name leads were not nine defects: the two mathematical names resolve in suppliers, and the seven shimcurve names are knowl identifiers rather than Lean declarations.

**Seeded source verification.** The legal source service fetched Voight’s 2021 author edition (v0.9.28, 20 May 2021), the published Rotger paper from the author, Pizer 1976 from an institutional archive, Dembélé–Voight arXiv:1010.5727v2, and the LMFDB knowls listed below. All 15 seeded targets were inspected; the table distinguishes support from a missing locator or inaccessible text. No README locator was marked “unverified”. Source text was not copied into the repository.

| Seeded target | Locator actually read and result |
| --- | --- |
| 1.5 Reduced discriminant | Voight 15.4.4–15.4.7, p.239, voight lines 10651–10667. The source makes the same false general-lattice claim; R01 and Source issues. |
| 1.6 Maximal orders exist | Voight 15.5.2, p.240, voight lines 10680–10687: every order is contained in a maximal order over the standing Dedekind domain. Supported; ownership is R23. |
| 1.10 Level and genus | Voight 23.4.19, p.375, voight line 16209; 28.5.16, p.475, line 20350. Eichler local types and norm-maximality support the coprime-level statement. |
| 2.1 Clifford correspondence | Voight 22.5.7, p.359, voight lines 15421–15435; 22.4.19, p.358, line 15378. The correspondence is supported; the latter is an embeddings remark, not the asserted trace-zero discriminant theorem. The trace-zero check below is for Eichler orders, not all orders. |
| 2.3 Saturation | Voight 24.2.15, p.385, voight lines 16649–16654; 24.2.22, p.387, line 16705. Conductor and uniqueness match. |
| 4.1 Eichler class set | Voight 28.5.5, p.473, voight line 20295; 28.5.17, p.475, line 20355. The class set is locally principal/proper; the unrestricted right-ideal corollary here is too broad (R02). |
| 5.4 Level change | Voight 26.6.4, p.433, voight lines 18685–18708; 26.6.7, p.434, lines 18729–18733. The mass index and split/ramified factors agree. |
| 6.6 Class number formula | Voight 30.1.5, p.531, voight lines 22961–23002; 30.8.6, p.550, lines 23915–23930. Rational and totally real formulas match their definite hypotheses. |
| 7.1 Brandt definition | Voight 41.2.3–41.2.7, pp.751–752, voight lines 32048–32072. Counting is supported; the chosen column-function identification is contradicted by the roadmap’s own D=11 matrix (R09). |
| 7.7 Theta series | Voight 41.1.11–41.1.12 discussion, p.750, voight lines 31976–31987, supports weight 2 and level DM. The target instead gives only ThetaSeries Layer 7, without this exact norm-lattice locator. |
| 8.4 Genus | Voight 39.4.20, p.726, voight lines 30965–31005: supported for indefinite D>1 and coprime Eichler level. |
| 8.9 CM points | No external locator supplied. Compare Voight 39.4.3–39.4.4 and the half-count 39.4.13, voight line 30929; the un-oriented bijection is false (R11). |
| 9.9 Worked curves | LMFDB shimcurve definitions, lmfdb lines 90–132, do not certify the table rows/selected polarizations. Genera and stated index arithmetic were recomputed below; stored labels and automorphism selections remain uncertified. |
| 9.10 Boundaries | lmfdb_polarized_order lines 90–99 and lmfdb_aut_pm_mu_o lines 90–92 support the definitions, not the numerical automorphism table. The local norm-parity obstruction at 2 was independently checked. |
| 10.1 Label prefix | The label knowl fetch returned a browser challenge, not mathematical text. Prefix arithmetic can be tested internally; the database convention is not verified. |

**Adversarial values.** H denotes the Hurwitz order; L the Lipschitz order; Eₑ the split order O₀(pᵉ). “Retain” is conditional on the corrected proper-ideal carrier where ideal classes are involved. R references point to the numbered findings.

| Statement | Instances | Computed sides / discriminating value | Result and change |
| --- | --- | --- | --- |
| 0.1 trace/norm/characteristic identity | Hamilton x=1+i | trd=2, nrd=2; x²−2x+2=0; det trace Gram=−16 | Retain; cite native API |
| 0.2 ramification and symmetry | (-1,-1) at ℝ; (1,7) at ℝ | −1 versus +1; division true versus false; swapping gives −1 again | Retain |
| 0.3 finite support/parity | Hamilton; (3,-1) | Ram={2,∞}, {2,3}; cardinalities 2,2; symbol products 1,1 | Retain |
| 0.4 algebra discriminant | same; split algebra | D=2,6,1; prime products 2,2·3,empty product 1 | Retain |
| 0.5 definite/indefinite | (-1,-1); (3,-1); base ℚ(i) | negative signs true/false; ω(D)=1/2; real places empty over ℚ(i) | Retain with number-field base |
| 0.6 classification/embedding | S empty; S={5} with ∞ split | empty gives M₂ and D=1; odd cardinality 1 rejected; ℚ(i) embeds in D=6 since symbols at 2,3 are 0,−1 | Consume supplier, R23 |
| 0.7 symbol examples | (-1,-13),(-2,5),(-3,5),(5,5) | D=2,10,15,1 respectively; real signs −,+,+,+ | Retain in README; R26 |
| 1.1 lattices/multiplier orders | I=H; I=0 | O_L(H)=O_R(H)=H; O_L(0)=B; ranks 4 and0 | Retain lattice hypothesis; generic owner R23 |
| 1.2 units/norm-one | H; O₆; scalar2 | quotient sizes 1 and2; nrd(2)=4, so 2 is not an order unit | Retain; add Checks R27 |
| 1.3 trace discriminant/index | L⊃2L | disc=16 and4096; 16·16²=4096 | Retain trace formula |
| 1.4 trace dual | L⊂Hamilton | L♯=(1/2)L; double dual L; [L♯:L]=16=disc L | Retain |
| 1.5 cubic discriminant | L⊃2L | 4 and32; squares16 and1024 versus trace discriminants16 and4096 | FAIL R01 |
| 1.6 maximal existence | L⊂H; O₆ | indices2,1; reduced discriminants4→2 and6→6 | Sound instance, supplied R23 |
| 1.7 split/complete DVR | M₂(ℤ₂); Hamilton(ℝ)[[t]] | split discrd=1; unramified division discrd=1 rather than t, quotient size1 rather than2 | FAIL R04 |
| 1.8 maximality criterion | L,H,O₆,ℤ+2O₆ | discrd=4,2,6,48; D=2,2,6,6; maximality false,true,true,false | Retain over number fields |
| 1.9 Eichler orders/heredity | E₀,E₁,E₂ at p=2 | discrd1,2,4; hereditary true,true,false; w₂²=4I | Retain local classification |
| 1.10 level/genus/local index | D6,N5; E₂ at p2 | d=30 and gcd=1; index2·3=6; diagonal(u,1) has normu | Retain; reject D6,N4 |
| 1.11 order index | L⊂H; ℤ+2O₆ | 4=2·2; 48=2³·6; Lean instead4=1·2 | FAIL R03 |
| 1.12 tree distance | ℤ_p² and ℤ_p⊕p²ℤ_p | distance2; intersection E₂ has reduced discriminantp² | Instance sound; missing supplier R19 |
| 1.13 products/inverses | I=2H,J=(1/2)H | IJ=H; norm ideals4ℤ and(1/4)ℤ; productℤ | Retain |
| 3.1 proper ideal norm index | O=O₀(2), I=2M₂(ℤ) | I⊂O; index8; norm4 and norm²16 | FAIL R02; distinguish proper ideals |
| 2.1 Clifford/trace-zero comparison | H; L as non-Eichler control | H trace-zero sum of3 squares has ternary discriminant4=2²; Clifford form discriminant2. L has same trace-zero form but discrd(L)²=16 | Keep Eichler qualifier; locator needs repair |
| 2.2 Gorenstein | L; ℤ+2O₆ | codifferent norm times discrd=1 forL, 2 forℤ+2O₆ | Retain; primitive versus nonprimitive |
| 2.3 saturation/conductor | O₆; ℤ+2O₆ | conductor1,2; same Gor=O₆; discrd6,48 | Retain |
| 2.4 residue units | q2 with symbols∗,1,−1,0 | unit counts6,4,12,8 respectively | Retain finite-residue hypothesis |
| 2.5 Bass/radical idealizer | L and H; ℤ+2O₆ | L has two superorders L,H, both Gorenstein; ℤ+2O₆ is not itself Gorenstein | Retain examples |
| 2.6 local symbols | M₂(ℤ₂), E₁, division maximal, L₂ | semisimple residue dimensions4,2,2,1; symbols∗,1,−1,0 | Retain four cases |
| 2.7 worked symbols | O₆ at2,3 | −1,−1; counts12,72, not∗,∗ and6,48 | FAIL R05 |
| 3.1 invertibility/locally principal | H,2H | inverse H,(1/2)H; productsH,H; [H:2H]=16=4² | Retain for proper ideals |
| 3.2 class quotient | O₀(2) and its superorder | two admitted inequivalent classes versus claimed1; right orders E₁ andM₂ | FAIL R02 |
| 3.3 genus/types | D11; D37 maximal | class/type counts(2,2),(3,2); fibres(1,1),(1,2) | Retain corrected carrier |
| 3.4 idelic comparison | identity idele; O₀(2) superorder | 1 mapsO, normℤ; superorder has local rank-one condition false despite admitted invertibility true | FAIL R02 |
| 3.5 finiteness/bound | H; D11 | class sizes1,2; integral norm1≤16/π²≈1.621 forH | Retain corrected carrier |
| 3.6 Pic_R | M₂(ℤ[√−5]) | stated quotient1; required injected class group size2; repaired Pic size2 | FAIL R06 |
| 3.6 level generator | E₂ at2 | norm ideal(4), square4O, not norm(2) | FAIL R07 |
| 3.7 Atkin–Lehner ideal group | D6,N1; D2,N7 | sizes4,4; second group acts on2 classes | Retain; distinguish normalizers |
| 3.8 class examples | D2,3,5,7,11,13,37 | class counts1,1,1,1,2,1,3 | Retain README checks; supplier R20 |
| 3.9 level transport | D2 levels1,7 | class set sizes1,2; unique target fibre has2 elements | Retain; state exact fibre formula instead of “controlled” |
| 3.10 ideal counts | H, norm3,5,9,2 | 4,6,13,1; good-prime σ values4,6,13; ramified count1 | Retain nonzero norm ideal |
| 4.1 Eichler bijection | O₀(2), R=ℤ | correct proper class number1=card(Clℤ); present carrier≥2 | FAIL R02 |
| 4.2 types | indefinite D6,N1 | 1 class and1 type; norm class group1 | Retain corrected carrier |
| 4.3 indefinite rational orders | D6,N5; m=1 | class/type counts1,1; residue norm-one group at m1 has size1, reduction surjective | Retain; nonzero modulus convention |
| 4.4 norm theorem | D6,n=0 and−1 | zero positive at emptyΩ, but cannot be norm of a unit; −1 occurs and index2 | FAIL R08 |
| 4.5 normalizer sequence | D6,N1; E₂ at2 | quotient4; w₂²=4 central, class square1 | Retain indefinite/proper context |
| 4.6 positive normalizer | O₆ | positive quotient4; norm-sign quotient2; scalar−1 already in O¹ | Retain |
| 4.7 cancellation | free module O of rank1 | O⊕O≅O² implies rank1=1; zero-rank identity0⊕O≅O | Consume CAC, no duplicate target |
| 5.1 mass and inequality | H; D11; D37 | 1/12<1; 1/2+1/3=5/6<2; 3=3 | Retain |
| 5.2 rational mass | D2,N1,3,7 | 1/12,1/3,2/3 equal φ(2)ψ(N)/12 | Retain; missing Lean headline R22 |
| 5.3 totally real mass | F=ℚ | 2ζ(2)/(2π)²=1/12, d=h=1; gives5/6 atD11 | Retain specialization; Euler-product supplier not certified |
| 5.4 level change | D2, level1→3; L⊂H at2 | mass ratio4=ψ3; local ratio[H₂×:L₂×]=3=2·(1−1/4)/(1−1/2) | Retain |
| 5.5 class number one | D2,3,5,7,13; D11 | h=1 five times; h11=2; mass11=5/6 alone does not force h1 | Retain theorem; certificate route R24 |
| 5.6 worked masses | D3,5,7,13,37 | 1/6,1/3,1/2,1,3; reciprocal weights6,3,2,1 and three1s | Retain |
| 6.1 optimal embeddings/orientation | S=ℤ[i],D6 | m(O×)=2; m(O¹)=4=2·2 | Retain |
| 6.2 local maximal embeddings | division at2; S=ℤ₂[i] vsℤ₂[2i] | maximal ramified extension count1−0=1; nonmaximal order count0 | Retain local-field case; R04 |
| 6.3 Eichler local roots | ℤ₂[i] into E₁,E₂ | x²+1 has1 root mod2 and0 mod4; counts1,0 | Retain dyadic correction |
| 6.4 trace formula | D6,S=ℤ[i]; D11,S=ℤ[i] | h(S)=1; products(1−0)(1−(−1))=2; definite sum2 | Retain corrected carrier |
| 6.5 Gaussian/Eisenstein | D6,N1; D2,N3 | counts(2,2); definite sums(0,2); (−3 over2)=−1 | Retain |
| 6.6 Eichler class formula | D2,D11,D37; D2,N3 | 1/12+1/4+2/3=1;5/6+1/2+2/3=2;3+0+0=3;1/3+0+2/3=1 | Retain corrected carrier |
| 6.7 worked class numbers | same four cases | h=1,2,3,1 on both computations | Retain README only |
| 6.8 type formula | p11,p37 | 1+1/4+3/4=2;3/2+0+1/2=2 | Retain |
| 7.1 Brandt/operator | D11,T2,δ1 | Tδ1=(1,2); function sum=(1,3) | FAIL R09 |
| 7.2 multiplicativity | D11,T2,T3 | both products=((8,6),(4,6)); column sums12,12=σ6 | Retain |
| 7.2 prime-square relation | Hurwitz,p3 | T3²=16=T9+3=13+3 | Retain central factor |
| 7.3 adjoints | D11,w=(2,3) | divisor cross terms6=6; function cross terms9≠4; inverse weights1=1 | FAIL R09 |
| 7.4 trace formula | Hurwitz,n3,n9 | 1/3+2+1+2/3=4; n9 contributions5/4+4+1+8/3+2+2+1/12=13 | Retain corrected conductor sum |
| 7.4 source shorthand control | Hurwitz,n9 | fundamental-only sum10; correct sum13; difference3 | Source error confirmed |
| 7.5 double coset | Hurwitz,η=3 | norm9; one central coset acts1 versusT9=13 | FAIL R10 |
| 7.5 conductor/transfer | F=ℚ,newform level11 | D11,M11 violates gcd=1; D11,M1 has h2 and cuspidal dimension1 | FAIL R25 |
| 7.6 matrices | D11,T5; D37,T2 | column sums6,6; D37 column sums3,3,3; weighted symmetry6=6 | Retain divisor convention |
| 7.7 ideal theta | H,I=J=H | bilinear determinant4=D², level2; constant1/24; norm1 count24/24=1, norm3 count96/24=4 | Retain |
| 8.1 real splitting/kernel | B=(3,−1); Hamilton | i²=3I,j²=−I,det i=−3,det j=1; scalar kernel{±1} size2; Hamilton has no real splitting | Retain; missing arithmetic supplier R19 |
| 8.2 area/index | D6,N1,5; definiteD2,N7 | areas2π/3,4π; ψ5=6; definite global index4≠ψ7=8 | Retain distinction |
| 8.3 elliptic embedding counts | D6,N1; D10,N1 | ν=(2,2),(0,4); embedding counts for O¹=(4,4),(0,8) | Retain factor1/2; invalid level R16 |
| 8.4 genus | D6,10,14,26,35 atN1 | 1+1/6−1/2−2/3=0; 0,1,2,3 respectively thereafter | Retain |
| 8.5 involutions | D6,N1 | W size4; Hall divisors1,2,3,6; each nonidentity square1 | Retain |
| 8.6 fixed points/RH | D6,N1 | fixed counts2,2,2; quotient genus(0+1−1)/2=0; −2=4(−2)+6 | Retain |
| 8.6 higher-genus control | D6,N101 | g17; fixed counts4,0,4,0,12,0,12; total32; g(full quotient)=1 | Used in R14 |
| 8.7 normalizer stabilizers | i;1+i;1+ζ6 | projective orders2,4,6; norm-one rational quaternion roots allow only2,3 | Retain |
| 8.8 canonical model comparison | D6,N1 | one ideal class and φ1=1 component; effective kernel size2 | Retain supplied canonical model |
| 8.9 CM bijection | D6,N1,S=ℤ[i] | 4 embedding classes versus2 geometric CM points | FAIL R11 |
| 8.9 CM existence | D6,N1,S=ℤ[2i] | no split ramified prime, no level primes, but local optimal count0 at2 | FAIL R11 |
| 9.1 degree | O₆,μ=i+3j,2μ,j | norms6,24,1; ratios1,4,1/6; squarefree degrees1,1,6 | Retain rational squareclass |
| 9.1 sign identification | O₆,μ=i+3j,χ=k | χμ=−μχ, nrdχ=−3; μ and−μ one orbit, twisted=true | FAIL R18 |
| 9.2 automorphism cardinal | M₂(ℤ),μ=((1,−6),(4,−1)) | μ²=−23I; Aut± size1 versus allowed2,4,6,8,12 | FAIL R12 |
| 9.2 normalizing μ | O₆,μ=i+4j | μ²=−13; valuation13(nrdμ)=1, required even for normalizer | FAIL R12 |
| 9.3 worked groups | D6,μ=i+3j | [μ] and[k] are distinct commuting involutions projectively: subgroupC₂² of size4 | Retain this check; other selected table entries uncertified |
| 9.4 enhanced product/kernel | D6,degree1,N1 | residue-unit group size1; enhanced size4; K before reduction size2, image size1 | Retain these values |
| 9.4 image/ΓG | D14,degree1; O₆ unit2+i | Aut image≤2 versus fullW4; nrd(2+i)=1 yet it fails to preserve±μ | FAIL R13 |
| 9.5 coarse/preimage | D6,N1; N3,H=1 | index4; K image1 atN1 and≥2 atN3; H andHρ(K) sameΓ | Retain after R13 |
| 9.6 area genus | X(6;1) | 1+4·(1/4)·(2/12)−(1/2)(1+4/3)=0 | Retain |
| 9.6 permutation genus | D6,M101,H=G | degree1, ramification sum0; LHS≥0 versus RHS−2 | FAIL R14 |
| 9.7 residue torsion | D15,M2,N2,H=residue units | 4 units; fixed module has4 elements versus asserted1 | FAIL R15 |
| 9.8 H-image/content/splitting | H=1 and full enhanced group | projection sizes1 andcard(Aut±); trivial H content{1}; full group splits by its defining factors | Retain definitions; arithmetic interpretation needs exact supplier |
| 9.9 worked genera | D6,M5,11;D14,26,35,M1 | genus1,3;1,2,3; d for6,M5=30; stated prefix6.30.1.1.4.1 internally consistent | Arithmetic retained; database rows uncertified |
| 9.10 boundary controls | D21,degree21;D6,degree2 | v₂(nrd(1+i))=1 excludes split normalizer; 3/6=1/2 has squareclass2 | Retain these controls; full selected groups uncertified |
| 10.1 prefix | D6,M1 andM5 | tuple(6,6,1,1,4,0) and(6,30,1,1,4,1); d=6·1 and6·5 | Internally consistent; knowl inaccessible |
| 10.2 coverage map | mass/CM/torsion columns | area factorD6=1/6; CM count2 not4; torsion example size4 not1 | Coverage overclaims depend on R11/R15 |
| 10.3 worked suite | D2 versusD6 | definite/indefinite signs−1,+1; D2 mass1/12, D6 genus0 | Retain distinct tests |
| Off-hypothesis normalizer | D2,N7 | C₂² acting on2 classes gives stabilizer2, not1; unit index4≠8 | FAIL R17 |
| Positive-parameter conventions | N=1 versusN=0 | psi(1)=1,psi(0)=1 by empty primeFactors; O/O has1 element, O/0 infinite | Require positive moduli/levels wherever finite cardinalities are used |

The matrix, class-number, residue-ring and Riemann–Hurwitz computations use exact integer/rational arithmetic. The genus witness uses reduced positive binary forms: h(−808)=6 and h(−2424)=12 give the nontrivial large fixed counts, with the local factors in §8.6. A zero ring is admitted for O/O and has one unit; zero norm ideals and level zero are not silently treated as positive finite-level data. Characteristic-p, equal-characteristic-p and inseparable-field cases are outside the explicitly characteristic-zero scope; ℝ[[t]] is inside it and is therefore a valid DVR test.

## Not verifiable

- **Uncertified bibliography:** vigneras (Springer DOI), pizer1980 (Elsevier DOI) and ogg (Birkhäuser) resolved only to paywalled sources. Their texts were not read and are not claimed verified. The corresponding sampled mass/class formulas were checked independently in the open Voight edition.
- **No accessible text from the service:** eichler (De Gruyter DOI landing page), shimizu (JSTOR DOI landing page), alsina_bayer (AMS book landing page). These are recorded in the scratch missing-reference ledger. Pizer 1976 was subsequently obtained from the Polish institutional archive; Rotger was obtained from the author, so neither remains a missing text.
- **lmfdb_label:** the service’s response was a browser/reCAPTCHA page. No attempt was made to bypass it. Thus the exact label convention remains uncertified.
- **Selected stored curves/polarizations:** the accessible LMFDB definition knowls do not provide the full selected-row witnesses for §§9.3,9.9,9.10. Arithmetic genus values and the explicit D=6/D=21 controls were checked; the complete automorphism tables and stored choices were not independently certified.
- **Full auxiliary proof inputs:** reading Mathlib’s Dedekind-zeta definition/residue theorem does not verify the Euler-product input requested by §5.3. Likewise the broad R18.1 citation does not by itself certify the precise enhanced-image rational-torsion/endomorphism-field assertions in §§9.7–9.8. Those need exact supplier target locators before being advertised as checked.
- No claim of exhaustive ownership verification is made for open pull-request content unavailable as files. All available relevant sibling and main matches were used as data, and no instructions in fetched material were followed.

## Source issues

- **Error** in voight at 15.4.5 and Lemma 15.4.7, printed p.239: the source says the cubic reduced discriminant scales by lattice index and squares to the trace discriminant for all projective lattices; it should be qualified by the scalar-lattice normalization, in particular valid for orders, with the general-lattice correction retained; affects a stated result.
- **Misprint** in voight at proof of Lemma 15.4.7, printed p.239: the source says the alternating trace evaluated on i,j,ij equals 4ab; it should be −4ab since (ij)²=−ab; affects nothing.
- **Error** in voight at Theorem 41.1.13, printed p.751: the source says the weighted quadratic class number is unchanged after multiplying the discriminant by a conductor square; it should be a sum over admissible overorders, retaining conductors prime to the quaternion discriminant; affects a stated result.
- **Misprint** in lmfdb_eichler at shimcurve.eichler, unpaginated knowl, line 90: the source says the reduced discriminant DM using the symbol disc(O); it should be discrd(O), consistently with shimcurve.disco; affects nothing.
- **Error** in lmfdb_nrdmu at shimcurve.nrdmu, unpaginated knowl, lines 90–94: the source says the reduced norm divided by the order discriminant is an integer; it should be a positive rational number whose squareclass has a squarefree positive integer representative; affects a stated result.
