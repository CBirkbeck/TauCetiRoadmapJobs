# FIX-RT-EtaleDualityAndPerverseSheavesPartII~2

Resolution of the red-team round-2 reviews `RT-EtaleDualityAndPerverseSheavesPartII~2a` (six findings) and `RT-EtaleDualityAndPerverseSheavesPartII~2b` (two findings). Each finding was checked against the cached sources, the supplier roadmaps and the pins. All eight hold and are applied. No two findings overlap.

## RT-EtaleDualityAndPerverseSheavesPartII~2a/F01 (P3) — applied

In the `U(X)` Check for Spec(k × k) (`packages/EtaleDualityAndPerverseSheavesPartII/README.md` §0.6), "forces exactly two members" now reads "forces at least two members …, and the two inclusions attain that minimum". The Check also names the reviewer's three-member covering family, since covering families need not be minimal. The witness holds: the §0.6 definition asks for a finite family, not a minimal one.

## RT-EtaleDualityAndPerverseSheavesPartII~2a/F02 (P3) — applied

In the §8.1 product Check, ϖ₀ is now nonzero and topologically nilpotent, so four opens remain. A new Check covers characteristic p with ϖ₀ = 0: nine opens on each side, and the tilt is the identity (CS24 line 404). The same pattern is fixed in §8.6, where ϖ = 0 would make the 𝒪_C support complex G, not 0.


## RT-EtaleDualityAndPerverseSheavesPartII~2a/F03 (P3) — applied

§5.6 gains a third branch-comparison Check: k⟦x,y⟧ → k⟦u,v⟧ with x ↦ v, y ↦ u, Z = V(xy) and k separably closed. The hypothesis holds. In Kummer bases the map on H¹ is the transposition matrix, and on H² = ∧²H¹ it is −1 (1 mod 2, 2 mod 3). So the comparison need not preserve a branch ordering.


## RT-EtaleDualityAndPerverseSheavesPartII~2a/F04 (P2) — applied

The `PrimeToEllLocalExtension` docstring changes from "extension of complete normal local domains … specified prime" to "finite injective local map from a local domain to a complete noetherian normal local domain, with generic degree coprime to a specified natural number". The type is unchanged. The README §1.7 Checks gain the cusp-normalization boundary example (degree 1, admitted at ℓ = 0).


## RT-EtaleDualityAndPerverseSheavesPartII~2a/F05 (P1) — applied

The README previously credited SchemeAndStackFoundations with "Elkik's algebraization theorem". It now credits "Elkik's lifting of sections of smooth algebras" (§0.14 states only `henselian_smooth_lifting`). The README now declares `gap:elkik-finite-algebra-completion` (supplier SchemeAndStackFoundations, section 0.14), with the same needs sentence in `design/plan.json`. The contract cites ILO14 line 2877. §§1.6–1.7 routes, *Needs:* lines and the Layer 1 Dependencies now name the gap.

## RT-EtaleDualityAndPerverseSheavesPartII~2a/F06 (P3) — applied

§6.4: "ILO14 line 12640" → "ILO14 lines 12669, 12682, 12835" (Props 2.4.1.1, 2.4.2.1, 2.4.4.1), with the page range corrected to pp. 265–267. §6.11: → "ILO14 lines 12220, 12835". I added 12220 to the reviewer's 12835 because §6.11 also cites Théorème 0.9, which begins at line 12220. Line 12640 is the start of XVII §2.3, on specializations.

## RT-EtaleDualityAndPerverseSheavesPartII~2b/F01 (P3) — applied

The invented name `PlurinodalAlteration.exists`, found nowhere, is replaced in four places (§1 ownership, the supplier contract, the §2.1 route and its *Needs:*). The new text is "the curve step of its plurinodal alteration theorem (DJ97, Corollary 5.10, p. 618)", which the supplier's §5.4 states in prose. DJ97's manifest locator adds Corollary 5.10 (DJ97 line 699).


## RT-EtaleDualityAndPerverseSheavesPartII~2b/F02 (P3) — applied

Four §6.3 interface bullets are deleted: f^*K potential, f^!K potential, unique isomorphism, and heart membership. One sentence replaces them: regular and finite-type exceptional functoriality is the theorem of §6.7; existence, uniqueness and heart membership are the theorem of §6.6. §6.11 says "the potential dualizing complex", so it now cites §6.6 in its *Needs:*. No §6.3 Check used the deleted bullets.

## Checks run

