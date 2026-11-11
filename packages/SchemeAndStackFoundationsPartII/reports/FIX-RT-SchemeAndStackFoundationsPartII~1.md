# FIX-RT-SchemeAndStackFoundationsPartII~1

Repair of red-team round 1 (passes a and b) of the SchemeAndStackFoundationsPartII package. I checked all eleven findings against the cached sources, the pinned libraries and the sibling roadmaps. All eleven hold. The two Weil-restriction findings (a/F03, b/F01) overlap and are settled in one section. Files changed: `packages/SchemeAndStackFoundationsPartII/README.md`, `sources.toml`, `design/plan.json` (top-level `gaps` only). `Suggested.lean` is unchanged.

## RT-SchemeAndStackFoundationsPartII~1a/F01 (P3) — applied differently

The witness holds. DJ line 158 (§3.1, p.4) begins the proof that Br→Br′ is surjective. Nothing there concerns torsor descent along filtered colimits.

What changed: gap:torsor-limit-descent now reads "(CS24 Lemma 5.3.1, Claim 5.3.5.3 and Corollary 5.2.10, pp.57–59)", in the README and in the plan's gap `source`. DJ is kept, but now cited where it applies: Theorem 1.1, p.1 (DJ line 10), Gabber's Br=Br′ for a scheme with an ample invertible sheaf, in the Conventions. The README References and `sources.toml` follow.

The page range is pp.57–59, not the suggested pp.57–60:
- Corollary 5.2.10 is at CS24 line 2378, with the limit argument at line 2389 (p.57).
- Lemma 5.3.1 is at line 2408 (p.58).
- Claim 5.3.5.3 is at line 2459, with its limit argument at lines 2470–2471. Its proof ends on p.59.

## RT-SchemeAndStackFoundationsPartII~1a/F02 (P1) — applied

