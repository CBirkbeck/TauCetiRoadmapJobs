# Review of ScholzeFunctorAndModpCohomologyOfTheLubinTateTower (pull request #1757 at fe3535f)

**Verdict:** accepted

No finding. Both findings of the previous report are repaired, the repairs introduce no new problem, and the one self-initiated change in this increment (the PerfectoidTowers citation) resolves at its supplier's open head. Acceptance is conditional on the seven declared supplier gaps, as before.

## Previous findings

- R01 — repaired: `Suggested.lean:88`–92 now describes `coindEvalOne` only as a continuous J-equivariant linear map to X, with the isomorphism restricted to φ=id on J=H and jointly continuous action; `README.md:434` reserves surjectivity for the closed inclusion with continuous quotient section and adds V≠0 and the locally profinite hypotheses to the noninjectivity claim; `README.md:454`–456 add the three negative/positive controls as Checks.
- R02 — repaired: the four `gap:moore-local-sl2-covering` labels are gone (`README.md:13`, 100, 466, 481 now say "supplier contract" and "from KTheoryLowDegrees §11.5"); the README's gap slugs and the plan's `gaps` list are the same seven.

## Verified sound

:robot: AI review; incremental re-review of 32 changed lines since 4ccf155. Only the changed passages, what cites them and the two previous findings were re-examined; unchanged source checks and adversarial rows are inherited from [the previous report][previous] with their values.

**Gate and elaboration.** The gate was rerun on this head: every text, dependency, metadata, stray-file, dirty and outside-folder check passed (`set_option=0 … outside-folder=0 source-material=0 OK`); the worker's gate at the same head reports `build=0`. The outside-folder diff against `origin/main` is empty and the worktree is clean. A scratch copy of `Suggested.lean` with `#check @name` for all five declarations elaborated with exactly three `sorry` warnings (lines 70, 120, 138) and no other diagnostic; the five elaborated types are identical to those of the previous round (only a docstring changed in the Lean file), so no section binder was lost: `continuousCohomology_coind_iso` still carries `T2Space`, `LocallyCompactSpace`, `TotallyDisconnectedSpace`, `IsClosed`, joint continuity and the continuous right-inverse section, and `moore_sl2_h2_vanishes` keeps `Fact p.Prime` and `2 < p`. The dependency check was rerun with the merge order, movable placement and main content:

    depcheck: 204 roadmaps, 1651 edges, 0 problem(s)

No UPWARD, CYCLE or moved line. The newly cited PerfectoidTowers is line 17 of the merge order; this roadmap is line 356.

**Padding.** On a scratch copy, `moore_sl2_h2_vanishes` and `compactLie_cohomology_finite` were restated as examples and attacked with `first | simp | rfl | infer_instance | exact …`; both fail (instance synthesis failure for `Subsingleton`, `Module.Finite` and `Finite`). The Shapiro theorem's statement is unchanged from the previous round, where it resisted the same probe. Nothing in the file restates a definition or a Check.

**R01 repair, checked by computation.** At the pin, `ContRepresentation.coindV` (`Mathlib/RepresentationTheory/Continuous/Basic.lean:533`) has carrier `{f | ∀ g h, f (φ g * h) = π g (f h)}` and `coind` (same file, line 550) acts by right translation `f ∘ (· * h)`. Hence:

- φ=id on J=H, jointly continuous action: f∈coindV forces f(h)=h·f(1); the map x ↦ (h ↦ h·x) lands in coindV, is J-equivariant (j·f_x = f_{j·x} since (j·f_x)(h)=f_x(hj)=hj·x), and is continuous into the compact-open topology because `ContinuousMap.curry` (`Mathlib/Topology/CompactOpen.lean`, the `curry` definition and `continuous_of_continuous_uncurry`) needs no local compactness; the two composites are the identity. The docstring's qualified isomorphism claim is therefore correct.
- Surjectivity under §2.1's hypotheses: with s a continuous section of H→J∖H and j(h)=h·s([h])⁻¹∈J, f(h):=j(h)j(1)⁻¹·v is continuous by joint continuity, satisfies f(j′h)=j′·f(h), and f(1)=v. The sentence at `README.md:434` is correct and needs the section.
- Noninjectivity for J=1: under the locally profinite hypotheses a point h≠1 has a clopen neighbourhood U not containing 1, and f=1_U·v with v≠0 is continuous, nonzero and vanishes at 1; a connected H with discrete V would make evaluation injective, so the added "under the locally profinite hypotheses" is needed and the added V≠0 excludes the previous counterexample.

