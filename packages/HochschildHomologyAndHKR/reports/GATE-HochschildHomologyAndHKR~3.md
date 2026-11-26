# GATE-HochschildHomologyAndHKR~3: answers to the human review of `d18fb7a`

One comment is unanswered: kim-em's follow-up of 2026-11-26. It makes two points. H01 is the
assessment of the repaired quasi-free boundary. H02 is the ordering remark, repeated from the
previous round: merge after RefinedTraceMethods, or state the étale base change here. The closing
recommendation to approve is not a point to answer.

## H01 (kim-em) — answered

Confirmed. A search by object over main and the open heads (`quasi-free`, noncommutative formally
smooth, Cuntz–Quillen, Hochschild dimension) finds no owner of quasi-free algebras. The other hits
are quasi-free *states* in OperatorAlgebraDynamics, RelativisticQuantumFieldTheory, Subfactors,
HartreeFockTheory and FoliationCStarAlgebras, which are a different notion. Checking the sentence
itself showed one imprecision, now repaired. `TauCetiRoadmap/HochschildHomologyAndHKR/README.md`,
`## Scope and ownership`, lines 2075–2076, said "characterised over a field by the vanishing of
`Ext²` over `Aᵉ`" and now says "characterised over a field by the vanishing of `Ext²_{Aᵉ}(A,M)` for
every bimodule `M`". The characterisation needs the quantifier over all bimodules (Ginz05
Lemma 19.1.7, lines 4846–4849). Read with `M = A` only, it is false: the first Weyl algebra over ℚ
has `HH²(A₁,A₁) = 0` but `HH²(A₁, A₁ᵉ) ≅ A₁ ≠ 0`, so it is not quasi-free (adversarial pass below).

## H02 (kim-em) — disputed

Stating the étale base change here would not let this roadmap merge without RefinedTraceMethods,
and it would give that theorem a second owner. So the roadmap keeps citing RefinedTraceMethods §1.8,
and it merges right after that roadmap: ORDER.txt line 358 is RefinedTraceMethods and line 359 is
this roadmap.

- **The wait does not come from §1.8 alone.** Layer 6 consumes RefinedTraceMethods in two places:
  - §6.3 consumes §1.1, the identification, for `k`-flat `A`, of derived `HH_n(A/k)` with the
    homology of `(C_•(A/k), b)`. See README lines 1308 and 1315–1318.
  - The comparison clauses of §6.4(a) and (b) consume §1.9, the maps `ε_n` and `π_n`. See lines
    1335–1337 and 1363–1364.

  The Layer 6 Dependencies (line 1411) and the supplier contract (lines 2665–2679) list both. With
  §1.8 moved here, the pull request still names RefinedTraceMethods, and it still merges after it.
  "Everything up to §8.5 is independent of it" is true of §1.8 itself: no statement in Layers 1–8
  uses it, and Layer 8 uses only the definition of `ε^cl` in §6.4(a). It is not true of the roadmap
  as a merge unit. To merge on its own, the roadmap would also have to drop §6.3's identification
  with the derived chains and §6.4's comparison clauses. Those are what lets the roadmaps in
  `## Downstream consumers` read their statements on the classical complex.
- **The same theorem would have two owners.** At its head (`795405e`), RefinedTraceMethods §1.8
  (README line 349, "Étale base change (Weibel–Geller)") states exactly what §9.1(a) uses:
  - the setting: an étale `φ : A → B` of commutative `k`-algebras, with `A` and `B` flat over `k`;
  - the map: `B ⊗_A HH_n(A/k) → HH_n(B/k)`, `b ⊗ [c] ↦ b·[φ(c)]`, is bijective;
  - the carrier: the homology of the cyclic bar complexes of its §1.1, and for flat algebras §6.3
    identifies that complex with the classical one.

  A restatement here would not be a variant on another carrier. It would be the same theorem with
  a second owner, and RefinedTraceMethods comes earlier in the merge order. Neither pinned library
  has it: Mathlib's only Hochschild file is `RepresentationTheory/Homological/GroupCohomology/Basic.lean`,
  and Tau Ceti has no Hochschild statement about étale maps. `tauceti-roadmap roadmaps grep` finds
  no other owner.

## Build and gate

- `lake build TauCetiRoadmap.HochschildHomologyAndHKR.Suggested`: `Build completed successfully (18268 jobs).`
  There are 10 `declaration uses 'sorry'` warnings, one per stated theorem, at lines 138, 154, 173,
  203, 267, 284, 313, 334, 351 and 367.
- Gate at commit `07afb868`: `gate HochschildHomologyAndHKR: set_option=0 blob=0 latex=0 tex=0 prnum=0 sorry-data=0 sorry-examples=0 residue=0 private-paths=0 imports=0 mathlib-subimports=0 no-import-mathlib=0 lean-lines=0 statement-hygiene=0 forbidden=0 dropped=0 readme-ids-missing=0 empty-sections=0 round-labels=0 long-fences=0 layer-ids=0 target-ids=0 depcheck=0 metadata=0 stray-files=0 dirty=0 outside-folder=0 source-material=0 OK`.
  Before the commit the same gate failed only on `dirty=1`, for the uncommitted README change.
