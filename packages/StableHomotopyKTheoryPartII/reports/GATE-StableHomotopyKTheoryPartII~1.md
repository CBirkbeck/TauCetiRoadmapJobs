## H01 (roed-math) — applied differently

`TauCetiRoadmap/StableHomotopyKTheoryPartII/README.md` lines 7, 17, 125, 627 and 1075: "§4.8 owns the spherical lift SW(k)" → "SW(k) is the marked étale lift of RefinedTraceMethods §6.1 at the finite étale ℤ_p-algebra W(k); §4.8 owns the integral input that makes W(k) finite étale, the finite-free S_p^∧-module structure of rank d and the Frobenius comparison", and the old line-1070 sentence telling general-construction roadmaps to import §4.8 is deleted. This differs from the suggested repair because RefinedTraceMethods §6.1 does not own a general construction of spherical lifts: at head `b713d26` (its README lines 2519–2578) it owns Lurie's étale lifting equivalence and takes spherical bases (A, S_A) as hypothesis data. The construction for every perfect p-complete δ-ring is HabiroCohomologyFoundationsPartII §0.1 (head `61e97fe`, line 146).

Evidence on the three roadmaps named in the comment:
- **GeneralAlgebraicKTheoryPartII.** At its current head `7f6a44d` it builds no spherical Witt vectors. Its scope (line 15) gives the general lifts to HabiroCohomologyFoundationsPartII §0.1 and calls StableHomotopyKTheoryPartII §4.8 "their finite-field case"; its supplier contract (line 228) and §6.1a proof route (line 1677) consume HabiroCohomologyFoundationsPartII §0.1 and build E(A) by base change. The comment linked the older head `90bcf29`.
- **RefinedTraceMethods §7.6.** It uses S_C for C = ℤ_p{x}_∞ (line 3557) and cites only §6.1's base-hypothesis data. That is a question about RefinedTraceMethods' own supply, and none of it rests on this roadmap.
- **This roadmap.** §4.8 already obtained SW(k) as the §6.1 étale lift. So the two copies disappear once §4.8 stops claiming the object. Merge order: RefinedTraceMethods (314) < this roadmap (317) < HabiroCohomologyFoundationsPartII (318) < GeneralAlgebraicKTheoryPartII (319).

What this roadmap now says:
- **Scope, line 7.** General perfect δ-ring lifts are "neither constructed nor used here". A grep of the README finds no other use of them.
- **RefinedTraceMethods contract, line 125.** It now says SW(k) is the value of §6.1's equivalence at W(k), "not a separate construction".
- **Downstream consumers, line 1075.** It now lists what §4.8 supplies about SW(k), and no longer tells any roadmap to special-case W(k).

## H02 (roed-math) — applied differently

Every "LocalFieldsRamification Layer 2" citation is now a citation of the pinned Tau Ceti declarations themselves, with files and exact hypotheses, under "From Tau Ceti" (README lines 40–56). The citations were at old lines 17, 111, 120, 128–136, 627, 633, 650 and 660; the separate LocalFieldsRamification supplier section is deleted, and the README now names that roadmap nowhere. Galois-ness of L = W(k)[1/p] over ℚ_p was cited to Layer 2 "Existence and uniqueness". It now follows from the rigidity bijection `TauCeti.IsUnramified.residueFieldHomEquiv` at M = L, together with `FiniteField.natCard_algHom_of_finrank_dvd`, `TauCeti.IsUnramified.inertiaDegree_eq_finrank`, `IsGalois.of_card_aut_eq_finrank` and `TauCeti.isCyclic_algEquiv` (lines 631 and 638).

Why this differs from the suggested repair:
- **Making #617 a dependency is unnecessary.** Every object §4.8 consumed through "Layer 2" is a pinned Tau Ceti declaration. Main's Layer 2 says "Tau Ceti implements" them (`Completed/LocalFieldsRamification/README.md` lines 584–628), and the revision at head `893faab` lists them as "already in the library". Citing Tau Ceti is correct under both numberings and avoids depending on an open revision.
- **The claim about `TauCeti.isUnramified_iff_etale` is out of date.** The comment says it is missing from #617's *Unramified extensions* list. That held at `6d0bdf3`. At the current head `893faab` it is listed, at line 188 of `Completed/LocalFieldsRamification/README.md`. The point no longer matters once the declarations are cited from Tau Ceti.
- **#617 also maps old numbers.** Its own table (line 280) maps "former Layer 2" to *Unramified extensions*. The overlap tool reported no dropped id because the heading "Layer 2" survives with new content.

Every cited declaration was checked at the pin (file:line):