**R02 repair.** `grep -o "gap:[a-z0-9-]*"` on the README yields exactly the seven slugs arithmetic-stein-hochschild-serre, height-zero-modular-uniformisation, local-almost-finite-image, lubin-tate-arithmetic-descent, potentially-barsotti-tate-lifts, proetale-finite-presentation, temkin-good-germs; `design/plan.json` lists the same seven with their suppliers. KTheoryLowDegrees was reread at its open head (pull request #1248, `4d2f327`): §11.5 begins at its line 1372 and the paragraph at line 1394 uses Moore's Theorems 10.3–10.4 for the local classification, establishes it first for finite kernels, and closes with "Local nonabelian covering classification remains an explicit theorem target here". The contract sentence at `README.md:100` (finite abelian A, trivial action, Hom(μ(E),A), universal kernel μ(E), norm-residue Steinberg cocycle) matches MOO68 line 2054 (Theorem 10.3, nonarchimedean k, separable locally compact abelian trivial module) and line 2060 (Theorem 10.4, universal covering with finite cyclic kernel in the nonarchimedean case).

**PerfectoidTowers citation.** PerfectoidSpaces on main has layers P0–P7 only, and its line 43 says the tower-quotient and torsor-descent layers P8–P9 form the roadmap PerfectoidTowers; so the former "PerfectoidSpaces P8" was a mislabel, and the repair is right. PerfectoidTowers was read at its open head (pull request #816, `ad8056c`, a new roadmap folder, earlier in the merge order): P8.11 (its line 1042) is the isomorphism `X^◇/G → (X/G)^◇` for a finite group acting on an analytic adic space with a G-stable affinoid cover; P8.12 (line 1055) is the equivalence between the quotient map being a finite étale G-torsor, freeness on the diamond, and trivial geometric stabilisers, under the hypothesis that the quotient is representable with `Y^◇ = X^◇/G`. The contract paragraph at `README.md:113` describes exactly these, including the retained representability hypotheses. The two consuming routes were reread: LUD17 lines 862–918 (Theorem 3.11, Proposition 3.12, Corollary 3.13) build M_B as a limit of finite-level Borel quotients and use the torsor identification U×_{ϕ(U)}U ≈ lim U_m×_{U_m/B_m}U_m ≅ U×B(ℤ_p) and the quotient's structure sheaf; SCH18 lines 819–840 (proof of Theorem 4.4) reduce to the coherent sites (ℙ/K)_ét for compact open K. The finite-level rigid steps in both are intermediate covers of finite étale Galois covers, supplied by PerfectoidSpaces P3 and P5, which §§1.5 and 3.1 and the supplier table still cite; the finite-group perfectoid steps are P8.11–P8.12. No supplier drift.

**Source verification in this increment.** MOO68 line 2054 and line 2060 (Theorems 10.3–10.4, printed pp. 51–52); LUD17 line 862, line 916, line 922 (Theorem 3.11, Corollary 3.13, Theorem 3.14, printed pp. 21–22); SCH18 line 808 and line 819 (Theorem 4.4 and its proof, printed p. 19); FUST22 line 100 and line 107 and CDN23 line 1555 are cited unchanged in §2.1 and were verified in the previous round. The sampled targets §§1.5, 2.1, 2.2 and 3.1 fall in the changed passages and are covered above; the other eleven sampled targets are untouched by the diff and their source checks are inherited from [the previous report][previous].

**Headline coverage.** Unchanged: the three statable headlines (compact Lie finiteness, noncompact Shapiro as `IsIso` of the named compatible-pair map, Moore vanishing for odd p) are present; the module docstring still names every non-statable headline and its missing carrier. No new headline, stand-in or missing statement.

**Adversarial table.** Fresh rows are for the changed statements; every other row is carried from [the previous report][previous] with its computed values.

| Statement | Instances tried | Values computed on each side | Result | Change |
|---|---|---|---|---|
| `coindEvalOne` docstring, φ=id on J=H | J=H=C₂={1,t}, X=𝔽₃ sign module | coindV = {(f(1),f(t))} = {(0,0),(1,2),(2,1)}; eval gives 0,1,2; inverse 1 ↦ (1,2), 2 ↦ (2,1); ev(t·(1,2)) = f(t) = 2 = t·1 | fresh: bijection, equivariant, inverse continuous by curry | none |
| `coindEvalOne` docstring, φ not the identity (R01 witness retained as Check) | J=H=C₂, φ trivial, X=𝔽₃ sign module | f(h)=f(φ(t)h)=t·f(h)=−f(h) ⇒ 2f=0 ⇒ f=0; image {0} ⊊ 𝔽₃ | fresh: docstring no longer claims surjectivity here; README Check at line 454 records it | R01 repaired |
| §2.1 surjectivity under the inclusion with section | H=C₂, J=1, s([h])=h; H=GL₂(F), J=SL₂(F), s(t)=diag(t,1), v arbitrary | j(h)=h s([h])⁻¹=1 so f=const v, f(1)=v; j(g)=g·diag(det g,1)⁻¹∈SL₂, f(g)=j(g)·v, f(1)=v | fresh: surjective | none |
| §2.1 noninjectivity for J=1 | H=C₂, V=𝔽₃; V=0; H=1; H=ℝ with V=𝔽₃ discrete (outside hypotheses) | kernel {(0,0),(0,1),(0,2)} of size 3; kernel size 1; identity C(1,V)≃V; C(ℝ,𝔽₃)=constants so eval injective | fresh: V≠0 and locally profinite qualifications both necessary | R01 repaired |
| Gap registration | README slugs versus plan gaps | README 7 distinct slugs, plan 7, set difference ∅ | fresh | R02 repaired |
| §2.2 Moore contract from KTheoryLowDegrees §11.5 | E=ℚ₃,ℚ₅,ℚ₂; A=𝔽₃,𝔽₅,𝔽₂ | Hom(C₂,𝔽₃)=0; Hom(C₄,𝔽₅)=0; Hom(C₂,𝔽₂)=𝔽₂; supplier line 1394 retains the finite-kernel classification as a target | fresh: wording change only, values unchanged | none |
| PerfectoidTowers P8.12 torsor criterion as consumed by §3.1 | trivial group; trivial action of C₂ on a space with a point; U_m×B_m | stabilisers trivial, torsor; stabiliser C₂, identity quotient map not a torsor; U_m×_{U_m/B_m}U_m ≅ U_m×B_m (LUD17 line 904) | fresh: the supplier's own Checks distinguish the torsor condition from finite étaleness, as the route needs | citation repointed |
| coindEvalOne, arbitrary φ | J=H=C₂, φ trivial, X=𝔽₃ sign module | f(h)=−f(h) forces (0,0); eval image={0}, target={0,1,2} | [previous][previous] | now a Check |
| continuousCohomology_coind_iso, named map | H=C₂,J=1,V=𝔽₃; H=S₃,J=1; J=H | H⁰ constants; ev(1)=1; dims 1→1; positive degrees 0→0; J=H: eval and orbit map compose to id | [previous][previous] | none |
| continuousCohomology_coind_iso, noncompact and prodiscrete | H=ℤ,J=1; V=𝔽₃, ∏ℕ𝔽₂, 0 | Δf(n)=f(n+1)−f(n), ker Δ=constants, continuous right inverse by partial sums, H¹=0, H⁰=V; zero V gives 0 | [previous][previous] | none |
| §2.2 continuous-cocycle dictionary | split extension; C₂, A=𝔽₃, b(1)=0,b(t)=2 | c=0 ↔ zero kernel map; δb(t,t)=1; both threefold products at (t,t,t) give 1 | [previous][previous] | none |
| Arithmetic finite-presentation contract, §§5.4, 6.2 | n=0, K=ℚ_p and unramified quadratic; a=1,2 | swap on k²: fixed dim 1; square of swap dim 2; duals finitely presented; a=2 two residue pieces | [previous][previous] | none |
| Conventions and actions (r=1, F=ℚ₅) | g=2 lift change; d=2; Art(w)=2 | scalar δ(2)⁻¹=3; (d·f)(1)=2; (w·f)(1)=3; Φ_geo 3, Φ_arith 2 | [previous][previous] | none |
| 0.2 components | r=1, F=ℚ₃, m=1; F=ℚ₂, m=1,2; r=2 | (q−1)q^{m−1}=2 over C, 1 over F̆; 1 and 2 unit cosets; v(det ϖI₂)=2 | [previous][previous] | none |
| 0.3 `compactLie_cohomology_finite` | d=0; ℤ_p with 𝔽_p; regular module; ⊕ℕ𝔽_p; ℚ_p/ℤ_p | dims 1 all i; (1,1,0,…); acyclic; infinite H⁰ excluded by admissibility; excluded by 0<j and hkill | [previous][previous] | none |
| 1.1 associated sheaf | r=1; π=0; all functions K→𝔽_p; ℤ_p | C⁰(Fˣ,π)=π; 0; stalk C⁰(K,𝔽_p) proper; no 𝔪-torsion | [previous][previous] | none |
| 1.2 Sⁱ and Šⁱ | r=1 π=k,0; r=2 π=k; p=2 | (k,0,…); 0; (k,0,k(−1)); trace 2=0 | [previous][previous] | none |
| 1.3 strict restriction image | U=∅; U=V point; discs | image 0; O_C/p generated by 1; inclusion orientation | [previous][previous] | none |
| 1.4 Frobenius rigidity | (O/πᵏ)ʳ; zero; constant O/π at p=2 | γ=(k,…)→(pk,…); empty; (1) vs (2) | [previous][previous] | none |
| 1.5 finiteness (Needs line changed only) | r=1; r=2 trivial 𝔽_p; A=𝔽_p[ε]/ε²; ℚ_p/ℤ_p; 𝔽_p((T))/𝔽_p[[T]] | S⁰=π; (𝔽_p,0,𝔽_p(−1),0); dim S²=2; pʲ-torsion of size pʲ with infinite S⁰ | fresh reread of README Checks against SCH18 line 808; values agree | citation repointed |
| 1.6 Galois extension and twists | k[t,t⁻¹]; k[t,t⁻¹]/(tᵐ−1); δ on ℤ₅ˣ | infinite orbit; orbit ≤m; scalar 2 vs 3 | [previous][previous] | none |
| 2.1 Fust comparison | H=1,V=0; ℤ_p,𝔽_p; C₂,J=1,𝔽₂; S₃; det section | 0=0; (𝔽_p,0); dims 2 vs 1, cohomology (1,0,…); 6-dim, 1-dim invariants; det diag(t,1)=t, det tI₂=t² | [previous][previous] | none |
| 2.1 SL₂ restriction admissibility | J compact open, Z₀ | index \|Fˣ/Fˣ²\|<∞; π^{JZ₀}=π^J finite | [previous][previous] | none |
| 2.3 Cartan–Leray | r=1; S of 0,1,2 points; π=0 | H⁰=C⁰(Fˣ,π); 0, Hʲ(U), Hʲ(U)²; 0 | [previous][previous] | none |
| 2.4 five-term sequence | π=ℤ/pᵃ; 2-dim trivial; 0; ∏ℕk | ordinary; two copies; 0; continuous functionals finitely supported | [previous][previous] | none |
| 2.5 degree-one comparison | supersingular; π=1 odd p and p=2; δ∘det | iso; cokernel 0 or k; injective | [previous][previous] | none |
| 3.1 Borel quotient (Needs line changed only) | χ=1; fibre ℙ¹(ℚ_p); diag(p,p⁻¹); diag(p,1); 1+M₂(ℤ_p) | constant sheaf; two points distinct; height shift 0; shift 1 with q(xb)=q(x); singular matrices | fresh reread against LUD17 lines 862–925; values agree | citation repointed |
| 3.2 degree-two vanishing | Ind 1 vs 1; nonsplit extension; 0→1→Ind1→St→0; p=2 | S²(Ind1)=0, S²(1)=k(−1)≠0; 0; S¹(St)↠S²(1); dim 1 | [previous][previous] | none |
| 4.1 globalisation | irreducible; nonsplit; even degree; 𝔽₉ | prescribed restriction; SL₂(k)⊂image; Σ invariants 0; [𝔽₉:𝔽₃]=2 | [previous][previous] | none |
| 4.2 block module | abs. irreducible; generic reducible; p=3 degree 3; λ=O | single constituent; pair; \|kˣ\|=26; L/O≠0 vs 0 | [previous][previous] | none |
| 4.3 Hecke-ideal torsion | I=0; I=T; χ⊕χε; generic | iso; 0; cokernel allowed; iso | [previous][previous] | none |
| 4.4 generic invariants | K=ℚ_p; ratio ε^{±1}; non-Galois K; cyclic of order m | ≤2 pairs; genericity fails; well defined; ≤m characters | [previous][previous] | none |
| 5.1 finite image | zero; one value; ⊕ℕk; LE19 over ℚ_{p³} | support ∅/1/1, dims 0/1/∞; infinite Hom | [previous][previous] | none |
| 5.2 ascent | n=0; scalar shift; supersingular; 0 | two copies of C⁰(ℤ_pˣ,k); H¹(pℤ,·)=0; Y(π)=S¹(π)^{W_K×Ǧₙ}; 0 | [previous][previous] | none |
| 5.3 finite support | K=ℚ_p; δ with p=5; p=3; p=2 | finitely many; δ(4)=4≠1; 2 characters; outside range | [previous][previous] | none |
| 5.4 arithmetic finite length | n=0 descent; μ₅; a=2; F≠ℚ_p | fixed dim 1; Hⁱ(ℤ/4,·)=0 on 𝔽₅-modules; two pieces; non-admissible | [previous][previous] | none |
| 6.1 general F | δ∘det; F=ℚ_p; large K; p=2 π=1; 0; sums | dim W; central-character case; finite; H²=k; 0; additive | [previous][previous] | none |
| 6.2 geometric Galois multiplicity | 0; χ₁⊕χ₂; χ(g)=2 mod 5; nonsplit; C_p unipotent; ∏ℕk | 0; sum; 2·3=1; surjection; map 0 since e₁=Ne₂; continuous dual | [previous][previous] | none |
| 6.3 finite length, vanishing, supersingular | d=3; d=2; d=1,0; reducible; Z=0,M | 0; constituents Π(ρ̄); finite length; quotient; 0 / χ₁⊗U | [previous][previous] | none |
| 6.4 smooth vectors | n=0; invariant line; odd p; p=2; identity level | two height classes; forbidden; 0→Hom→H²=0; k at p=2; identities | [previous][previous] | none |

The table has 41 rows: 9 fresh and 32 inherited. All fifteen sampled targets and all three Lean headlines have explicit values.

**Shape.** The new `### From TauCetiRoadmap.PerfectoidTowers` subsection sits among the supplier contracts; §2.1 now has ten Checks on the induction carrier, including the three negative/positive controls the previous round asked for; no process words, pull-request numbers, LaTeX or local paths were added (gate text scanners clean). Ownership against open pull requests: the two suppliers touched by the diff were read at their heads through `roadmaps show`; no other ownership question arises from a 32-line change.

## Not verifiable

- BW00, Chapter IX, Proposition 2.3 remains settled as uncertified; it is cited by locator only, unchanged, and was not requested.
- ProetaleCohomologyOfPAdicCurvesAndTowers (the resolver's single lead, `README.md:15`) is a board design, not a main roadmap or open-head folder; it is the named supplier of a declared gap and the previous reports inspected it there. Nothing in this increment changes that citation.
- Open pull requests whose files the brief does not list were not inspected for ownership; the diff adds no new object that could have another owner.

## Source issues

- none

[previous]: packages/ScholzeFunctorAndModpCohomologyOfTheLubinTateTower/reports/PRREVIEW-ScholzeFunctorAndModpCohomologyOfTheLubinTateTower~2.md
