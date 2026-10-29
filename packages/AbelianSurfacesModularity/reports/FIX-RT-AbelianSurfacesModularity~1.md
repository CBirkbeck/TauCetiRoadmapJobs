# FIX-RT-AbelianSurfacesModularity~1

Two red-team passes were merged. Both label their findings F01–F03, so each section below keeps the review's own label in its heading and names its pass (a or b) in its first line. The six findings do not overlap. Each one was checked against the cited supplier heads, the pins and the cached BCGP25 text before any edit.

## F01 (P2) — applied differently

Pass a. `gap:induced-character-client` (Endoscopic §13.2) → removed from the README and from the plan `gaps` list. Section 8.2 now states that for b=2 we have a=2, so G_L acts on V₁ by a scalar; V₁ is then finite up to twist by AGR §§5.12 and 7.6. The b=4 branch consumes Endoscopic §13.3 and MLE induction directly.

Evidence. The witness holds: 1⊕ε over ℚ is abelian and de Rham, is not finite up to twist, and is not induced. The suggested repair would keep a Galois-classification request on EndoscopicTransferAndUnitaryTraceComparison, but its §13.3 says the classification is the consumer's input. No rank-two dichotomy is needed in rank four: BCGP25 line 9905 applies Lemma 10.2.4 to V_i with a=2, and only its finite-up-to-twist branch can occur. The 1⊕1⊕ε⁻¹⊕ε⁻¹ irreducibility control and the ψ=ψ₀∘N non-cuspidal control are new Checks.

## F02 (P2) — applied

Pass a. `gap:dyadic-selfdual-polarized-lift` needs "admits the skew self-duality and polarized symmetric Serre–Tate extension lift" → "for W/ℤ₂ of §8.7, Cartier self-duality implies a skew self-duality to which A4.13 applies", in both files. The A4.13 contract records its hypothesis λ^∨=−λ (=λ^∨=λ on 2-torsion). Sections 8.7, 8.8 and the worked example are reworded; a split-model Check is added.

Evidence. AbelianSchemesAndArithmeticModuli A4.13 (open head) takes λ^∨=−λ as a hypothesis and owns the comparison with the formal-torus quotient and the successive lift. The narrowed claim is plausible: a brute-force test at the graded level, over the 256 extension matrices in M₂(𝔽₂²) with trivial Galois action, gave 220 self-dual and 220 symmetric-type classes, with no difference.

## F03 (P1) — applied

Pass a. Section 8.2's b=4 route ("de Rham algebraicity … force CM") → explicit steps: ψ_p is a de Rham summand (AG2.P), unramified almost everywhere (unit-group argument), algebraic by AutGalRep §3.13; AG2.0's a_τ+a_τ′=wt over K₀ makes a totally real K₀ parallel, hence excluded; a CM K₀ uses Endoscopic §13.3 and MLE induction. Needs lines and supplier blocks updated.

Evidence. AGR §5.12 (open head, line 3463) is Clifford theory over an arbitrary field and contains no algebraicity. AutGalRep §3.13 and the AG2.0 target "The l-adic character r_{l,ι}(χ)…" exist at their open heads. Tau Ceti has `TauCeti.GlobalNumberFields.HeckeCharacter.IsAlgebraic` and its purity theorem, but not the factorization through K₀; this is now recorded in the "From Tau Ceti" contract.

## F01 (P2) — applied

Pass b. `gap:odd-rank-two-system-modularity` (MLE §1.9) → removed from both files. A new block, "From TauCetiRoadmap.ClassicalSerreModularity", consumes R27.6, Theorem 10.1(i). Section 8.4 now cites R27.6 for the constituents and for the E[D_n] factor s. Local factors at every finite place are compared through Néron §6.10 and AutomorphicGaloisRepresentations §§3.7 and 3.11 (Carayol). A Hodge-symmetry Check is added.

Evidence. ClassicalSerreModularity README line 883 at its open head: odd, irreducible, regular compatible rank-two systems come from newforms of weight at least 2. Hodge–Tate weights {0,1} give weight 2. I narrowed the reviewer's "strictly compatible" to "compatible", because s in E[D_n] is a tensor factor of H¹, not a constituent of it.

## F02 (P2) — applied differently

