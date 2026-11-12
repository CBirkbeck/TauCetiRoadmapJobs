# Red-team review of #2137 GL2ModularityLiftingPartII at 494737a (pass b (claude))

**Verdict:** changes needed

One blocking finding (R01); R02–R07 are P3.

## R01 (P1) — §10.5 takes Bianchi bad-place compatibility from a totally real supplier, and its Needs omit the inputs its route uses

Location: `TauCetiRoadmap/GL2ModularityLiftingPartII/README.md:1329`, `:1333`, `:1341` (and the Layer 10 Dependencies line `:1365`). Quote: "associated to a regular algebraic cuspidal GL₂/F representation π with matching unramified local factors and L-function … use local compatibility for the bad factors."

Claim: for imaginary quadratic F, equality of the whole L-function, with the bad Euler factors supplied by `AutomorphicGaloisRepresentations §§3.7, 4.1–4.6, 6.12` and `§§5.1, 6.12`, and the classical comparison by `GL2AutomorphicRepresentationsAndTransfer §§R16.6.5–R16.6.6`.

Witness: at its head AutomorphicGaloisRepresentations is totally real throughout (README line 114 "Let `F` be totally real"; §3.7 is Carayol's Theorem B on Shimura curves; §§4.2, 4.4 are "Hilbert Ramanujan–Petersson", "All-Hilbert compatibility"; §5.1 is the Hilbert ordinary lattice). GL2AutomorphicRepresentationsAndTransfer §R16.6.6 is the primitive weight-one comparison over ℚ ("N>0 and χ(−1)=−1"). Neither states anything for GL₂ over an imaginary quadratic field. The route also uses "the automorphic/cohomological comparison" to exclude boundary classes, which is ArithmeticLocallySymmetricSpaces §§ALS.5b.5–ALS.5b.8 with gap:bianchi-classical-dictionary (as §10.4 `:1325` records), and Conjecture A(1) (§8.4); none of these is in the §10.5 Needs line. What R = T with Conjecture A(1) actually gives is the good-place statement: the O-point of R_min = T_m sends T_λ to tr ρ(Frob_λ) for λ ∉ S(ρ̄) ∪ {v | p}. A Galois representation of π with compatibility at ramified places over a CM field is owned by AutomorphicGaloisRepresentationsPartII (Layers AG2.4–AG2.6, earlier in the merge order), which the README does not cite.

Repair (statement, `:1329`): replace "Then ρ is associated to a regular algebraic cuspidal GL₂/F representation π with matching unramified local factors and L-function under the fixed normalization." by "Then there is a regular algebraic cuspidal automorphic representation π of GL₂ over F, of trivial central character and occurring in H₁(Y,K)_m, whose T_λ-eigenvalue is tr ρ(Frob_λ) for every prime λ outside S(ρ̄) ∪ {v | p}; equivalently the Euler factors of ρ and π agree at those places. Equality of the remaining Euler factors is not asserted here."

Repair (route, `:1333`): replace "Compare the associated Galois representation with ρ by Frobenius density and residual absolute irreducibility; use local compatibility for the bad factors." by "Read the good-place eigenvalues from Conjecture A(1) of §8.4 at the O-point; identify the Hecke class with a cuspidal automorphic representation by ArithmeticLocallySymmetricSpaces §§ALS.5b.5–ALS.5b.8 and gap:bianchi-classical-dictionary."

Repair (Needs, `:1341`): "*Needs:* §10.2; §10.4; §8.1; §8.4; ArithmeticLocallySymmetricSpaces §§ALS.5b.5–ALS.5b.8 (cuspidal comparison). gap:bianchi-classical-dictionary." Delete the two AutomorphicGaloisRepresentations items and the R16.6.5–R16.6.6 item from this line, and from the Layer 10 Dependencies line `:1365` where no other Layer 10 target uses them (R16.6.5–R16.6.6 stays for §10.4). If the full L-function is wanted, state it as a second sentence citing AutomorphicGaloisRepresentationsPartII Layers AG2.4–AG2.6 after checking that those layers cover n = 2 over imaginary quadratic F at every ramified place; I did not verify that they do.

Tested on the refuting instance: F = ℚ(i), ρ of type S at one prime x. The repaired statement asks only for T_λ-eigenvalues at λ ≠ x, λ ∤ p, which Conjecture A(1) supplies; the original also asks for the factor at x, for which no cited section exists.

## R02 (P3) — plan.json gap `selected-root-residual-only` names a supplier id that does not exist

Location: `packages/GL2ModularityLiftingPartII/design/plan.json`, `gaps` entry `selected-root-residual-only`: `section` "BT.3/lemma-9-6", `needs` "…comparison of BT.3/lemma-9-6 for Taylor–Wiles sets…". README `:265` has "…comparison of §3.5 for Taylor–Wiles sets…".

Witness: AutomorphyLiftingBeyondTaylorWiles at its head has no id "BT.3" (0 matches); the target is "### 3.5 Lemma 9.6: condition (5) of Conjecture B for n = 2" (its README line 979). The other 19 gaps have identical `needs` sentences in the plan and the README; this one differs, and the intake announces from the plan.

Repair: in the plan's `gaps` entry set `section` to "3.5" and `needs` to the README sentence: "Provide the n = 2 selected-root comparison of §3.5 for Taylor–Wiles sets with p > 2 and distinct residual roots assuming only the residual part (i) of B^gal, with no Hecke-valued lift from part (ii)."

## R03 (P3) — §3.1 (a statement of pure algebra) carries a spurious `*Needs:* §2.4`

Location: `README.md:542`, `:554`. Quote: "Let R be a local ring, M and N finite free rank-two R-modules with a group action … *Needs:* §2.4."

Witness: the statement mentions no Hecke object. Its route (`:546`) uses only reduction modulo m_R and Nakayama; I checked it: if neither coordinate map M̄ → L̄ is an isomorphism, the two images are distinct invariant lines spanning L̄, contradicting indecomposability. Quadratic Hecke doubling (§2.4) is used by the consumer §3.4, which already lists §2.4. The README's own rule (`:273`) is that no route forces unrelated prerequisites.

Repair: "*Needs:* none (Nakayama's lemma over a local ring, Mathlib)."

## R04 (P3) — Layer 2 has no §2.2

Location: `README.md:474`, `:490`, `:513`: headings 2.1, 2.3, 2.4.

Witness: no "§2.2" of this roadmap is defined; every "§§2.1–2.2" in the file refers to IntegralHeckeAndGaloisDeterminants. A consumer cannot tell whether a target was dropped.

Repair: renumber 2.3 → 2.2 and 2.4 → 2.3 and update the six internal references (`grep -n '§2\.[34]'`), before any other roadmap cites these ids. The roadmap is new, so no old → new table is needed.

## R05 (P3) — `hres` is redundant in both headlines

Location: `Suggested.lean:150–154` and `:198–202`.

Witness: every clause of `hres` follows from `htwres`, `hηcont`, `hηunram`. `3 ≤ p` is the first clause of `IsWeightOneResidual`. Continuity: ρ̄ = η̄⁻¹·(η̄ρ̄) with η̄ locally constant because η is adically continuous and k is discrete. Irreducibility: a scalar twist has the same invariant lines. Unramified at p: inertia lies in ker(η̄ρ̄) and in ker η, hence in ker ρ̄. Oddness: det(η̄ρ̄)(c) = η̄(c)² det ρ̄(c) and η̄(c)² = η̄(c²) = 1. So the statements hold without `hres`.

Repair: delete `hres` from both theorems; in `README.md:936` replace "takes an odd absolutely irreducible adically continuous residual ρ̄ unramified at p, an adically continuous lift ρ" by "takes a residual ρ̄, an adically continuous lift ρ" and add "oddness, absolute irreducibility, continuity and unramifiedness at p of ρ̄ follow from those of η̄ρ̄". Alternatively keep it and say in both docstrings that it is implied.

## R06 (P3) — the Layer comment in Suggested.lean does not match where the README states the headlines

Location: `Suggested.lean:53` "## Layer 4: Minimal weight-one R = T"; docstrings `:139`, `:181` "includes vexing primes".

Witness: `README.md:694` and `:711` state only "the no-vexing case of" each theorem in Layer 4; the full statements with twist and vexing primes are the Layer 6 target §6.5 (`:936`). The first docstring also describes `IsUnramifiedAt` (`:55`) as "specialized to GL₂", while its type is generic in the group H, exactly like the supplier's.

Repair: change the comment to `/-! ## Layer 6: Weight-one R = T with vexing primes (§6.5; the no-vexing cases are §§4.4–4.5) -/`, and in the `IsUnramifiedAt` docstring replace "specialized to GL₂" by "restated with `Ideal.LiesOver`".

## R07 (P3) — title capitalisation

Location: `README.md:1` "# Roadmap: gl₂ modularity lifting, part ii — minimal defect-one R = T".

Witness: the base roadmap's title is "GL₂ modularity lifting"; ModularCurvesPartII uses "part II". "gl₂" and "part ii" are not names of anything.

Repair: "# Roadmap: GL₂ modularity lifting, part II — minimal defect-one R = T".

## Adversarial table

| Statement | Instances tried | Values computed | Result | Change |
|---|---|---|---|---|
| `IsUnramifiedAt` | ℓ = 1; ℓ = 0; ℓ prime | no prime over (1); only Q = ⊥ over ⊥, inertia of ⊥ trivial; over (ℓ) ⇔ ℓ ∈ Q | vacuous or correct | none |
| `twist` | diag(2,3), η = 2 over 𝔽₇; η = 4 back | diag(4,6), trace 3 = 2·5, det 3 = 4·6; returns diag(2,3) | agrees with README | none |
| `IsAdicallyContinuous` | field k; O[ε]/ε² | m = 0, discrete; m² = (π², πε) | correct | none |
| `IsReducibleOn` | H = 1; S₃ over 𝔽₅; D_x irreducible over k but split over k² | every line; no line; counted reducible, inertia invariants over k are 0 | stricter than CG18 on a non-split k, never weaker | none |
| `inertiaInvariants` | trivial; diag(u,1); diag(4,1) over ℤ/9 | A²; Ae₂; 3Ae₁ ⊕ Ae₂ | correct | none |
| `IsWeightOneResidual` | p = 2; ramified scalar χ ≠ 1 | fails 3 ≤ p; invariants 0, fails | correct | none |
| `IsMinimalLift` | det 4 in ℤ/9; χ̄ψ ⊕ 1; D irreducible, ℓ ≢ −1 | 4² = 7 ≠ 1; ψ² ≠ 1; no clause, as CG18 Def. 3.1 (ramified p-power character of the unramified quadratic field needs p ∣ ℓ+1) | matches cg18 lines 584–595 | none |
| `minimal_weight_one_modularity` | ℓ = p; η = ψ cubic of conductor 7, ρ = ρ₀ψ²; nebentypus convention | ρ unramified at p from `hmin` and `hηunram`, a_p = trace; ηρ = ρ₀, level gains 49, prime to 3; Tau Ceti diamond is the lower-right entry, so det ρ(Frob_ℓ) = χ(ℓ) | true as typed | R05 |
| `minimal_lift_finite_image` | A = k; A = O[ε]/ε²; torsion kernel | image finite; excluded by rigidity; ≤ s⁴ matrices over each matrix of the torsion-free quotient | true as typed | R05 |
| §1.1 pairing and U matrix | general x, α, β; x = 1 | x⁻¹(x+1)²αβ − (α+β)² = x⁻¹(α−xβ)(β−xα); −(α−β)²; det U = ⟨x⟩ | correct | none |
| §1.2, §1.3, §6.1 Checks | 𝔽₅: (1; 1,2), (2; 1,1), A ⊗ I₂ | 4; 3 and (U−1)² = 0 for U = [[2,2],[2,0]]; det 16 = 1 | correct | none |
| §1.5, §9.4 defect formula | M = O/π; Oʳ ⊕ kˢ; Sʳ | 0; r; r, using 0 → Tor₁(M,O)/π → Tor₁(M,k) → M_Δ[π] → 0 | correct | none |
| §2.1 U_p matrix | columns (φ, ⟨p⟩V_p) | U_pψ(f,0) = ψ(T_pf, −f), U_pψ(0,g) = ψ(⟨p⟩g, 0) | README matrix correct; printed one is for (φ, V_p) | source issue |
| §3.1 criterion | Jordan block; S₃; decomposable L̄ | N ≅ M ≅ L; same; excluded | proof checked | R03 |
| §3.2–3.3 annihilators | A ⊂ A[X]/(quadratic) | J_loc ⊂ J_glob from rT̃ = im(rR̃† ⊗ A_n) ⊂ A_n; annihilator 0 | correct | none |
| §3.5 square root | 1+3 in ℤ/9; p = 2 | 7² = 4; roots 1 and 3 mod 4 | correct | none |
| §5.1 conductor and selector | x = 5, p = 3, θ₀ of order 8, λ of order 5 | a(θ) = max(a(θ₀), a(λ)) by minimality; Σ over centre 16, off centre −20 + 4; multiplicity 0 | correct | none |
| §5.5 thresholds | n = 2 full; n = 2 subcuspidal; boundary traces | dual is weight-0 cusp forms = 0; weight-0 forms ∋ constants; 3/2, 2, 3 | matches cg18 lines 2163–2167 | none |
| §6.2 dual ideal | trace 5, det 6 over 𝔽₇ | 5·6⁻¹ = 2 | correct | none |
| §7.2 two orders | O·1 + πO⁴; O[t]/∏(t − iπ) | socle dimensions 3 and 1, both rank 4 | correct | none |
| §7.4 count | type 3 | 3 ≤ dim ≤ 4, even ⇒ 4 | matches cg18 line 2805 | none |
| §9.2 determinant | roots 2, 4 over 𝔽₇ | 4 − 36 = 3 = −(2−4)²; α² − 1 = 3 | agrees with the supplier's own Check | none |
| §9.3 torsion orders | PGL₂ over imaginary quadratic F | element orders 1, 2, 3, 4, 6; unit orders 2, 4 when p = 3 is unramified | correct | none |
| §10.3 | q = 1, f = π²; f = 0 | dimension 0, length 2; dimension 1 | correct | none |
| §10.5 | type S at one prime over ℚ(i) | no supplier for the factor at x | fails | R01 |
| §10.6 | 𝔽₁₉ˣ, g = 2, α = 8 | α⁶ = 1, α² = 7 | correct | none |

## Dependency check

    depcheck: 235 roadmaps, 2132 edges, 0 problem(s)

No UPWARD, CYCLE or moved line. `git diff --stat origin/main...HEAD` outside the folder is empty; the pull request adds only README.md, Suggested.lean and metadata.toml.

## Verified sound

- Declarations read: 9 of 9 (7 definitions with real bodies, 2 admitted theorems). I ran no Lean (this pass is read-only); I compared the supplied elaborated signatures with the README statements: no binder lost, generality equal to §6.5. No `set_option`, no sorry'd data, no `lemma`, no padding found: each definition occurs in a headline.
- Headlines: the two statable ones are stated; the twelve others are named in the module docstring with the missing carrier. I found no further headline statable at the pins (J₁(N*), Katz forms over O/πᵐ, PGL₂ orbifold homology and the deformation rings are absent).
- Targets read: all 53 numbered targets (Layers 0–10), all conventions and all supplier contracts; every line of the README was read.
- Pinned declarations: 21 of 21 backticked library names exist at the pins in the files the README names (`Ideal.inertia`, `IsArithFrobAt`, `IsArithFrobAt.mul_inv_mem_inertia`, `Matrix.GeneralLinearGroup.scalar`, `scalar_commute`, `Matrix.charpoly`, `Matrix.aeval_self_charpoly`, `Matrix.det_fin_two`, `groupHomology.indIso`, `Representation.invariants`, `mem_invariants`, `ModularForm`, `CuspForm`, the two augmentation names, `Newform`, `IsEigenformAwayFromLevel`, `eq_of_forall_prime_eigenvalue_eq`, the two Chebotarev names, `dirichletLift`).
- Sibling citations checked at their heads: 15 roadmaps, about 60 section ids; all exist with the cited content (including IntegralHeckeAndGaloisDeterminants §1.6, whose heading is "Compatible local compression" but whose first target is the cited Cayley–Hamilton recognition), except the mismatch of R01. ClassicalSerreModularity's `GQ`, `IntBar`, `IsFrobAt`, `IsUnramifiedAt` exist in its Suggested.lean.
- Gaps: 20 slugs, the same set in the plan and the README; 19 identical sentences (R02 is the other). None is unowned or already provided.
- Locators verified against cg18 and cg20: about 45 of the 69 line citations, by matching each cited result number to its line and printed page in the extraction (including Definition 3.1, Theorems 1.2–1.4, Corollaries 1.5–1.6, 3.29, Theorems 3.26, 3.30, 4.8, 5.11, Lemmas 3.17, 5.9, Conjecture A, CG20 Lemma 8.14). Page ranges are a page generous in places (§3.2.1 is pp. 312–313, §3.9 starts on p. 340); none of those checked points to the wrong result, and the remaining line citations inside proofs were not opened.
- Checks: all 203 bullets read; about 60 with numerical content recomputed (the table above lists them by section); none false. Every definition has at least three.
- Ownership: no other roadmap on main or at an open head states the weight-one minimal R = T, the Wiese criterion, the multiplicity-two bound or the Bianchi R = T (`roadmaps grep` for the CG18 theorem numbers and for "Wiese"). Open pull requests were searched through the index only.

## Not verifiable

- CG22 (uncertified): the formal-bracket correction is cited by locator only.
- §6.4's claim that the source's Theorem 3.30 must have σ and σ* swapped in the homological formulation: cg18 lines 2224–2226 define H₀(ω ⊗ L_σ) as the dual of sections with σ* coefficients while step (4) (line 2333) uses sections with σ coefficients, which supports the README, but I did not check the CDT normalisation of σ_x that decides it.
- Whether AutomorphicGaloisRepresentationsPartII Layers AG2.4–AG2.6 give compatibility at every ramified place for n = 2 over imaginary quadratic F (the optional second half of R01's repair).
- The Bianchi reciprocity convention at `README.md:21` ("selects the other arithmetic eigenline").
- The contents of the suppliers' proofs behind the declared gaps.

## Source issues

- **Misprint** in cg18 at proof of Theorem 5.11, printed p. 379 (cg18 line 3334): the source says q is the dimension of the Selmer group of the untwisted trace-zero adjoint; it should be the dual Selmer group of its Tate twist, as in Proposition 5.2; affects nothing.
- **Misprint** in cg18 at proof of Theorem 3.11, printed p. 328 (cg18 lines 1272–1275): the source says U_p acts in the basis (φ, ⟨p⟩V_p) with off-diagonal entries 1 and −⟨p⟩; it should be ⟨p⟩ and −1 (the printed matrix belongs to the basis (φ, V_p)); affects nothing.
- **Gap** in cg18 at Lemma 5.9(1), printed pp. 376–377 (cg18 line 3246): the source says degree-three homology with residue-field coefficients vanishes, with no argument; it should treat order-three stabilizers when p = 3, where group homology need not vanish; affects the proof.
- **Gap** in cg18 at Corollary 1.5, printed p. 304 (cg18 lines 305–312): the source says equal one-dimensional inertia invariants suffice; it should also fix the determinant, since an extra p-power inertial character keeps the dimension but is minimal for no twist; affects a stated result.
