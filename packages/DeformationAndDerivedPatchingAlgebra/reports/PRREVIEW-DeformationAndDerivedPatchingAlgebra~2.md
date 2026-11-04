# Review of DeformationAndDerivedPatchingAlgebra (pull request #1034 at dc87c78)

**Verdict:** needs changes

Full review of the repaired head. First the six findings of the previous review (at 7b0ba72), then the whole roadmap: the push gate rerun, the dependency check, elaboration of `Suggested.lean` with `#check` of every declaration and a one-tactic probe of every sorried theorem, the fifteen seeded sources, the duplication and ownership audit against main, the open heads and the pins, and a computed adversarial pass. Two findings block (both ownership: a target already owned on main, and a prerequisite attributed to a supplier that does not state it); three are notes.

## Previous findings (7b0ba72), repair status

- **R01 (P1), fraction-quotient dual returns a completion.** Repaired. `README.md:1465` now reads "identify `D_O(L⊗_O E/O)≃completion(L*)`", `:1467` removes the completion only "If `O` is complete", `:1478` uses the completed adjoint cokernel at an `O`-point, and `:1473`, `:1482` add the `ℤ_(2)` controls (both sides `ℤ₂`, uncompleted `L*=ℤ_(2)` countable). The Matlis inputs are now imported from DerivedModuleAlgebra §§1.M.1–1.M.2 (`:1461`, `:1486`); the `End_O(E/O)≃Ô` statement follows from that supplier's Artinian/finite anti-equivalence (DerivedModuleAlgebra `README.md:2290–2297`) and is pinned to Stacks 08Z6.
- **R02 (P2), import the depth comparison.** Repaired. `README.md:529` "Use ... SchemeAndStackFoundations §0.17's `depth_shortExact` for nonzero finite modules. Extend ... to zero endpoints"; `:537` Needs line consumes it; `:78` contract lists it. The supplier target exists: SchemeAndStackFoundations `README.md:1200–1204` (nonzero finite modules over a Noetherian local ring, all three inequalities). The zero-endpoint extension is sound: with `L=0`, `∞−1=∞` turns bound two into `depth N ≥ depth M` and `N≅M`; with `N=0`, bound three reads `depth L ≥ min(depth M,∞)=depth M` and `L≅M`; with `M=0` all three are `∞`.
- **R03 (P3), supplier check in the acceptance file.** Repaired. `moduleCycle_specialization_coeff` and `localizedLength` are deleted; `README.md:1303–1307` now describes `moduleCycle_specialization` as PadicLocalLanglandsForGL2Qp §0.5's with the component formula as its reading. The supplier states it at its head (`TauCetiRoadmap/PadicLocalLanglandsForGL2Qp/README.md:331–334`, "construct specialization ... Prove agreement with the module cycle of `M/ϖM`").
- **R04 (P3), gate residue.** Repaired. The anchor line is gone; the gate rerun below reports `residue=0`.
- **R05 (P3), pull-request URL.** Repaired. `README.md:77` links `../GroebnerGeometry/README.md#g4-rees-algebras-and-flat-initial-families`; the heading is `TauCetiRoadmap/GroebnerGeometry/README.md:252` "## G4. Rees algebras and flat initial families".
- **R06 (P3), undeclared local names in code spans.** Repaired. The named examples (`adicGradedRing`, `adicExpansion`, `symbolicSquare`) and the other local API names (`coeffTrunc`, `relativeCotangent`, `GenericFormallySmooth`, `completeFlatBasis`, `finiteDerivedHomCompletion`, `StrictTowerAction`, `NearlyFaithful`, ...) are now prose. I extracted all 300 backticked identifiers of the README; every remaining camel- or snake-case name is either declared in `Suggested.lean` (gate `readme-ids-missing=0`), a pinned Mathlib or Tau Ceti name, or a supplier roadmap's name. The supplier names that do not exist where cited are R03 below.

## R01 (P2) — Auslander–Buchsbaum and regular-local MCM freeness are already owned on main

**Location:** `TauCetiRoadmap/DeformationAndDerivedPatchingAlgebra/Suggested.lean:144` (`auslanderBuchsbaum`); `README.md:545` "Next prove maximal-depth freeness over a regular local ring"; `README.md:556` "Prove Auslander–Buchsbaum (`auslanderBuchsbaum` in `Suggested.lean`)"; the supplier contracts (`README.md:49–89`) do not name the owner.

**Claim:** these two theorems are new targets of this roadmap and the first is a headline of the acceptance test.

**Witness:** `TauCetiRoadmap/PurityOfBranchLocus/README.md:181–187` (§0.3, on main) states both: "`IsRegularLocalRing.free_of_isCohenMacaulay` (Lemma 10.106.6 (00NT)): a maximal Cohen–Macaulay module over a regular local ring is free" and "the Auslander–Buchsbaum formula `auslander_buchsbaum` (Proposition 10.111.1 (090V)): for a nonzero finite module `M` of finite projective dimension over a Noetherian local ring, `projectiveDimension M + IsLocalRing.depth M = IsLocalRing.depth R`". Same hypotheses, same conclusion, same Stacks locators as `Suggested.lean:143–149` and `README.md:545,556`. The same section also states `IsRegularLocalRing.globalDimension_le` (Proposition 10.110.1) and `isRegularLocalRing_tfae` (Proposition 10.110.5), which `README.md:564,591` re-source for §3.2. On `M=k` over a DVR both specifications read `1+0=1`; on `M=O` they read `0+1=1`.

**Repair:** delete `auslanderBuchsbaum` from `Suggested.lean` (the README keeps the statement as consumed; `residueExtDepth` stays for `lescot_module_regular_iff` and `cohenMacaulay_action_concentration`). In the supplier contracts add PurityOfBranchLocus §0.3 with `auslander_buchsbaum`, `IsRegularLocalRing.free_of_isCohenMacaulay`, `IsRegularLocalRing.globalDimension_le` and `isRegularLocalRing_tfae`, with their hypotheses (nonzero finite, finite projective dimension, Noetherian local; MCM over regular local). Rewrite `README.md:545–560` so that §3.1 consumes these and keeps only what is new here (the zero-endpoint depth extension, the minimal-resolution comparison with native `Tor_j(M,k)` ranks, the syzygy bound). Point §3.2's uses of 10.110.1 and 10.110.5 at that supplier as well. Tested on the instances above: nothing changes numerically; only ownership moves.

## R02 (P2) — The associated-prime depth bound is attributed to a supplier that does not state it