Pass b. `gap:finite-tate-lift-local-control` (AGR §7.6) → removed. Section 3.1 now proves the step from suppliers: R17.5.4 gives the lift, oddness and the scalar ambiguity; R17.5.11 makes the reduction ϱ̄⊗η̄, removed by a Teichmüller twist; the dyadic scalar χ_v has 2-power order and is killed by base change from PL.0. Two discriminating Checks are added.

Evidence. GL2AutomorphicRepresentationsAndTransfer R17.5.4 (open head, line 2356) constructs the finite-image lift for any number field. The suggested repair would keep the narrowed request on ArithmeticGaloisRepresentations §7.6 while starting "from R17.5.4". AGR comes before GL2AutomorphicRepresentationsAndTransfer in the merge order, so that is an upward dependency. The remaining dyadic control follows in a few lines from suppliers already consumed.

## F03 (P3) — applied

Pass b. "AlgebraicCurves Layer 10 … Weierstrass points" → Layers 5, 10 and 11, in Scope, the supplier block and the five Needs lines (§§2.1, 2.2, 4.4, 5.1, 8.5). The block states the genus-two identification for characteristic ≠ 2, covering §5.1 over 𝔽₃: Weierstrass exactly when 2 is a pole number, i.e. at the ramified places of the degree-two subfield.

Evidence. The AlgebraicCurves README on main: Layer 10 starts at line 918 and has no Weierstrass points; Layer 11 (line 1039) has them, built on the gap sequences of Layer 5 (line 596). Layer 11 develops them over an algebraically closed field of characteristic zero first, so the genus-two argument is stated explicitly for 𝔽₃.

## Adversarial mathematics pass

Every statement added or changed is listed below.

| Statement | Instances tried | Values computed | Result / change |
| --- | --- | --- | --- |
| §8.2 case split (§5.12) | ab=4 | (a,b)=(4,1),(2,2),(1,4); b=1 has scalar ρ(G_L), so finite projective image | b=1 excluded; kept |
| §8.2, b=2: V₁ scalar on G_L | ρ=V⊗Ind_F χ, V odd Artin, χ exponents (1,0) | ρ restricted to G_L is χ·I₂⊕χ^c·I₂, so b=2, a=2; V₁=V⊗χ has the finite projective image of V; HT(ρ)={0,0,1,1} has 2 values | no rank-two induction needed; new Check |
| §8.2 irreducibility | ρ=1⊕1⊕ε⁻¹⊕ε⁻¹ with hyperbolic form | ν=ε⁻¹, ν(c)=−1; 2 Galois orbits {1},{ε⁻¹}; not finite up to twist | negative control; Check added |
| §8.2 finite ramification of ψ_p | K=ℚ, ψ=ε_p | unit group at w∤p is μ_(q−1)×(pro-ℓ), image 1; at w=p the image ε_p(ℤ_p^×)=ℤ_p^× is infinite | the w∤p restriction is needed; kept |
| §8.2, K₀ totally real | exponents a_τ=wt/2; ‖·‖ has exponent −1 | ψ‖·‖^(wt/2) has exponents 0, so it has finite order; ρ=ε^(−wt/2)⊗Ind(finite) | excluded; Check |
| §8.2, K₀ CM quartic | CM type (1,1,0,0) | a_τ+a_(cτ)=1=wt; not parallel | admitted; Check |
| §8.2 cuspidality | ψ=ψ₀∘N_(K/E) | Ind = ψ₀⊕ψ₀η, dimensions 1+1; AI is isobaric, not cuspidal | excluded by irreducibility; Check |
| §3.1 Sym³ twist | η̄ of order 5 or 3 | η̄³ has order 5 (gcd(3,5)=1), resp. 1 | Teichmüller twist required; Check |
| §3.1 Sym³ injective on SL₂(𝔽₄) | Brauer character of V | (4,−1,1), not constantly 4; A₅ simple, so kernel trivial | ϱ̄ trivial above 2 |
| §3.1 2-power order of χ_v | ζ₃, −1 modulo λ∣2 | N(1−ζ₃)=3, so ζ₃≢1; −1≡1 | values ≡1 are 2-power roots of unity |
| §3.1 oddness after twist | lift⊗μ | det at c: (−1)·μ(c)²=−1 | preserved; Check |
| §3.1 icosahedral choice | order-5 traces in 2.A₅ | 2cos72°=0.618=(−1+√5)/2; 2cos144°=−1.618 | the two embeddings are separated |
| ClassicalSerreModularity contract / §8.4 | HT {0,1}; split {0,0}⊕{1,1} | k=a+1=2; Hodge symmetry h^(1,0)=h^(0,1)=1 rules out the split; det(c)=−1 | Check added |
| A4.13 contract / gap | split W=(ℤ/2)²⊕μ₂²; graded brute force | e(x,x)=m(a)²=1, λ^∨=λ; 220/220 self-dual vs symmetric, 0 differ | split case needs no contract; Check |
| AlgebraicCurves contract | y²=x⁵−x over 𝔽₃ | x(x−1)(x+1)(x²+1): 3 rational roots + ∞ = 4 rational Weierstrass points; 6 over 𝔽₉ = 2g+2 | identification valid in characteristic 3 |
| MLE induction contract | degree 2, input invariant vs not | invariant input gives 2 constituents; non-invariant gives cuspidal | matches the MLE register's Checks |