The witness holds. EnhancedDerivedSheaves E5:animation.4 on main supplies only `animatedToCAlg`, `animatedModules`, the discrete comparison and base change. CS24 line 2211 invokes a separate spectral sequence (Quillen's). No supplier at the pins or on main states this spectral sequence over animated rings. ArithmeticGaloisDuality has one only for module-derived tensors over ordinary rings.

What changed:
- New contract under EnhancedDerivedSheaves: gap:animated-tensor-spectral-sequence. It asks for E²_(s,t)=Tor_s^(π_*A)(π_*N,π_*M)_t ⇒ π_(s+t)(N⊗^L_A M), first quadrant, with the multiplication map as edge map. Section E5:animation.4; locator CS24 §5.2.1, p.53.
- The same slug, supplier, section and needs were added to the plan's `gaps`.
- The gap is named in the §1.2 route, in §1.2's *Needs* and in the Layer 1 Dependencies.

## RT-SchemeAndStackFoundationsPartII~1a/F03, RT-SchemeAndStackFoundationsPartII~1b/F01 (P2) — applied differently

Both witnesses hold. Pinned Tau Ceti proves the clause outright:
- `TauCeti.Algebra.WeilRestriction.instSmooth` (TauCeti/RingTheory/WeilRestriction/Smooth.lean:60) needs `Module.Finite A B`, `Module.Projective A B` and `Algebra.Smooth B C`.
- `LaurentPolynomial.instSmooth` (TauCeti/Algebra/Polynomial/Laurent/Smooth.lean:35) says the coordinate algebra of 𝔾_m is smooth over every ring.

ReductiveGroupsPartII §RG2.0a.2 `smooth_res` plans the same fact, but as a README-only target (it has no Lean declaration). The pinned declaration therefore takes precedence, and the ReductiveGroupsPartII citation a/F03 proposed was not added.

What changed:
- The clause "including smoothness of Res_(X/S)𝔾_m …" is removed from the gap in the README and in the plan.
- Four Tau Ceti rows are added: `instSmooth`, `LaurentPolynomial.instSmooth`, `multiplicativeGroupPoints` (…/WeilRestriction/Basic.lean:65) and `cohomologyPresheafObjIsoOverH` (for b/F08).
- One sentence after the Tau Ceti table records where the smoothness now comes from.

## RT-SchemeAndStackFoundationsPartII~1b/F02 (P2) — applied

The witness holds. PerfectoidQuotientsPartII §Q7.3 (its README lines 883–912) proves stability only for ind-fppf and ind-syntomic maps. CS24 §4.1.5 (line 1544) points to §2.3.3, which states only those two classes (lines 980–988).

What changed: §0.1 now has a "Prove the following statement" paragraph about the stages of pro-ppf maps.
- It gives the factorization criterion (SP Tag 07C3, Lemma 10.127.4).
- It proves stability of the stages under base change and composition, and hence stability of pro-ppf maps.
- The route goes through Mathlib's `CategoryTheory.MorphismProperty.ind`, `ind_iff_exists`, `IsStableUnderComposition.ind_of_preIndSpreads` and `CommRingCat.isFinitelyPresentable_hom`, together with SP Tags 00QO, 05N9 and 02JO.
- Three new Checks were added.
- The summary now says "Ind-fppf and ind-syntomic ring maps", and How to read and Scope were updated to match.

## RT-SchemeAndStackFoundationsPartII~1b/F03 (P2) — applied

The witness holds. §Q7.3's characterization needs a global presentation of A′. The pro-ppf definition gives presentations only on affine covers.

What changed: the converse in the §0.1 API is restricted to "if A→A′ is faithfully flat and A′ is a filtered colimit of flat finitely presented A-algebras, then A→A′ is ind-fppf (PerfectoidQuotientsPartII §Q7.3)". One sentence adds that the presentation there is global.

## RT-SchemeAndStackFoundationsPartII~1b/F04 (P3) — applied

The witness holds. The proof of CS24 Lemma 5.6.3 (lines 2984–2994) uses:
- the Bégueri sequence with R′=Γ(G*,O) and the five lemma;
- BČ22 Theorem 2.1.6;
- Gabber's affine theorem and PGL_n over the henselian pair (R′,IR′).

It never uses the Kummer sequence.

What changed:
- §4.2's *Needs* drops `fppf_kummer_sequence` and adds `henselian_pair_permanence`, `smoothGroup_fppf_etale_comparison`, `finite_pushforward_exact`, ReductiveGroupsPartII §RG2.0a and the three pinned Weil-restriction names.
- The route now states the torsion reduction and the finite pair (R′,IR′).
- The Layer 4 Dependencies and the SchemeAndStackFoundations supplier paragraph were updated. Kummer stays for §4.7.

## RT-SchemeAndStackFoundationsPartII~1b/F05 (P3) — applied

The witness holds. Corollary 5.6.12 runs from CS24 line 3223 to line 3235, between the p.77 marker (line 3216) and the p.78 marker (line 3255).

What changed: "pp.76–77" → "p.77" in §5.5. I checked every other CS24 page locator in the README against the page markers and found no other wrong page.

## RT-SchemeAndStackFoundationsPartII~1b/F06 (P3) — applied

What changed:
- §1.5 Check: "the parent's ordinary henselization" → "the henselization of the pair (A,I) of SchemeAndStackFoundations §0.12, on `TauCeti.Henselization.algebra`, with no higher homotopy".
- How to read: "the ordinary flat-cohomology carrier of the acceptance test" → "flat cohomology of ordinary algebras on the pinned carriers". It also now says "imported ind-fppf maps" instead of "ind-flat maps".

## RT-SchemeAndStackFoundationsPartII~1b/F07 (P3) — applied differently

All four witnesses hold.

What changed:
- §3.2 drops gap:animated-flat-cohomology and adds E5:animation.4 `animatedModules`, which its route uses.
- §3.3 drops §3.2.
- §4.7 drops §4.6.
- Layer 3 and Layer 4 Dependencies were updated to match.

For §3.4 the written route ("identify annihilator groups") does not close. Injectivity of a on K follows from A[a]≅A′[a], but surjectivity does not follow from the stated inputs. I replaced the route with the completion argument of CS24 Lemma 5.4.1 (line 2596), which uses bounded torsion of perfect rings. Its *Needs* are now E5:animation.2, DerivedModuleAlgebra §1.3 and §1.5 `DerivedDeRham.ordinaryQuotientCompletion_of_boundedTorsion`; gap:perfection-covers is removed.

## RT-SchemeAndStackFoundationsPartII~1b/F08 (P3) — applied differently

The witness holds. Mathlib's `cohomologyPresheafFunctor` (Basic.lean:70) is only the `Ext` bifunctor; Mathlib's own file lists the slice comparison as a TODO.

The suggested Tau Ceti row would overclaim. `CategoryTheory.Sheaf.cohomologyPresheafObjIsoOverH` (Over.lean:141) is stated for `AddCommGrpCat.{v}`, where v is the site's morphism universe. §5.0's sheaves are valued one universe up (`AddCommGrpCat.{u+1}` on `CommAlgCat.{u} R`), so the declaration does not apply to them as stated.

What changed:
- The Mathlib row now describes the definition only.
- The new Tau Ceti row carries the universe caveat.
- §5.0 gains an API bullet: the slice-site identification, proved by the same argument one universe up (SchemeAndStackFoundations §2.5).
- Both names were added to §5.0's *Needs* and the Layer 5 Dependencies.

## Checks

**Elaboration of `Suggested.lean`.** From the content repository, `lake env lean packages/SchemeAndStackFoundationsPartII/Suggested.lean` gives exactly two warnings, "declaration uses `sorry`" at lines 97 and 125, and no errors. The file is unchanged.

**`#check @name` record.** I put the file's six declarations into one scratch file, together with the 13 library names newly cited (the `ind` framework, `CommRingCat.isFinitelyPresentable_hom`, the Weil-restriction and Laurent instances, `cohomologyPresheafObjIsoOverH`, `cohomologyPresheafFunctor`), and elaborated it once. That first needed `lake build TauCeti.Algebra.AlgebraicGroup.MultiplicativeGroup.WeilRestriction.Basic`, which unpacked cached objects.
- Every name elaborates.
- No declaration lost a binder: `[HenselianRing R I]`, `[HasExt …]`, `[IsUniformAddGroup B]`, `[IsTopologicalRing B]` and the three hypotheses on B′ all appear.
- Nothing in the six declarations changed.
- `instSmooth` needs `Module.Finite`, `Module.Projective` and `Algebra.FinitePresentation B C`; the README row says "finitely generated projective" to match.

**Dependency check.**

```text
depcheck: 237 roadmaps, 2147 edges, 0 problem(s)
```

There is no UPWARD, CYCLE or moved line. The new supplier, EnhancedDerivedSheaves, is on main.

**Other checks.**
- `sources check` reports 0 problems.
- All 20 README gap lines match the 20 plan `gaps` exactly (slug, supplier, section, needs).
- `roadmaps resolve` gives one lead, PerfectoidQuotientsPartII §Q7.3. That is the board package earlier in the merge order, read at `packages/PerfectoidQuotientsPartII/README.md`, so the citation is valid.
- No Lean name is unresolved.

## Adversarial pass on new and changed statements

| Statement | Instances | Values computed | Result |
| --- | --- | --- | --- |
| §0.1 stage class: criterion, base change, composition | 𝔽_p[t]→𝔽_p[t,t⁻¹][x,y]/(x,y)²; ℤ→ℚ→ℚ[X]; ℤ→ℚ base-changed to 𝔽_p; ℤ→𝔽_p; A=0 | Rank 3 free over 𝔽_p[t,t⁻¹], fibre socle of dimension 2, so not lci and not syntomic; empty fibre over t=0, so not faithfully flat. ℚ[X]=colim ℤ[1/n][X]. 𝔽_p⊗ℚ=0=𝔽_p/(1), flat and finitely presented. Tor₁^ℤ(𝔽_p,𝔽_p)=𝔽_p≠0, so 𝔽_p is not flat. Over A=0 every algebra is 0, which is in the class. | Holds; the class is strictly outside §Q7.3. Instances added as Checks. |
| §0.1 restricted converse | ℤ→ℤ[1/2]×ℤ_(2); ℤ→ℚ | First is faithfully flat and equals colim(ℤ[1/2]×ℤ[1/n]) over odd n, so it is ind-fppf. Second has ℚ⊗𝔽_p=0, so it is not faithfully flat and not ind-fppf. | Holds. |
| gap:animated-tensor-spectral-sequence | A=ℤ, N=M=𝔽₂; A=k⊕k[1], N=M=k; M=A; A=ℤ, M=ℤ₂, N=𝔽₂ | First: E²_(0,0)=E²_(1,0)=𝔽₂, abutment π₀=π₁=𝔽₂. Second: E²_(s,s)=k; d_r cannot hit for degree reasons; π_(2s)=k, odd degrees 0. Third: only column s=0, abutment π_*N. Fourth: only E²_(0,0)=𝔽₂. | Consistent; the edge map is the multiplication map. |
| Weil restriction smoothness, cited at the pin | B=A; B=k[ε]/ε²; B=k×k | Res is 𝔾_m; points {a+bε: a∈T^×}≅𝔾_m×𝔾_a, smooth; 𝔾_m×𝔾_m. | Pinned instance applies, since B is finite projective in each case. |
| §3.4 route | A=A′ perfect; A=𝔽_p, A′=𝔽_p[t^(1/p^∞)]/(t), a=1; a=0; A=𝔽_p[x^(1/p^∞)]×𝔽_p, a=(x,0) | First: K=0. Second: K∋t^(1/p), all completions 0, K/^L1=0. Third: A⊕A[1]≃A′⊕A′[1] forces K=0. Fourth: A[a]=A[a²]=0×𝔽_p, bounded torsion. | Each step (bounded torsion, Â perfect since φ(a^nA)=a^(pn)A, factorization through (A′)^perf) checked. |
| §4.2 route | (ℤ_p,(p)), G=μ_p; I=0 | G*=ℤ/p, R′=ℤ_p^p, Res𝔾_m=𝔾_m^p, H²_et(R′,𝔾_m)_tors=Br(ℤ_p)^p=0, so 0→0 and H²(μ_p)=0=H²(𝔽_p,μ_p). For I=0 the map is the identity. H²(R/I,G) is killed by the order of G. | Holds; torsion reduction valid. |
| §5.0 slice-site bullet | n=0; trivial G; α_p over 𝔽_p[t] | Ext⁰(ℤ[h_A],F)=F(A) on both sides; 0 on both sides; H¹=𝔽_p[t]/𝔽_p[t]^p on the slice and on the ambient site. | Holds; universe caveat recorded. |
| §1.5 Check (F06) | A=ℤ_(p), I=(p) | π₀ is the ordinary henselization ℤ_(p)^h; π_i=0 for i>0. The completion ℤ_p would be a wrong model. | Holds. |
| §5.5 page, §§3.2/3.3/4.7 Needs | — | Statements unchanged; Checks recomputed with the same values. | No change of truth. |

## Ownership, sources and notes for the maintainer

**Ownership against open work.**
- For the stage-class stability now in §0.1, I searched by object across main, the board and the open heads. The only near match is CommRingFactorizationSystems (open). It plans `ind` of Zariski localizations and the accessibility of `Under A`, but it is on the never-cite list. No roadmap owns stability of ind-(flat finitely presented) maps, so §0.1 owns it.
- For the animated Tor spectral sequence, the natural owner is EnhancedDerivedSheaves (on main, owner of `animatedModules`), so it is declared as a gap there.
- No `Suggested.lean` declaration shares a fully qualified name with another roadmap.

**Sources.** `sources fetch --id SP` on Tag 07C3 overwrote SP's primary fields (the more-algebra text) instead of adding a text. I therefore recorded the algebra chapter by hand as a second `additional_texts` entry, using the service's printed values: `fetched_from` …/download/algebra.pdf#nameddest=07C3, `fetched_at` 2026-11-11T09:40:45Z, sha256 b035a1f0…6947, open-repository, certified. CS24 gains §2.3.3 p.24, and DJ's locator becomes Theorem 1.1, p.1. No text is missing, so there is no `needs-references.toml`.

**For other roadmaps.**
- New contract on EnhancedDerivedSheaves: gap:animated-tensor-spectral-sequence.
- The SchemeAndStackFoundations contract gap:classical-affine-group-adapter is narrower.
- No section, layer or target of this roadmap was renumbered or renamed, so no citing roadmap is affected.

No suspicious instructions were found in the review texts.