- Dependency check (`gate --depcheck … --movable --pr 2447`): `depcheck: 112 roadmaps, 1287 edges, 0 problem(s)`.
  It printed no UPWARD, CYCLE or `moved:` line.
- Citation resolver after the repair: "Cross-roadmap citations found nowhere: None. Lean names found
  nowhere: None." The worker's lead `TauCeti.StarkSystems.toExteriorBidual` (README line 1494) is
  not a defect. IntegralIwasawaTheory on main plans that name, in its §12.6 (its README line 1829,
  namespace `TauCeti.StarkSystems`), and EulerSystemsAndKolyvaginSystems on main uses it (its README
  line 3743). This roadmap cites it as theirs.
- Commit: `07afb868 HochschildHomologyAndHKR: review repairs (quasi-free characterisation: Ext² vanishing for every bimodule)`.
  It is not pushed.

## Suggested.lean and signatures

`Suggested.lean` is unchanged this round. I compared the elaborated types in the job's signature file
with their README statements. `homological_hkr` carries only `Algebra.Smooth k R`, as §9.1 says. That
matches the étale-localisation route, which needs no projectivity. `cohomological_hkr_hom_kaehler` and
`cohomological_hkr` carry `Algebra.Smooth k R` and `Module.Projective k R`, as §9.2 says. No binder is
dropped. No scratch `#check` file was elaborated: the file did not change, and the module build is the
only Lean command this job may run.

## Adversarial pass (the changed sentence and the statements H02 relies on)

| Statement | Instances tried | Values computed | Result | Change |
|---|---|---|---|---|
| Over a field, `A` is quasi-free iff `Ext²_{Aᵉ}(A,M) = 0` for every bimodule `M` (the changed sentence) | free algebra `k⟨x,y⟩`; `k[x]`; `k[x,y]`; `A = 0` | `k⟨x,y⟩`: the resolution `0 → A⊗V⊗A → A⊗A → A → 0` has length 1, so `Ext² = 0`, and generators lift (Ginz05 §19.2, line 4902). `k[x]`: the Koszul resolution has length 1, so `Ext² = 0`, and the generator lifts. `k[x,y]`: with `M = Aᵉ`, `HH² = Aᵉ/(x⊗1−1⊗x, y⊗1−1⊗y) ≅ A ≠ 0`, and `k[x,y]` is not quasi-free (Ginz05 line 4912). `A = 0`: every Ext vanishes. A square-zero `I` with `B/I = 0` has `1 ∈ I`, so `1 = 1·1 = 0` and `B = 0`, and the lift exists | holds in both directions | none |
| Same sentence, read with `M = A` only (the old wording admitted this reading) | first Weyl algebra `A₁ = ℚ⟨x,∂⟩/(∂x − x∂ − 1)` | Its Koszul bimodule resolution has length 2 with top term `A₁ᵉ`. For `M = A₁`, `HH²(A₁,A₁) = A₁/([x,A₁] + [∂,A₁])`, which is `0` because `x^a ∂^b = [∂, x^{a+1}∂^b/(a+1)]`. For `M = A₁ᵉ`, `HH² ≅ A₁ ≠ 0` | the narrow reading wrongly makes `A₁` quasi-free, so the quantifier is needed | added "for every bimodule `M`" |
| Same sentence: "over a field" is needed | `k = ℤ`, `A = 𝔽₂`, extension `ℤ/4 → 𝔽₂` | `Aᵉ = 𝔽₂`, so `Ext^{≥1} = 0`. There is no ring map `𝔽₂ → ℤ/4`, and no `ℤ`-linear section, since `2s(1) = 0` forces `s(1) ∈ {0, 2}` | the qualifier is needed and present | none |
| §9.1(a), the map RefinedTraceMethods §1.8 supplies (unchanged) | `k[x] → k[x,x⁻¹]`; the identity; `A → A[1/0] = 0`; non-étale `k[x] → k`, `x ↦ 0` | `B ⊗_A HH₁(k[x]) = B·[1⊗x] = HH₁(B)`, and `HH₂ = 0` on both sides (Layer 9 Examples). Identity: `A ⊗_A HH_n(A) = HH_n(A)`. `B = 0`: both sides are `0`. Non-étale: `k ⊗ HH₁(k[x]) = k ≠ 0 = HH₁(k)` (the §9.1 Check) | holds where stated, fails where excluded | none |
| H02 evidence: Layer 6 consumes RefinedTraceMethods §§1.1 and 1.9 | README lines 1308, 1315–1318, 1335–1337, 1363–1364, 1411, 2665–2679 | §6.3 cites §1.1, §6.4(a) and (b) cite §1.9, and the Layer 6 Dependencies list both | holds | none |
| H02 evidence: merge order and no cycle | ORDER.txt; RefinedTraceMethods at `795405e` | lines 358 and 359; the dependency check reports 0 problems | holds | none |

## Ownership, sources, untrusted text

- Ownership against open work: I checked it with `roadmaps grep` over main and every open head. There
  is no owner of quasi-free algebras. The only owner of étale base change of Hochschild homology is
  RefinedTraceMethods §1.8.
- Sources: I quoted Ginz05 lines 4779, 4846–4849, 4902 and 4912 from the cached text. The README edit
  adds no locator and no new source, `sources.toml` is unchanged, and no `needs-references.toml` was
  written.
- The comment contains no instruction outside the review itself.