Context and generality: Suggested.lean has no declarations and no variables, so no binder can be lost. The README generality is unchanged except that §8.2's route no longer relies on a rank-two statement over an arbitrary F.

## Checks run

- `lake env lean` on Suggested.lean, from the content checkout: exit 0, no messages (about 2.5 s). The file has no declarations, so the `#check @name` comparison applies to none. I elaborated a scratch `#check` of the two newly cited Tau Ceti names whose object files exist. Their types are `HeckeCharacter : (K : Type u_1) → [Field K] → [NumberField K] → Type u_1` and `HeckeCharacter.IsAlgebraic : HeckeCharacter K → Prop`. `…HeckeCharacter.add_conjugate_eq_add_conjugate` was checked in the source at `HeckeCharacter/Purity.lean` line 98; it was not elaborated, because its module is not built and Suggested.lean does not import it.
- Dependency check (`gate --depcheck … --movable`): `depcheck: 56 roadmaps, 665 edges, 0 problem(s)`, exit 0. There is no UPWARD, CYCLE or moved line.
- `roadmaps resolve` on the README: no cross-roadmap citation and no Lean name found nowhere.
- Gap consistency: the README has 16 `gap:` slugs, equal to the 16 plan `gaps` entries in supplier and needs. Only the `gaps` list of plan.json changed; every other key was compared and is identical. `git diff --check` is clean.
- No gate failures were listed in the brief.

## Ownership, sources, pins

No new target was added; every new input is consumed from an earlier owner. The new supplier blocks are ClassicalSerreModularity and AutomorphicGaloisRepresentations; both precede this roadmap in the merge order. All citations were resolved at the open-PR heads given by the roadmap tool: AGR #856, Endoscopic #999, MLE #1180, GL2 #931, AutGalRep #1007, AutGalRepPartII #1006, CSM #1020 and AbelianSchemes #849. AlgebraicCurves was checked on main. A search of main and all open heads for "finite up to twist", "Lemma 10.2.4" and "potentially abelian" found no other owner of a rank-two dichotomy. No new source was cited, so sources.toml and metadata.toml are unchanged and there is no needs-references file. Neither review contains any instruction-like text.

## Maintainer consequences

- Supplier requests withdrawn: ArithmeticGaloisRepresentations §7.6 (`finite-tate-lift-local-control`), ModularityAndLanglandsExtensions §1.9 (`odd-rank-two-system-modularity`) and EndoscopicTransferAndUnitaryTraceComparison §13.2 (`induced-character-client`). The request to AbelianSchemesAndArithmeticModuli A4.13 is narrowed to the implication from Cartier self-duality to skew self-duality.
- The design nodes of plan.json, which this job may not edit, still list the prerequisite id `EndoscopicTransferAndUnitaryTraceComparison:ET.7a/induced-character-client` (node `AM.8/potentially-abelian-automorphy`). It is a stale design-stage id, not a `gaps` entry.
- The Suggested.lean docstring now names the missing de Rham and automorphic-induction carriers for §§8.2–8.4. No Lean name changed.