| Declaration | Location |
| --- | --- |
| `TauCeti.IsUnramified` | `Unramified/Basic.lean:115` |
| `TauCeti.IsUnramified.inertiaDegree_eq_finrank` | `Unramified/Basic.lean:197` |
| `TauCeti.isUnramified_iff_etale` | `Unramified/Basic.lean:277` (base hypotheses only, lines 102–104) |
| `TauCeti.IsUnramified.residueFieldHomEquiv` | `Unramified/Rigidity.lean:142` (`Module.Finite K L`, `IsUnramified K L`, no `IsGalois`; lines 62–66) |
| `TauCeti.residueFieldAutEquiv` | `ResidueCorrespondence.lean:150` |
| `TauCeti.frobeniusAlgEquiv` | `ResidueCorrespondence.lean:164` |
| `TauCeti.orderOf_frobeniusAlgEquiv` | `ResidueCorrespondence.lean:178` |
| `TauCeti.isCyclic_algEquiv` | `ResidueCorrespondence.lean:193` |
| `TauCeti.eq_frobeniusAlgEquiv_of_valuation_sub_pow_lt_one` | `ResidueCorrespondence.lean:237` (the ResidueCorrespondence block needs `FiniteDimensional K L`, `IsGalois K L`; lines 46–49) |
| `TauCeti.frobeniusAlgEquiv_teichmullerLift` | `Frobenius.lean:61` |
| `Padic.integerRingEquiv` | `Padic.lean:151` |
| `FiniteField.natCard_algHom_of_finrank_dvd` | Mathlib `FieldTheory/Finite/GaloisField.lean:302` |
| `IsGalois.of_card_aut_eq_finrank` | Mathlib `FieldTheory/Galois/Basic.lean:516` |

The Tau Ceti paths are under `TauCeti/NumberTheory/LocalField/`. The two Mathlib lemmas are also recorded in the Mathlib supplier contract (line 38).

**Other notes.**
- The comment's request to move the pull request between review states is a status action for the worker, not an edit.
- Nothing in the reviewed text was suspicious.

---

**Signature audit.** `Suggested.lean` declares nothing: an empty namespace and a docstring naming the headlines that cannot be stated at the pins. There was no `#check @name` to run, and the file is unchanged. Its docstring headline on the spherical Witt lift ("its spectral etale lifting and Tate comparisons are missing") still matches the new ownership.

**Ownership and citations.**
- **What was searched.** The object (spherical lifts of W(k) and of perfect δ-rings) was searched in the readable heads of RefinedTraceMethods (`b713d26`), HabiroCohomologyFoundationsPartII (`61e97fe`), GeneralAlgebraicKTheoryPartII (`7f6a44d`) and LocalFieldsRamification (`893faab`), and in main (`eaf17b1`). PadicHodgeRegulators (`b4b7727`) was read for the cited "Supplier" subsections, which are unchanged and still resolve.
- **Ownership.** No ownership moved to or from a later roadmap. No *Needs:* line or supplier contract cites a later roadmap. No declaration of `Suggested.lean` exists, so none can clash with another roadmap's name.
- **Open revisions.** No id this README cites is defined only by an open revision. The README no longer cites LocalFieldsRamification at all.
- **Citation check.** `roadmaps resolve` on the edited README reports no cross-roadmap citation and no Lean name found nowhere. Its library check did not run on this host; the library names above were confirmed at the pins by file and line instead.

**Depcheck** (after the edits; also 0 before them):

```text
depcheck: 239 roadmaps, 2352 edges, 0 problem(s)
```

**Sources.** No source was added or cited anew. The repairs cite only pinned Tau Ceti and Mathlib declarations and roadmap sections. No text was missing and `needs-references.toml` was not written.

**Adversarial mathematics pass** (statements added or changed by this repair):