**Location:** `README.md:78` ("`SchemeAndStackFoundations` §0.17 supplies `Module.depth`, ... associated-prime bound, ..."); `README.md:545` ("the associated-prime depth bound and the regular local dimension formula force every associated prime ... to be zero"); `README.md:1231` ("Needs: ... the supplier's associated-prime depth bound"); `README.md:1742–1744` ("Auslander–Buchsbaum and the associated-prime dimension bound give `dim Supp H^m(C) ≥ d−(m−a)`").

**Claim:** for finite `M` over a Noetherian local ring and `p∈Ass M`, `depth M ≤ dim A/p`, supplied by SchemeAndStackFoundations §0.17.

**Witness:** SchemeAndStackFoundations `README.md:1138–1216` (§0.17, all of it) has `depth_le_supportDim` (`depth M ≤ dim Supp M`), `depth_eq_zero_iff` (`m∈Ass M`) and `IsCohenMacaulay.unmixed` (for a CM module, `p∈Ass M ⇒ dim(R/p)=dim Supp M`), and nothing about associated primes of a non-CM module. Neither Mathlib nor Tau Ceti at the pins defines depth (`Mathlib/RingTheory/Depth/` holds only `Rees.lean`). The §9.2 route needs the bound for `K=coker(P^(m−1)→P^m)`, which is not CM in general, so `IsCohenMacaulay.unmixed` does not cover it; the §3.1 use is covered by `depth_le_supportDim` plus `IsCohenMacaulay.unmixed` (a maximal-depth module is CM), the §9.2 use is not. The statement is Stacks Lemma 10.72.9, tag 0BK4 (stacks-algebra line 8100–8101: for `p∈Ass(M)`, `dim(R/p) ≥ depth(M)`), and Calegari–Geraghty Lemma 6.1 (cg2018 line 3568–3576) proves exactly the consequence §9.2 uses.

**Repair:** state the bound as a target of §3.1 with locator Stacks Lemma 10.72.9 (tag 0BK4), hypotheses "Noetherian local `A`, finite `M`, `p∈Ass M`", conclusion `depth M ≤ dim A/p`, and the consequence "a nonzero submodule of a module of depth `e` has support dimension at least `e`" (CG Lemma 6.1); replace "associated-prime bound" in the §0.17 contract by the two statements that section does have; point `:545`, `:1231` and `:1744` at the new target. Checks: `A=O`, `M=O⊕k`: depth `0`, `Ass={(0),(π)}`, bounds `0≤1`, `0≤0`; `A=k[[x,y]]`, `M=A/(x)`: depth `1`, `Ass={(x)}`, `1≤1`.

## R03 (P3) — Supplier declaration names that do not exist where they are cited

**Location and witnesses:**

- `README.md:12,82`: "`Coherent.DualizingComplex` and `Coherent.NormalizedDualizing`". SchemeAndStackFoundations `README.md:4392–4401` (§2.21) names them `DualizingComplex A ω` and `NormalizedDualizing A ω` and says "The strand `Coherent` of `Suggested.lean` contains ... §2.18; this subsection is specified in this README only". The `Coherent.` prefix exists only for §§2.18–2.19 names (`Coherent.IsLocalCompleteIntersection`, `README.md:4107`). The worker's citation scan flagged both names.
- `README.md:89`: "In the same namespace `ghost_nilpotence` and `action_annihilator_power` ..., `exists_idempotent_splitting` ..., and `finite_local_factors` ...". At its open head, IntegralHeckeAndGaloisDeterminants names only `HeckeImage.derived_hom_finite`, `HeckeImage.ghost_nilpotence` and `HeckeImage.IsGhost` (`TauCetiRoadmap/IntegralHeckeAndGaloisDeterminants/README.md:2841,2905`; `Suggested.lean:328,334`). The three other statements exist as prose targets of §2.2 (`README.md:2895–2954`: the action-annihilator bound `I^(b−a+1) ≤ ker α`, the finite local-factor decomposition over a complete Noetherian local base, the specified idempotent summands `eC` with `i ≫ p = 1`, `p ≫ i = e`), with no Lean names. The roadmap grep over all open heads finds the three names only in this README.
- `README.md:15,85`: "`PadicMeasuresIwasawaAlgebras` Layer 1 owns completed group algebras and their augmentation maps" / "L1 supplies `O[[Z_p^q]]`, finite group-ring quotients and the augmentation". PadicMeasuresIwasawaAlgebras `README.md:567–575` builds measures and compares them with `completedGroupAlgebra ℤ_p Γ` "of Tau Ceti ProfiniteProPGroups, layer 9"; augmentation appears there only as the pinned `TauCeti.MonoidAlgebra.augmentation` (`:296`) and in §6.1 (`:3464–3465`).
- `README.md:18,1834`: GrothendieckEulerForms Layer 5 "triangle additivity" / "compatible-triangle additivity are supplier contracts". GrothendieckEulerForms `README.md:383–412` has finite-exact-sequence formulas, the bounded-complex Euler–Poincaré theorem and Ext-Euler additivity; distinguished-triangle additivity for `D(A)` is a consequence (long exact cohomology sequence plus the finite-exact-sequence formula) that no supplier states.

**Repair:** cite by section and content. Write "SchemeAndStackFoundations §2.21 `DualizingComplex`, `NormalizedDualizing`"; "IntegralHeckeAndGaloisDeterminants §2.2: the action-annihilator bound with exponent `b−a+1`, the finite local-factor decomposition and the specified idempotent summands" without invented names; "the completed group algebra of ProfiniteProPGroups Layer 9 with PadicMeasuresIwasawaAlgebras Layer 1's finite-quotient comparison, and the pinned `TauCeti.MonoidAlgebra.augmentation`"; and in §9.5 state the triangle additivity as this roadmap's one-line derivation from GrothendieckEulerForms Layer 5's exact-sequence formula. No mathematics changes; the resolved contracts are listed under Verified sound.

## R04 (P3) — The Pilloni locator in §3.3 points at an unrelated lemma

**Location:** `README.md:614`: "Pilloni, Lemma 10.1.1 and proof of Lemma 10.3.1, pp. 57, 60" as a source of the module-level flatness statements (fibre nonzerodivisor lifts, free closed fibre lifts, `pd_B N ≤ d` over a flat local map with regular fibre, the fibre injection criterion).

**Witness:** pilloni-2020 line 2625–2628 (p. 57): Lemma 10.1.1 is an exact sequence `0→L∩H₁^⊥→L→L/(L∩H₁^⊥)→0` of finite flat group schemes (a truncated Barsotti–Tate group and an étale quotient); line 2754–2759 (p. 60): the proof of Lemma 10.3.1 proves finite flatness of a map of formal schemes from regularity of the target, Cohen–Macaulayness of the source and Matsumura's miracle flatness, which this README consumes from ModularCurves §4D. Neither passage contains a statement about lifting fibre nonzerodivisors or bases, or about projective dimension over a flat local map.