- **Elaboration.** `lake env lean packages/EtaleDualityAndPerverseSheavesPartII/Suggested.lean`, run from the content checkout after the `module` header was added, exits 0. The only output is six `declaration uses 'sorry'` warnings, at lines 59, 81, 172, 216, 253 and 271 (the six theorems, each two lines lower than before because of the header). There are no errors and no other warnings.
- **Mechanical `#check @name`.** A scratch copy of the final file (with the `module` header) plus `#check @name` for all nine declarations elaborated once with no errors. All nine types print. After whitespace normalisation, each type is identical to the pre-round elaborated signature. The Lean changes this round are the `PrimeToEllLocalExtension` docstring (three comment lines) and the `module` header. No section binder can be lost, because the file has no `variable` block.
- **Gate scanners on the final file.** The import, `import Mathlib`, Mathlib-subimport, `set_option`, sorry'd-data, residue, admitted-example and length scanners report no hits. `import Mathlib` is still the first import, and every `TauCeti.*` import resolves (there are none).
- **Dependency check** (command of the brief), output exactly:

```text
depcheck: 188 roadmaps, 1239 edges, 0 problem(s)
```

  There is no UPWARD, CYCLE or moved line. SchemeAndStackFoundations, the supplier of the new gap, is line 2 of the merge order; ClassicalAdicEtaleCohomology is line 62; this roadmap is line 122.
- **Citation resolver.** It lists the same four leads as before: AdicCoefficientsAndComparisonsPartII, ArcTopologyAndDescent, PerfectoidQuotientsPartII and PurityForFlatCohomology. All four are board designs, earlier in the merge order except the downstream consumer PurityForFlatCohomology. Lean names found nowhere: none. The removed `PlurinodalAlteration.exists` no longer appears.
- **Gaps.** The README and the top-level `gaps` list of `design/plan.json` now carry five identical slugs, each with the same supplier, section and needs sentence. The previous four are unchanged, and the new one is `elkik-finite-algebra-completion` (SchemeAndStackFoundations, 0.14). A JSON comparison confirms that no other key of `plan.json` changed.
- **Sources.** No new source was fetched and no text is missing. `needs-references.toml` was not written. ILO14 (lines 2877, 2908–2915, 3015–3017, 12220, 12669, 12682, 12835), CS24 (line 404) and DJ97 (line 699) were read in the cache.

## Worker-check repair

- **Warning: `Suggested.lean` imports `Mathlib` without the module system.** Lake gives this warning for any non-`module` file that imports a package which sets `requiresModuleSystem`. The fix is a `module` line, followed by a blank line, before `import Mathlib`. The import line is unchanged, and no `public import`, `@[expose]` or `set_option` was needed. The file elaborates under the defaults, and all nine elaborated types are unchanged (see Checks run). Nothing else was edited for this warning.

## Adversarial pass on every added or changed statement