| Statement | Instances tried | Computed values on the two sides | Result | Change |
| --- | --- | --- | --- | --- |
| SW(k) is the §6.1 étale lift at W(k) (lines 7, 125, 627) | d=1, p=2,3; d=2, p=2; ramified ℤ₃[ζ₃]; W(𝔽_p[t^(1/p^∞)]) | d=1: W(𝔽_p)=ℤ_p, lift S_p^∧, π₁ = ℤ/2 at p=2 and 0 at p=3. d=2: f=x²+x+1 has f′(a)=2a+1≡1 mod 2 at both residue roots, so ℤ₂[ζ₃] is étale; the lift has π₀ = ℤ₂[ζ₃] and module rank 2. ℤ₃[ζ₃]: f′(1)=3≡0 mod 3, not étale, so §6.1 does not apply. W(𝔽_p[t^(1/p^∞)]) is not finitely presented over ℤ_p, so it is outside both §6.1 and §4.8 | holds; scope "neither constructed nor used" is consistent | none |
| L/ℚ_p Galois with cyclic group of order d, by rigidity at M=L (lines 631, 638) | d=1; d=2, p=2; d=3, p=3; ramified ℚ₃(ζ₃); ℚ₂(2^(1/3)) | d=1: \|End(ℚ_p)\| = \|End_𝔽_p(𝔽_p)\| = 1 = [ℚ_p:ℚ_p]. d=2: \|End_ℚ₂(ℚ₂(ζ₃))\| = 2 (id, ζ₃↦ζ₃²) = \|End_𝔽₂(𝔽₄)\| = 2 (2∣2) = [L:ℚ₂], group C₂. d=3: \|End_𝔽₃(𝔽₂₇)\| = 3 = [L:ℚ₃], group C₃. ℚ₃(ζ₃): 2 field endomorphisms against 1 for 𝔽₃, so rigidity needs `IsUnramified`. ℚ₂(2^(1/3)): \|Aut\| = 1 ≠ 3, and e=3, so it is excluded | holds | ramified count added as a Check (line 54) |
| Hypotheses in the Tau Ceti contract (lines 44–47) | each declaration's variable block | `isUnramified_iff_etale`: base hypotheses only. `residueFieldHomEquiv`: `Module.Finite`, `IsUnramified`, any M with `ValuativeExtension K M`, no `IsGalois`. ResidueCorrespondence and Frobenius: `FiniteDimensional`, `IsGalois`, `IsUnramified`. `Padic.integerRingEquiv`: `Fact p.Prime` | README matches the pin | none |
| Mathlib count lemma (line 38) | K=L=𝔽₄/𝔽₂; K=𝔽₄, L=𝔽₈/𝔽₂; K=L=F | 2∣2 gives 2 maps. 2∤3, so the lemma does not apply (indeed there is no map 𝔽₄→𝔽₈). K=L=F gives 1 | holds | none |
| `IsGalois.of_card_aut_eq_finrank` (line 38) | ℚ₂(ζ₃)/ℚ₂; ℚ(2^(1/3))/ℚ | 2 = 2 gives Galois. 1 ≠ 3 gives no conclusion, and that field is not Galois | holds | none |
| Tau Ceti Check: 𝔽₄ Frobenius congruence (line 53) | q = \|𝓀[ℚ₂]\| = 2 | N(ζ₃−1) = (ζ₃−1)(ζ₃²−1) = 2−(ζ₃+ζ₃²) = 3, a unit of ℤ₂, so ζ₃²−ζ₃ = ζ₃(ζ₃−1) is a unit. The identity fails σ(ζ₃)≡ζ₃² mod 2; Frobenius satisfies it | holds | reason made explicit |
| Tau Ceti Check: L=K=ℚ_p (line 55) | p=2,3 | Gal trivial; rigidity 1↔1; order of Frobenius = inertia degree = 1 | holds | rigidity clause added |
| Arithmetic versus geometric Frobenius (line 56) | 𝔽₄ against 𝔽₈ | 𝔽₄: a↦a² is its own inverse, so it cannot tell the two apart. 𝔽₈: a⁴=a² would give a²(a²−1)=0, so they differ for a ∉ 𝔽₂ | the old Checks could not fix the direction | 𝔽₈ witness added |
| Downstream sentence: module rank d (line 1075) | d=1, 2 | rank 1 (S_p^∧) and rank 2. This agrees with the §4.8 rank bullet and with PadicHodgeRegulators' ℤ_p-rank d | consistent | none |

**Build.** `lake build TauCetiRoadmap.StableHomotopyKTheoryPartII.Suggested`: `Build completed successfully (8954 jobs).`

**Gate.** `gate StableHomotopyKTheoryPartII: set_option=0 blob=0 latex=0 tex=0 prnum=0 sorry-data=0 sorry-examples=0 residue=0 private-paths=0 imports=0 mathlib-subimports=0 no-import-mathlib=0 lean-lines=0 statement-hygiene=0 forbidden=0 dropped=0 readme-ids-missing=0 empty-sections=0 round-labels=0 long-fences=0 layer-ids=0 target-ids=0 depcheck=0 metadata=0 stray-files=0 dirty=0 outside-folder=0 source-material=0 OK`

Commit `e8c12391` ("StableHomotopyKTheoryPartII: review repairs (SW(k) as RefinedTraceMethods étale lift; cite unramified theory from Tau Ceti)"), not pushed.