**Repair:** delete the Pilloni locator from §3.3; EGA IV₃ Theorem 11.3.10 with Lemma 11.3.10.1 (egaiv3 line 5571–5592, the local flatness criterion `M` flat over `A` and `M/m_A M` flat over `B/m_A B` iff `B` flat over `A` and `M` flat over `B`, for a nonzero finite `C`-module) and the Stacks tags already cited carry the paragraph. If a Pilloni passage was intended, give the lemma that states the lifting of a fibre basis.

## R05 (P3) — `balanced_module_patching` carries a hypothesis the source does not have

**Location:** `Suggested.lean:228` (`hp : 3 ≤ p`); `README.md:1095` "`p≥3`" and `:1102` "No claim here extends the source's stated `p≥3` range".

**Witness:** cg2018 line 447–467 (Proposition 2.3) has no hypothesis on `p`; `p ≥ 3` enters that paper only in the arithmetic theorems (lines 193, 226, 288, 305, 326). The proof (lines 468–500 onward) uses only that `S_N=O[(ℤ/p^N)^q]` is a complete Noetherian local ring with finite residue field and that `R_∞`, `S_∞` are topologically finitely generated; both hold for `p=2` and in equal characteristic. The roadmap's own §5.6 criterion is stated "including `p=2` and equal characteristic".

**Repair:** drop `hp` and the two sentences; keep the `p=2` group-ring Check of §3.10 as a positive instance. The other coefficient hypotheses (`Algebra ℤ_[p] O`, `Module.Finite ℤ_[p] O`, `CharZero O`) are the source's standing notation and may stay or be relaxed to a complete DVR with finite residue field, which is all the proof uses.

## Verified sound

**Gate and dependency check.** Rerun at dc87c78:

```text
gate DeformationAndDerivedPatchingAlgebra: set_option=0 blob=0 latex=0 tex=0 prnum=0 sorry-data=0 sorry-examples=0 residue=0 private-paths=0 imports=0 mathlib-subimports=0 no-import-mathlib=0 lean-lines=0 forbidden=0 dropped=0 readme-ids-missing=0 empty-sections=0 round-labels=0 long-fences=0 layer-ids=0 target-ids=0 depcheck=0 metadata=0 stray-files=0 dirty=0 outside-folder=0 source-material=0 OK
depcheck: 211 roadmaps, 1455 edges, 0 problem(s)
```

No UPWARD or CYCLE line. `git diff --stat origin/main...HEAD` outside the folder: empty. The folder holds `README.md`, `Suggested.lean`, `metadata.toml` only. No `set_option`, `lemma`, `#eval`, `#print`, LaTeX delimiter, process word or pull-request number in either file. The open-pull-request suppliers cited (PadicLocalLanglandsForGL2Qp, ArithmeticGaloisDuality, DeformationAndDerivedPatchingAlgebraPartII, IntegralHeckeAndGaloisDeterminants) are all earlier in the merge order or in the allowed list; the roadmaps named only under Downstream consumers (LocalGaloisDeformationRings, PadicFamilies, GlobalGaloisDeformations, OrdinaryAutomorphicFormsAndModularityLifting, GL2ModularityLifting) are not cited as suppliers anywhere in the layers.

**Elaboration.** `lake env lean` on `Suggested.lean` from the worktree: exit 0, exactly 19 `declaration uses sorry` warnings (the 19 theorems), nothing else. A scratch copy with `#check @name` for all 33 declarations (14 definitions and abbreviations, 19 theorems) elaborated; I compared every elaborated type with its README statement. No binder was lost: `IsAdicComplete` on `A`, `B`, `O`, `R`, `S`, `Q` where the README says complete; `Finite (ResidueField O)` in both patching theorems; `Module.Flat A S` in the flat completion; `Nontrivial N` in Auslander–Buchsbaum, Lescot, top local cohomology, the Hilbert–Samuel polynomial, the patching module and the finite-projective theorem; `IsLocalHom` on every coefficient map; the scalar towers; the derived action `ρ : R →ₐ[S] End C` and its cohomology compatibility `hact`. `IsMinimal` and `CompleteFlatComplex` keep `[IsLocalRing R]`; `FormallyUnmixed` keeps `[IsLocalRing A]`; `residueExtDepth` quantifies over `Nontrivial (Ext (ResidueField A) N n)` as the README says. A second scratch copy replaced every `sorry` by `first | rfl | (simp; done) | infer_instance | (simp_all; done) | (aesop; done)`: all 19 theorems remained unproved (19 errors, one per theorem), so none is padding by the one-tactic test; none restates a definition or mirrors a Check.

**Headline coverage.** The README's principal conclusions (`README.md:3`) are balanced module patching (§5.5, `balanced_module_patching`), CM concentration from codimension and amplitude (§9.2, three theorems), compatibility of patching with canonical duality (§9.3, `patched_dual_concentration` and `finiteActionCanonicalDuality_ext` for the native parts; the patched functor named in the docstring as not statable) and support transport (§§9.4–9.7, named as not statable with the missing carriers). The free-module criterion (§5.6), formal presentation, flat completion, Lescot, finite actions, top local cohomology, Hilbert–Samuel degree, multiplicity-one regularity, integral points, parafactoriality and the two minimal-representative theorems are stated. The hull equation bound (§2.5) is named as not statable. No statable headline is absent; R01 is the one headline that belongs to another owner.