| Statement | Instances tried | Values computed | Result / change |
| --- | --- | --- | --- |
| §0.6 Check, Spec(k×k), Z = ∅ | one connected source; the two inclusions; inclusion 1 twice plus inclusion 2 | a connected source lands in one point, so it misses the other; 2 members cover; 3 members cover | "at least two", minimum 2 attained |
| §8.1 product Check, ϖ₀ nonzero topologically nilpotent | C = completed algebraic closure of ℚ_p, ϖ₀ = p^(1/p); ϖ₀ a unit; ϖ₀ = 0 in mixed characteristic | V(ϖ) = {s₁,s₂}, so 2² = 4 opens on both sides; a unit ϖ makes (A, A) non-henselian, as A ≠ 0 and A ⊄ Jac(A); 0^p ∤ p | hypothesis added; four retained |
| §8.1 new zero-parameter Check | C of characteristic p, ϖ = 0 | each Spec 𝒪_C has the opens ∅, {η}, {η,s}, so 3² = 9 opens; A[ϖ^∞] = A[ϖ¹] (bounded, N = 1); (A, 0) henselian; A^♭ = lim_Frob A = A; ϖ^♭ = 0; matching = identity on 9 | new Check, matches CS24 line 404 |
| §8.6 𝒪_C Check | ϖ nonzero topologically nilpotent; ϖ = 0 in characteristic p | nonzero: RΓ(𝒪_C, G) = G → RΓ(Spec C, G) = G, identity, so the support complex is 0; ϖ = 0: complement ∅, so the support complex is G ≠ 0 | hypothesis added (pattern repair) |
| §5.6 branch Check, swapped branches | g: x↦v, y↦u; control g′: x↦v, y↦v | g: cotangent images v, u independent; H¹ matrix [[0,1],[1,0]]; H² factor det = −1 ≡ 1 (mod 2), ≡ 2 (mod 3). g′: images v, v dependent, so the hypothesis fails and Z′ = V(v²) is not snc | Check added |
| `PrimeToEllLocalExtension` docstring | cusp k⟦t²,t³⟧ → k⟦t⟧, ℓ = 0; identity on ℤ_p⟦x⟧, ℓ = 2; degree 2, ℓ = 0; any degree n, ℓ = 1 | B = A + At, Frac A = k((t)), finrank 1, gcd(1,0) = 1; gcd(1,2) = 1; gcd(2,0) = 2, rejected; gcd(n,1) = 1, admitted | docstring now matches the type; README Check added |
| Elkik gap statement | I = 0; I = A; A = k[t]_(t)^h with I = (t) and z² − t; non-henselian k[t]_(t) with z² − 1 − t (char ≠ 2) | Â = A, identity; (A, A) henselian forces A = 0, so both categories are trivial; descends to A[z]/(z²−t), automorphisms {1, z↦−z} on both sides; 2 versus 4 idempotents, so full faithfulness fails | statement kept with the henselian and noetherian hypotheses of ILO14 line 2877 |
| §1.6 route, h = gf | d = 1; node k⟦x,y⟧/(xy) over k⟦t⟧ | the base is k[t_1] henselized at the origin; by Lemma 1.1.3 (line 2836) its h-adic completion is k⟦t_1⟧; ILO14 lines 2908–2915 use exactly h = gf | route corrected: h was undefined |
| §1.7 route, H-action descent | p = 3, ℓ = 2, H = C₂ negating π (the §1.7 Check) | the involution of B over B₀ descends by full faithfulness; composition is preserved because the equivalence is a functor; ILO14 lines 3015–3017 | route names both halves of the gap |
| §6.3 interface after deletion | twist-shift on Spec k, δ ≡ 0 → δ ≡ 1; trait K = Λ(1)[2] | Λ(0)[0] → Λ(1)[2], degree 2·1, twist 1; trait pinnings RΓ_s = Λ, RΓ_η̄ = Λ(1)[2] | all five §6.3 Checks still use only the definition and Kummer theory |
| §6.11 *Needs:* + anchors | d = 0, 1, 2 | K = Λ, Λ(1)[2], Λ(2)[4]; RΓ_x K = Λ in degree 0; "the" requires uniqueness, so §6.6 is cited | §6.6 added |
| §2.1 citation | DJ97 Cor. 5.10 (line 699, p. 618) against the supplier's §5.4 paragraph | both state a composition of projective semistable curve fibrations, finite N, and a purely inseparable invariant extension | the citation resolves to the supplier's prose |

## Ownership and suppliers

Ownership of the new gap was checked by object with `roadmaps grep -i elkik` over main and all open heads. SchemeAndStackFoundations §0.14 (main) states only `henselian_smooth_lifting`. AdicEtaleGeometry A1.0.4 (main) is approximation of sections; A1.0.5 is `FÉt(R[1/t]) ≃ FÉt(R^∧[1/t])`, generic fibres only, for a nonzerodivisor t. AdicSpacesPartIV F1.5(b) (main) algebraizes topologically finitely generated algebras that are formally smooth off a principal ideal: it gives neither finiteness of the model nor morphisms. DerivedDeRhamCohomology §1.12 treats algebras that are completely smooth or étale everywhere. ResolutionOfSingularitiesCharacteristicZero's Elkik pairs are principal and smooth. None states the finite-algebra equivalence with morphisms, so the gap goes to SchemeAndStackFoundations §0.14, the section titled for Elkik on henselian pairs.

## For the maintainer

- **New supplier request.** SchemeAndStackFoundations §0.14 is asked for `gap:elkik-finite-algebra-completion`, the equivalence of ILO14 V Théorème 1.2.4 (Elkik's Théorème 5) on objects and morphisms. Until it is supplied, §§1.6–1.7, and through them the headlines `partialAlgebraization_equalCharacteristic` and `partialAlgebraization_mixedCharacteristic` and §6.9, rest on it.
- No Lean declaration name changed, so no name cited by other roadmaps is affected.
- **No other roadmap uses the header.** No `Suggested.lean` on the content repository's main branch starts with `module`, so they all still give this Lake warning. Other ways to silence it are `allowNonModules := true` in the content lakefile or a `module` header in each file. Neither is a change this package can make.
- No suspicious instructions were found in the review texts.