**Seeded sources.** All fifteen targets were checked against legally fetched texts (ids in parentheses are this review's fetch keys; arXiv, Numdam, Stacks and author pages).

| Target | Locator read | Comparison |
|---|---|---|
| 1.5 | stacks-algebra line 10729–10758, Lemma 10.97.5 (05GH), pp. 227–228 | Homogeneous generators `g_j∈J∩I^(d_j)`, corrections `a_j∈I^max(0,n−d_j)` with `x−Σa_jg_j∈J∩I^(n+1)`, convergence by completeness: exactly §1.5's correction theorem. Stacks derives Noetherianity of `gr` from finite generation of `I`; the README takes it as the hypothesis, which is weaker. |
| 1.13 | andre-2018 line 205–227, Lemme 1.1.1, pp. 75–76 | `R` Noetherian, `S` flat not necessarily Noetherian, `Ŝ` flat over `R`, `(MS)^≅MŜ` for finite `M`, faithful flatness when `I⊂Jac(R)` and `S` faithfully flat: identical to §1.13 and to `flatCompletion_finiteComparison`. |
| 2.3 | stacks-artin line 1816–1834 (07YG), 1906–1924 (07YI); gee-2022 line 608–617, Lemma 3.13, p. 13 | Obstruction functor, naturality in deformation situations, lift iff zero; the key example evaluates relations on lifts of variables. Gee's injection `Hom(J/mJ,F)↪H²` is the arithmetic instance; §2.3's presentation obstruction is the key example with the minimality hypothesis removing the `Hom(R^n,I)` ambiguity. |
| 3.3 | kisin-2009 line 3543–3562, Lemma 3.3.4, p. 1159; egaiv2 line 4244–4262, Prop. 5.7.9; egaiv3 line 5571–5592, Thm. 11.3.10 and Lemma 11.3.10.1 | Lemma 3.3.4: Noetherian domains of the same finite dimension, `L` nonzero finite projective over `A`, map finite; regular case finite projective faithful. The Lean signature is this statement; faithfulness without regularity is in Kisin's proof (`D=D'⊆End_A L`). EGA gives the depth/dimension comparison through a finite action image (5.7.9 with `B/b`) and the fibre criterion for nonzero finite `C`-modules. The Pilloni locator is R04. |
| 4.1 | stacks-algebra line 5703–5707, Lemma 10.51.4 (00IP); `Mathlib/RingTheory/AdicCompletion/Functoriality.lean:446` | Krull intersection for a finite module over Noetherian local; `surjective_of_mkQ_comp_surjective` needs `[IsPrecomplete I M] [IsHausdorff I N]`, which the README supplies as completeness of `A^r` and separatedness of the target. |
| 4.2 | kw2 line 2140–2149, Corollary 4.7, pp. 45–46; stacks-algebra line 20761–20772, Lemma 10.161.8 (032L) | Non-nilpotent `p` gives a prime not containing `p` and a map to the integers of a finite extension; the integral closure of a Noetherian normal domain in a finite separable extension is finite. Lean adds `CharZero K` for separability and concludes a local map; locality holds because all maximal ideals of the semilocal integral closure lie over the maximal ideal of the local image of `B`. |
| 5.1 | cg2018 line 429–442, Definitions 2.1–2.2, p. 11 | Defect `β₀−β₁`, balanced iff defect `≥0`, square presentation `S^d→S^d→M` with `d=β₀`. `HasSquarePresentation` is equivalent: a non-minimal square presentation `S^d→S^d→M` has kernel `K'⊕S^(d−β₀)`, so `β₁+d−β₀≤d`. |
| 5.2, 5.4 | cg2018 line 447–500, Proposition 2.3 and proof, pp. 11–12; taylor-2008 line 187–199, Definition 2.1 and Lemma 2.2 | Patching data `(φ,X,ψ,P)`, finitely many isomorphism classes at each level because `R_∞`, `S_∞` are topologically finitely generated, open ideals `d_N` with `ϖ^N R⊂d_N⊂ϖ^N R+Ann_R H`. §5.2–5.4 retain these decorations and add the uniform `A/m_A^b` bound; Taylor's near-faithfulness definition and quotient lemma are §6.1–6.2's. |
| 7.3 | stacks-more-algebra line 9101–9117, Lemma 15.77.6 (0BCC); stacks-algebra line 11464–11480, Lemma 10.102.2 (00MT); boxer-pilloni-2025 line 1076–1101, Lemmas 2.6.6–2.6.7, pp. 21–22 | Ranks `dim_κ H^i(K⊗κ)`, uniqueness up to isomorphism; unit entry splits an identity disk; residual middle exactness over any local ring gives exactness and split kernels and images. All three match §7.3, including that no endpoint condition is asserted. |
| 8.1 | gee-newton line 532–541, 581–619, Lemma 2.2.2, Definition 2.2.5, Lemma 2.2.6, Corollary 2.2.7, Remark 2.2.8, pp. 12–13 | `Spec(A^I)` is the set of ultrafilters, `A_(I,x)=A`, bounded complexity `(a,b,D)`, finitely many minimal complexes since `B` is finite, one minimal model on a large set. §8.1's finite germ evaluation and selected profile are this. |
| 8.3 | acc-2023 line 6377–6400, 6426–6500, Definition 6.4.3, Remark 6.4.4, Definitions 6.4.7, Lemma 6.4.9, Proposition 6.4.10, pp. 1054–1057 | Cofinite `I_J`, `C(J,N)=S_∞/J⊗^L C_N`, `I(J,N)^δ=0`, `R(d,J,N)` quotients of a common `R_∞/m^(e(d,J))`, `d₀(J)` independent of `N`, perfectness via Gee–Newton 2.2.7, surjection `R_∞↠T(J,∞)/I(J,∞)`, augmentation when `J⊇a_∞`, compatibility of `J₁⊂J₂`. §8.3 matches item by item. |
| 9.2 | cg2018 line 3568–3599, Lemmas 6.1–6.2, p. 89; ikm-2024 line 2116–2143, Lemma 10.7, p. 48; christensen-iyengar-2021 line 200–209, Proposition 6, p. 5 | CG: `codim H^m ≤ pd K_m ≤ m` via Auslander–Buchsbaum and the associated-prime bound (R02), equality forces concentration at `l₀`, depth `n−l₀`, pd `l₀`. IKM: CM base, derived action of `R` with `dim R≤dim S`, residue cohomology in `[0,dim S−dim R]` gives concentration and MCM over `R`; Christensen–Iyengar's `sup H(F⊗M)=dim Hom(F,R)−dim R` supplies the dual-dimension step. The three Lean theorems carry these hypotheses; the extra conclusions `dim R=d−l` and `pd_S N=l` follow because `depth_R N ≤ dim R ≤ d−l ≤ depth_S N = depth_R N`. |
| 9.4 | acc-2023 line 6160–6183, Lemma 6.3.3 and the construction after it, pp. 1049 | A maximal and minimal prime splits off an Artinian local factor; `C_p=e_p(C⊗S_q)` with `T_p`-action and finite-length cohomology over `T_p`. §9.4's generic block is this; the non-isolated warning matches "not literally a localization over `T`". |
| 9.7 | acc-2023 line 6304–6318, Corollary 6.3.9 and proof, pp. 1052–1053 | `x` on a maximal-dimension component, `y=x∩S_∞`, `x` in the support of `H^*(C_∞⊗S_∞/y)_y`; for one-dimensional characteristic-zero `y` this is support after inverting `p`; proof by the top degree `r` and the right edge of the Tor spectral sequence. §9.7 adds the `π∉y` reading and the equal-characteristic caveat, which the Check `O=ℚ[[π]]` computes (`ℚ((X))[0]≠0`, killed by inverting `π`). |

Also read while checking the rest: acc-2023 line 6098–6108 (Lemma 6.3.2), 6184–6206 (Lemma 6.3.4) for §9.5; cg2018 line 3607–3651 (Theorem 6.3) and 3773–3800 (Proposition 6.6) for §8.6 and the one-module comparison; kisin-2009 line 3471–3498 (Proposition 3.3.1, the cutoffs `c_m` and `m^(r_m)`) for §§5.6–5.7; pilloni-2020 line 362–392, 425–432 (Propositions 2.2.1–2.2.2, Lemma 2.3.1) for §7.5; ikm-2024 line 2145–2148 (Lemma 10.8) for §7.9; stacks-algebra line 8100–8112 (Lemma 10.72.9, 0BK4) for R02.

**Computed adversarial pass.** `k` a field, `O` a DVR with uniformizer `π` and fraction field `E`; a displayed pair is the two sides' values on the instance.

| Statement | Instance | Values computed | Result |
|---|---|---|---|
| Cochain convention, Tor index | `k⊗ᴸ_O k`; module in degree `b` | `Tor₁=k` in degree `−1`, `Tor₀=k` in degree `0`; `M[−b]` has `M` in degree `b` | Retain |
| Dual and bidual signs (§7.6) | `P=[Q→2 Q]` in `0,1` | dual in `−1,0` differential `+2`; bidual in `0,1` differential `−2`; signed evaluation `(+1,−1)`: `(−2)·1=(−1)·2` | Retain |
| 1.1 Rees quotient | `I=0`; `I=A`; `k[[x]],(x)` | pieces `(A,0,…)`; all zero; `[x]·[x]=[x²]` in degree 2 | Retain |
| 1.2 injectivity criterion | `A=k[[t²,t³]]⊂B=k[[t]]`, `I=t²A`, `J=t²B` | `t⁵∈I∖t⁴A`, `t⁵∈t⁴B=J²`: class nonzero in source, zero in target | Retain |
| 1.4 length recurrence | `G=k[X]/X²`, `x=X`, `n=1` | `0−1=0−1` | Retain |
| 1.5 correction theorem | `K=(x²+x³)`, `I=(x)` | initial generator `x²`, `(x²+x³)=(x²)` since `1+x` unit; colength 2 | Retain |
| 1.7 small extensions | `ℤ/4→ℤ/2`; `ℤ/8→ℤ/2` | kernel `(2)` killed by `m`; `2·2=4≠0` | Retain |
| 1.8 truncations | `A=ℤ₂` | level `0` is `𝔽₂`, level `2` is `ℤ/8`, limit `ℤ₂` | Retain |
| 1.9 `seriesPresentation_surjective` | `O→O`, `r=0`; `O[[x,y]]→O[[x]]`, `y↦0`; `O→O[[x]]`, `r=0` | onto; cotangent generated by `x`, onto; relative cotangent `k`, `hcotangent` fails and the map is not onto | Retain |
| 1.12 completed coproduct | `O[[x]]⊗̂O[[y]]` | `O[[x,y]]`, cotangent `k²=k⊕k` | Retain |
| 1.13 `flatCompletion_finiteComparison` | `M=O/π^s`, `S=O`, `I=(π)`; `I=A` | both sides `O/π^s`; both sides `0` | Retain |
| 1.14 finite algebra over completion | `ℤ_(5)[i]` over `ℤ₅` | `5=(2+i)(2−i)`, two factors | Retain |
| 1.15 parameter cofinality | `d=2`, exponent `n` | `I^(2n−1)⊂(xⁿ,yⁿ)`; `x^(n−1)y^(n−1)` of degree `2n−2` is outside | Retain |
| 2.1 minimal presentation | `R=k` over complete DVR `Λ` | `d=0`, `J=(π)⊄m_S²` but `⊂m_ΛS` | Retain relative condition |
| 2.3 obstruction | `k[[X]]/(X²)`, `k[t]/t³→k[t]/t²`, `X↦t` | `[X²]↦t²≠0`; nonminimal `k[[Y]]→k`: lifts `0`, `ε` differ | Retain |
| 2.6 matrix ring | `g²=1`, residual `1` | char 2: `k[[X]]/X²`; char ≠2: `X(2+X)`, quotient `k`; `ℤ₂`: `ℤ₂[[X]]/(X(2+X))` reduced, fibre `𝔽₂[[X]]/X²` | Retain |
| 2.8 orbit functor | `(t,t)`, `(t,t+t²)` in `A×_B A` | unit `(1+a₁t+…,1+a₂t+…)` with `a₁=a₂` cannot move the `t²` coefficient of one factor only | Retain |
| 3.1 zero-endpoint extension | `0→0→M→M→0`; `0→O→π O→k→0` | `(∞,d,d)`: `d≥d`, `d≥d`, `∞≥d`; `(1,1,0)`: `1≥0`, `0≥0`, `1≥1` | Retain |
| 3.1 Auslander–Buchsbaum | `M=O`; `M=k` over `O` | `0+1=1`; `1+0=1` | Sound; R01 ownership |
| R02 bound | `M=O⊕k` over `O`; `A/(x)` over `k[[x,y]]` | depth `0`, `Ass={(0),(π)}`, `0≤1`, `0≤0`; depth `1`, `Ass={(x)}`, `1≤1` | Sound; R02 ownership |
| 3.2 `lescot_module_regular_iff` direction | `N=O/π²` over `O`; `A=k[ε]/ε²`, `N=A` | `Ext¹(k,O/π²)=k→Ext¹(k,k)=k` is the identity; `Hom(k,A)=kε→Hom(k,k)` is zero and higher Ext vanish | Retain |
| 3.2 Koszul criterion | empty list; `[π]` over `O`; `[0]` over `k` | `H₁=0,0,k` | Retain |
| 3.3 `finiteProjectiveFaithful_of_equalDimensionDomains` | `A=D=O`, `M=O^r`; `A=O`, `D=O[[t]]`, `t↦0` | finite, faithful, projective; `dim D=2≠1`, excluded; `ann_D M=(t)` shows the dimension hypothesis is used | Retain |
| 3.4 regular-sequence ideal | `(X²,XY)⊂k[[X,Y]]`; `(2,1+√−5)` | height 1 with two generators; principal on a cover, not principal globally | Retain |
| 3.6 symbolic square | `k[x,y,z]/(xz−y²)`, `p=(x,y)` | `zx=y²`, `z∉p`, `x∉p²` | Retain |
| 3.7 `localCohomology_top_nonzero` | `k`; `O`; `k[[x,y]]/(xy)` | top degrees `0,1,1`; `H¹(O)=E/O≠0`, `H¹(O)⊗k=0=H¹(k)` | Retain |
| 3.8 noncomplete duality | incomplete `O`, `K=O`, `ω=O[1]` | left side `Ô[1]`, not `O[1]` | Retain |
| 3.9 canonical module | `S=k[[x,y]]`, `A=S/(x²,y)` | `Ext²_S(A,S)≅A`, socle of `k[x]/x²` one-dimensional | Retain |
| 3.10 group-ring CI | `C₂`, `p=2`; `C_p×C_p` | `T²+2T`, repeated root mod `π`; socle `T₁^(p−1)T₂^(p−1)` | Retain |
| 3.11 `hilbertSamuel_polynomial` | `k^r`; `O`; `k[[x,y]]` | `P=r`, degree `0`, `0!·r=r`; `n+1`, degree `1`, coefficient `1`; `(n+1)(n+2)/2`, degree `2`, `2!·1/2=1` | Retain |
| 3.12 scaling | `ℤ`, `I=(2^r)` | `length ℤ/2^(r(n+1))=r(n+1)`, `e=r`; `r=0` gives `0` | Retain |
| 3.13 `multiplicityOne_regular` | `k[ε]/ε²`; `k[[x,y]]/(x²,xy)`; `k` | unmixed, `e=2`, not regular; `H(n)=n+2`, `e=1`, embedded `m`, not unmixed, not regular; `d=0`, `P=1`, `0!·1=1`, regular | Retain |
| 3.13 initial form | `k[[u,v]]/(u²−v³)`, `x=u` | `u` regular, `in(u)=u` zero divisor in `k[u,v]/(u²)`, `length A/(u)=3>e=2` | Retain |
| 3.15 plane curve | `f=x⁴` | cumulative `1,3,6` at `N=0,1,2`; `P₄(N)=4(N+1)−6` gives `−2,2,6`; defects `C(3,2),C(2,2),0=3,1,0` | Retain |
| 4.1 residual finiteness | `O/πⁿ`; `O[[X]]/π`; `k→k[ε]/ε²` | finite not flat; infinite fibre; fibre dimension `2`, finite | Retain |
| 4.2 `exists_integral_point_of_not_nilpotent` | `B=O/πⁿ`; `B=O[ε]/ε²`; `O=ℤ_(5)`, `B=O[i]` | `π` nilpotent, no point; point `ε↦0`; target `ℤ_(5)[i]` has two maximal ideals, both over `(5)`, so `f` is a local hom although the target is only semilocal | Retain |
| 4.4 topology of formal smoothness | `E=ℚ_p` | `Ω_(E/ℚ)` infinite-dimensional (uncountable transcendence degree), discrete formal smoothness fails, `X`-adic holds | Retain |
| 4.5 inseparable diagonal | `L/K` purely inseparable of degree `p` | `L⊗_K L=L[ε]/ε^p≠L` | Retain |
| 4.6 pointed domains | `O'=ℤ_p[√p]`, `p` odd | `(α⊗1−1⊗α)(α⊗1+1⊗α)=0`, no `O`-point | Retain |
| 5.1 group-ring defect | `M_Δ=O^r⊕T` | `β₀=r+t`, `β₁=dim(Tor₁(M,O)/π)+t`, defect `r−dim(Tor₁(M,O)/π)` | Retain |
| 5.1 square presentation ⟺ balanced | `S^d→S^d→M` non-minimal | kernel `K'⊕S^(d−β₀)`, so `β₁≤β₀` | Retain |
| 5.5 `balanced_module_patching` | `q=1`, `R=O`, `X_n=O`, `H₀=O`; `H₀=0` | free rank `1`; rank `0`; `p=2`: `S_N` still local | Sound; R05 unused `hp` |
| 5.6 `patching_surjection_iso` | `r=0`, `R=T=O`, `N=O^s`; `r=1`, `N_n=A/((1+x)^(p^(n+1))−1)`; `R=O/π^k`, `s>0` | empty regular sequence, `finrank=s`; rank one over `S/J_n`, augmentation `O`; `π^k N=0` contradicts `N≅O^s`, so `R=O` | Retain |
| 5.6 proof route | `N_∞≅S^s` with `A`-action | `depth_A N_∞=r+1=dim A` so free; `ker ψ_∞=ι_∞(a)A=ψ_∞⁻¹(ker f)` so `f` injective; `(π,ι(z_i))` parameters hence regular | Retain |
| 6.4 faithful versus flat | `k[[t²,t³]]`, `M=(t²,t³)`, `I=(t²)` | `t³·t²=t⁵`, `t³·t³=t⁶∈IM`; `ann(M/IM)=(t²,t³)⊋I` | Retain |
| 6.6 connectedness | `k[[x,y]]`, `I=(xy)` | `0≥2−1−1=0` | Retain |
| 6.7 specialization | `A=O[[x]]/(x²−π)`, `M=A`; `A=O[ε]/ε²` | DVR, generic length `1`, special cycle `2[(x)]`; generic length `2`, special `2[(ε)]` | Retain |
| 6.8 monomial covers | `(ab,ac,ae,bc,bd,cf)` | minimal covers `{a,b,c},{a,b,f},{a,c,d},{b,c,e}`, all of size 3 (disjoint edges `ae,cf,bd` force `≥3`); multiplicity `4` | Retain |
| 6.9 `localCI_parafactorial` | `k[[x,y,z,w]]/(xy−zw)` (dim 3) | ideal `(x,z)` nontrivial off the closed point; dimension `≥4` needed | Retain |
| 7.3 `minimal_finiteFree_representative` | identity disk over `k`; `O→π O` in `−1,0` | contracts to `0`; already minimal, ranks `(1,1)` | Retain |
| 7.3 middle exactness | `A→π A→0 A` | residue middle homology `k≠0` | Retain |
| 7.5 `completeFlat_minimal_retract` | `E`-stalk over complete `O`; `(1)_(j≥0)` | `∩πⁿE=E`, not separated, excluded; constant family not in the restricted completion | Retain |
| 7.6 fraction-quotient dual | `O=ℤ_(2)`, `L=O`; `O=ℤ₂` | `D(E/O)=ℤ₂=completion(L*)`, `L*=ℤ_(2)` countable; both `ℤ₂` | Retain (R01 of 7b0ba72 repaired) |
| 7.6 adjoint cokernel | `P=[O→π^s O]` in `0,1` | cokernel `O/π^s`, `(E/O)[π^s]≅O/π^s`, Matlis dual `O/π^s` | Retain |
| 7.8 Hom completion | `P=[O→π O]` in `−1,0`, `Q=O[0]` | `Hom_D(k,O)=0` | Retain |
| 7.9 ghosts | `k[0]⊕k[−1]` | `δ≠0`, cohomology action `0`, `δ²=0`, exponent `2` | Retain |
| 8.1 germs | alternating `𝔽₂` two-term family, two filters | patch `0`: `H⁰=H¹=k`; patch `1`: zero object | Retain |
| 8.3 endomorphism bound | `B=𝔽₂`, ranks `(1,1)`, zero differential | `2^(1+1)=4` chain endomorphisms | Retain |
| 8.4 scalar compatibility | `l(y)=x+ε` on `O[[x]][ε]/ε²` | matrix `[[x,0],[1,x]]≠x·Id` | Retain |
| 8.6 nonflat quotient | `[O→π O]` reduced to `k` | before `H⁰=0,H¹=k`; after `H⁰=H¹=k` | Retain |
| 9.1 complex dimension | `A[0]⊕k[−2]`, `dim A=1` | `max(1,2)=2`; shift by `1` gives `1` | Retain |
| 9.2 `codimension_amplitude_inequality` | `[O→π O]` in `0,1` | `n=1`, `l=1`, `H¹=k`, `dim O/m=0≥0` | Retain |
| 9.2 `balanced_dimension_concentration` | `[O[[x]]→x O[[x]]]`; `S/(x)⊕k` over `k[[x,y]]` | top `O`, `pd=1`, `depth=1`, `dim Supp=1=2−1`, local cohomology only in degree `1`; amplitude `[−2,0]`, support dimension `1>0`, hypothesis fails | Retain |
| 9.2 `cohenMacaulay_action_concentration` | `S=k[[t]][ε]/ε²`, `R=S/(t)`, `C=[S→t S]`; `R=S`, `l=0`, `C=S[0]` | `dim S=depth S=1`, `l=1`, `N=R`, `depth_R N=0=dim R`, `pd_S N=1`; `N=S`, all equal `d` | Retain |
| 9.2 extra conclusion `dim R=d−l` | general | `depth_R N≤dim R≤d−l≤d−pd_S N=depth_S N=depth_R N`, so `pd_S N=l` and `dim R=d−l` | Retain |
| 9.3 `patched_dual_concentration` | `P=[O→π O]` in `0,1`, `a=0`, `l=1` | `D` in `−1,0`, `H⁰(D)=O/π=Ext¹_O(k,O)`, `H⁻¹(D)=0`, degree `−a=0` | Retain |
| 9.3 `finiteActionCanonicalDuality_ext` | `S=O`, `Q=R=M=k`, `r=0`; `S=O[[t]]`, `Q=O`, `R=O`, `N=O⊕k`, `r=0,1` | `Ext¹_O(k,O)=k=Hom_k(k,k)`; `r=0`: `k=k`; `r=1`: `O=O` (all `j`: `RHom_S(N,S[d])≃RHom_B(N,ω_B)≃RHom_Q(N,Q[e])` over the local `B=R/ann N`) | Retain |
| 9.5 length defect | `B=O[ε]/ε²`, `f=π` | `length B/πB=2`, `B[π]=0`, `c=1`, generic length `2`: `2=1·2` | Retain |
| 9.6 coefficient-divisor comparison | `π` a unit; `π=0` | both intersections empty; equality of full supports | Retain |
| 9.7 survival | `O=ℚ[[π]]`, `S=O[[X]]`, `y=(π)` | `(S/y)_y=ℚ((X))≠0`, characteristic zero, killed by inverting `π` | Retain |

**Pinned declarations opened** (Mathlib `6b7abb3c`, Tau Ceti `a91d3aaf`): `Mathlib/RingTheory/Support.lean:216` (`support_eq_zeroLocus`, finite module); `RingTheory/AdicCompletion/Functoriality.lean:338,446`; `RingTheory/AdicCompletion/Basic.lean:639`; `RingTheory/AdicCompletion/RingHom.lean:123`; `RingTheory/MvPowerSeries/Equiv.lean:258`; `RingTheory/Depth/Rees.lean:24` (`exists_isRegular_tfae`; the directory has no depth definition); `RingTheory/Regular/ProjectiveDimension.lean:86,166`; `RingTheory/KrullDimension/Module.lean:15` (`supportDim`); `Algebra/Homology/LocalCohomology.lean:173`; `RingTheory/ReesAlgebra.lean:40`; `Algebra/Homology/HomotopyCategory/KProjective.lean:113`, `DerivedCategory/KProjective.lean:99,104`. Tau Ceti: `RingTheory/Ideal/ArtinRees.lean:78`; `RingTheory/Length.lean:309,361`; `RingTheory/ReesAlgebra/Grading.lean:57,145,167,198`; `RingTheory/FittingIdeal/Basic.lean:343`, `BaseChange.lean:134`; `Algebra/Homology/LinearHomComplex/Basic.lean:80`, `Enrichment.lean:32`; `Algebra/MonoidAlgebra/Dual.lean:286,294,307`; `Topology/Algebra/Group/Generation.lean:34`; `RingTheory/Syntomic/StandardSyntomic.lean`; `AlgebraicGeometry/LineBundle/Basic.lean:131` (`InvertibleSheaf.trivial`); `Algebra/Module/Injective/Envelope/Basic.lean:172`; `RingTheory/RegularLocalRing/Basic.lean:26,33`; `RingTheory/GradedAlgebra/Homogeneous/Quotient.lean`, `Completion.lean`. `Module.depth`, `Module.IsCohenMacaulay`, `IsSmallExtension`, `DualizingComplex` are not in the pins, as the README's attribution to supplier roadmaps presumes.

**Cross-roadmap citations resolved** (main at fa41b37; open heads through the roadmap service):

| Citation | Resolution |
|---|---|
| GroebnerGeometry G4 | `README.md:252–268`: `gr_I R=⨁I^n/I^(n+1)`, multiplication, quotient maps, functoriality, generator and base-change maps. |
| SchemeAndStackFoundations §0.17 | `README.md:1138–1216`: `Module.depth`, `depth_eq_iff_ext`, `depth_le_supportDim`, `Module.IsCohenMacaulay`, `IsCohenMacaulay.unmixed`, `depth_eq_add_of_flat`, Serre conditions, `depth_shortExact`; no associated-prime bound (R02). |
| SchemeAndStackFoundations §§4.2–4.5 | `:5110–5120` (`ArtinLocalAlg`, `dualNumbers`, `IsSmallExtension` as a surjection with nonzero principal kernel killed by the maximal ideal, `ArtinLocalAlg.pullback`, `CompleteLocalAlg`), `:5143–5148` (H1–H4), `:5209–5223` (hull, prorepresentability), `:5246–5253` (`ObstructionTheory` on one-dimensional kernels). |
| SchemeAndStackFoundations §§2.18–2.21, Layer 5 | `:3975` `DQCoh.affineEquiv`, `:3988` `perfect_generator`, `:4107` `Coherent.IsLocalCompleteIntersection`, `:4392–4409` dualizing complexes (R03 names), `:6553–6576` dimension-graded cycles for finite type over a field. |
| DerivedModuleAlgebra | `:516` (§0.K.1 Koszul), `:626–633` (§0.2 `derivedTensor`), `:1403–1408,1542,1622` (§1.T.1 `lim`, `lim¹`, Milnor, `derivedLimit_cofinal`), `:1666–1673` (§1.1.1 Hom), `:1733,1788,1808` (§§1.3–1.5), `:2049–2120,2177,2202` (§§1.E.0–1.E.1 `IsPerfect`, `IsPseudoCoherent`, `HasTorAmplitude`, `PerfectSystem`, `FiniteFreeSystemModel`, residue criterion, effectivity), `:2242–2297` (§§1.M.1–1.M.2). |
| EnhancedDerivedSheaves | `:510,549,689,840,888`; names at `:693,706,800` and `Suggested.lean:88,94,102,108`. |
| PadicMeasuresIwasawaAlgebras | Layer 1 `:567–575` (R03 attribution); §5.1 `:3239–3250` `detLine_quasiIso`, `detLine_shortExact`, `detLine_acyclic`. |
| AdicSpacesPartII | `:727–749` (`isNoetherianRing_of_isAdicComplete`, `IsAdicRing.adicCompletion`), `:1769–1777` (completed tensor along adic homomorphisms). |
| ModularCurves | `:1165–1196` (§4D completion, regularity, miracle flatness), `:1500–1503` (§7D `W(k)`-algebras), `Suggested.lean:917–958`. |
| AlgebraicVectorBundles, GrothendieckEulerForms, DGAInfinity | `:228–261` (L0B–L0C), `:383–412` (Layer 5, R03 wording), `:431–458` (Layer 5 envelope, idempotent completion). |
| PurityOfBranchLocus §0.3 | `:181–187`: owner of Auslander–Buchsbaum and MCM freeness (R01). |
| Completed roadmaps | LocalFieldsRamification `:184` (`integerRing_eq_integralClosure`); ProfiniteProPGroups `:137,345,565`; LocalGaloisGroups `:419,1079`. |
| PadicLocalLanglandsForGL2Qp §§0.4–0.5 (head #1312) | `:300–329` (representing pair, unique universal-lift-preserving isomorphism, pro-`p` quotient case, `ℤ_p` Check with `T↦T+T²`), `:331–334` (`moduleCycle`, `moduleCycle_specialization`, `exists_hilbertSamuel_polynomial`, dimension-normalized multiplicity, associativity, agreement theorem). |
| IntegralHeckeAndGaloisDeterminants Layer 2 (head #1689) | `:2830–2954`: `derived_hom_finite`, `ghost_nilpotence`, annihilator bound, local factors, idempotent summands (R03 names). |
| DeformationAndDerivedPatchingAlgebraPartII (head #872) | `:322` K0.1, `:584` K0.4, `:654` K0.5, `:754–790` K0.7 (noncomplete finite-module local duality, Matlis annihilator), `:1365–1395` K3.1 (`Rees_I(M)`, grading over `reesAlgebra.grade I`). |
| ArithmeticGaloisDuality D7.1 (head #858) | `:4686–4740`: derived tensor, bounded-perfect/algebra-coefficient Tor spectral sequence, residual amplitude criterion. |

No other roadmap on main states Lescot's criterion, Hilbert–Samuel multiplicity, parafactoriality, module or complex patching, minimal complexes, complete flat complexes, derived support, formal unmixedness, symbolic powers, Cohen rings as such (EnhancedDerivedSheaves `:768` has `completeNoetherianLocal_cohenPresentation` for characteristic `p`, which §§1.10 and 1.16 could cite for that case), trace ideals in this sense, connectedness dimension or arithmetic rank. Ownership against the open pull requests was checked through the roadmap service's index of 423 heads for the Lean names and for `moduleCycle`, `patching`, `IsMinimal`, `CompleteFlatComplex`, `derivedSupport`; no second owner was found.

## Not verifiable

- Avramov, *Infinite free resolutions*, §§6.2–6.3, 7.1, 10.1–10.2 (cited in §3.2): a book chapter with no legal open copy; not read. The acyclic-closure and PBW statements of §3.2 remain source-unverified; Avramov–Veliche and Avramov–Iyengar (arXiv) were not re-read this round.
- Calegari–Geraghty, *Correction*, Invent. Math. 227 (2022): DOI prefix 10.1007 is paywalled by configuration; items (1) and (10) at `README.md:1693` were not certified.
- *Frobenius Singularities*, Chapter 1, §1, Proposition 1.21(b) (`README.md:835,1955`): no author, year or version is given, so the text could not be identified; the complete F-finite assertion is uncertified. Give an identifiable legal reference.
- Outside the seeded sample, the Stone, Nagata, Hochster, Schlessinger, Thorne, Newton–Thorne, Khare–Thorne, BCGP, Le–Le Hung–Levin–Morra, Böckle–Iyengar–Paškūnas, Böckle–Juschka, Paškūnas–Quast, Emerton–Gee, Anscombe–Jahnke, Clausen–Mathew–Morrow, Bhatt–Mathew, Bhatt, SGA 2 and Avramov–Veliche locators were not re-read in this round; the previous review's checks of §§1.8, 1.15, 2.1–2.2, 3.6, 3.12–3.13, 6.1–6.2, 7.6, 7.9 and 9.5 stand as recorded there.
- The universal statements are not Lean proofs: elaboration, the probe and the table record instances, not proofs of the nineteen theorems.

## Source issues

- **Misprint** in cg2018 at Theorem 6.3(d), printed p. 386 (author PDF p. 90, line 3633–3636): the source writes the kernel as `ker(φ_N)` for all `M ≥ N ≥ 0`, although `φ_N` is defined only for `N ≥ 1`; it should be the kernel of the map at the original level `M`; affects a stated result.
- **Misprint** in cg2018 at the proof of Theorem 6.3, printed p. 387 (author PDF p. 91, line 3658): the source refers to "the proof of Theorem 2.3"; it should be Proposition 2.3; affects nothing.
