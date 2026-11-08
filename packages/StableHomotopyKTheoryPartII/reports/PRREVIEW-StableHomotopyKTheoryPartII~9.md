# Review of StableHomotopyKTheoryPartII (pull request #1733 at b984cf9)

**Verdict:** needs changes

Incremental re-review of the 41 lines changed since e8c1239 (README.md only; nothing outside the folder changed). Of the previous report's four findings, two are repaired (the TangentialBordism item numbers; the Tate-cohomology supplier contract), one is partly repaired (the `stacks-algebra` entry is now cited but still has no bibliographic fields) and one is untouched (the missing `Module.Finite K M`). Both remaining findings are P3; nothing blocks.

## R01 (P3) — The Tau Ceti rigidity contract still leaves out `Module.Finite K M`

Carried from the previous report (its R02; originally R01 two rounds ago). The head does not touch the line.

**Location.** `TauCetiRoadmap/StableHomotopyKTheoryPartII/README.md:55`: “for every nonarchimedean local field M with `Algebra K M` and `ValuativeExtension K M`, reduction is a bijection from the K-algebra maps L→M to …”.

**Claim.** The pinned declaration also requires `[Module.Finite K M]`; the bullet lists every other instance hypothesis and omits this one.

**Witness.** My scratch `#check @TauCeti.IsUnramified.residueFieldHomEquiv` at the pin elaborates with both `[Module.Finite K L]` and `[Module.Finite K M]` (source: `TauCeti/NumberTheory/LocalField/Unramified/Rigidity.lean`, variable block before the definition).

**Exact repair.** Replace “with `Algebra K M` and `ValuativeExtension K M`” by “with `Algebra K M`, `ValuativeExtension K M` and `Module.Finite K M`”.

**Tested** at the only use, M=L (§4.8, README lines 649–651): the added hypothesis becomes `Module.Finite K L`, which the bullet already carries, so no statement of §4.8 changes.

## R02 (P3) — The `stacks-algebra` manifest entry has no `authors`, `title` or `year`

Partly repaired from the previous report's R04: the README now cites the entry (lines 651 and 1108, with the correct locator), so it is no longer orphaned, but the entry is still incomplete.

**Location.** `packages/StableHomotopyKTheoryPartII/sources.toml:187–197`, the `[[source]]` with `id = "stacks-algebra"`.

**Claim.** The manifest schema records `authors`, `title` and `year` for every cited work. The other eleven entries have all three (lines 6–8, 22–24, …, 172–174); this one has only `id`, `locator_scheme`, `locator`, `url`, `fetched_from`, `fetched_at`, `sha256`, `licence_class`, `status`, `accessed` and `cited_for`.

**Witness.** `grep -n "^authors\|^title\|^year"` on the manifest returns 33 lines, three per entry for the first eleven ids and none after line 187.

**Exact repair.** Add to that table `authors = "The Stacks project authors"`, `title = "The Stacks project, Commutative Algebra"` and `year = 2026` (the year of access, the text being a living document; the README's reference line already reads “Online, open access”). Nothing in the README changes.

**Tested:** the README reference at line 1108 gives the same authors and title, so the two agree after the edit; `cited_for = ["4.8"]` now matches the citing bullet at line 651.

## Previous findings

- R01 — repaired: lines 12, 100, 278, 386 and 396 now read “items 2 (at p=2) and 7 (at odd p)” or “items 2 and 7”; line 90 keeps “item 8” for the exterior-algebra freeness, as the repair asked. At TangentialBordism's head, B4.7 (“Odd-prime operations and simple systems”) contains “For every odd prime p construct the HF_p Adams tower … strong convergence”, and B4.8 is the MSO/MSpin comparison that consumes it.
- R02 — not repaired: line 55 still reads “with `Algebra K M` and `ValuativeExtension K M`”. Carried as R01.
- R03 — repaired: the Mathlib contract gains `tateCohomology` (line 40); the Tau Ceti contract gains the two-term models, `periodicIso`, `cup`, `cupUnit`, `cup_assoc` and `cup_gradedComm` with their files and two Checks (lines 44–52, 63–64); the §1.1 and §6.1 routes read the groups and products from them; the *Needs:* lines and Layer 1 and 6 Dependencies list them. Every description matches the pin (table below).
- R04 — partly repaired: the README cites `stacks-algebra` at line 651 for the henselian finite-étale equivalence and lists it at line 1108; the cache locator is right. The entry still lacks `authors`, `title` and `year`. Carried as R02.

## Verified sound

**Gate, dependency direction, elaboration.** Run on this head.

```text
gate StableHomotopyKTheoryPartII: set_option=0 blob=0 latex=0 tex=0 prnum=0 sorry-data=0 sorry-examples=0 residue=0 private-paths=0 imports=0 mathlib-subimports=0 no-import-mathlib=0 lean-lines=0 statement-hygiene=0 forbidden=0 dropped=0 readme-ids-missing=0 empty-sections=0 round-labels=0 long-fences=0 layer-ids=0 target-ids=0 depcheck=0 metadata=0 stray-files=0 dirty=0 outside-folder=0 source-material=0 build=0 OK
depcheck: 236 roadmaps, 2419 edges, 0 problem(s)
```

- The worker's gate (with the targeted build) passes every check; the dependency check prints no UPWARD, CYCLE or moved line.
- `git diff --stat origin/main...HEAD` outside the folder is empty; the worktree is clean at b984cf9.
- `lake env lean` on `TauCetiRoadmap/StableHomotopyKTheoryPartII/Suggested.lean` exits 0 with no output. The file still declares nothing (module docstring, `import Mathlib`, empty namespace), so the signature inventory and the one-tactic padding probe have zero entries; the headline-theorem analysis of the previous report stands (14 headlines named in the docstring as not statable, none statable at the pins).

**The eight declarations the change cites, elaborated at the pin.** I built `TauCeti.RepresentationTheory.Homological.TateCohomology.Cup.Unit` (its object file was missing) and elaborated one scratch file with nine `#check`s; all resolve.

| Declaration | Elaborated hypotheses and type | README description | Match |
|---|---|---|---|
| `tateCohomology` (Mathlib `…/TateCohomology/Basic.lean:140`) | `[CommRing R] [Group G] [Fintype G]`, `Rep R G → ℤ → ModuleCat R`; complex joins inhomogeneous chains and cochains along `Rep.tateNorm`; `isoGroupCohomology n` for `n ≠ 0`, `isoGroupHomology` in degree `−(n+1)`, `n ≠ 0` | commutative ring, finite group, `Rep R G`, integer degree; positive degrees = cohomology, ≤ −2 = homology | yes |
| `Rep.FiniteCyclicGroup.tateCohomologyIsoEven` (`Periodic.lean:167`) | `(g : G) (hg : ∀ x, x ∈ Subgroup.zpowers g) (n : ℤ) (Even n)`; target `(normHomCompSub M g).homology` = homology of `M –N→ M –(ρ(g)−1)→ M` | even degrees, model M –N→ M –(g−1)→ M | yes |
| `…tateCohomologyIsoOdd` (`Periodic.lean:200`) | same, `Odd n`; target `(subCompNormHom M g).homology` = `M –(ρ(g)−1)→ M –N→ M` | odd degrees, model M –(g−1)→ M –N→ M | yes |
| `…periodicIso` (`Periodic.lean:346`) | `[IsCyclic G] (m n : ℤ) (m ≡ n [ZMOD 2])` | under `IsCyclic G`, degrees congruent mod 2 | yes |
| `TauCeti.TateCohomology.cup` (`Cup/Product.lean:131`) | `(p q r : ℤ) (p + q = r)`, `tateCohomology M p →ₗ[k] tateCohomology N q →ₗ[k] tateCohomology (M ⊗ N) r` | k-bilinear, all integer bidegrees, target M⊗N in degree p+q | yes |
| `…cupUnit` (`Cup/Unit.lean:33`) | `tateCohomology (𝟙_ (Rep k G)) 0`, the class `H0π ⟨1, _⟩` | degree-zero class of 1 in the trivial representation | yes |
| `…cup_assoc` (`Cup/Associativity.lean:214`) | `(tateCohomologyFunctor r).map (α_ M N P).hom ((x∪y)∪z) = x∪(y∪z)` | associative through the tensor associator | yes |
| `…cup_gradedComm` (`Cup/GradedComm.lean:168`) | `(tateCohomologyFunctor r).map (β_ M N).hom (x∪y) = (p*q).negOnePow • (y∪x)` | after the braiding, x∪y = (−1)^(pq) y∪x | yes |
| `TauCeti.IsUnramified.residueFieldHomEquiv` | `[Module.Finite K L] … [Module.Finite K M] [IsUnramified K L]` | lists `Module.Finite K L` only | no (R01) |

The file paths named in the contract (Periodic.lean; Cup/Product.lean, Unit.lean, Associativity.lean, GradedComm.lean under `TauCeti/RepresentationTheory/Homological/TateCohomology/`) all exist at the pin.

**Cross-roadmap citations the change touches, resolved this round.**

| Citation | Copy read | Result |
|---|---|---|
| TangentialBordism §B4 items 2 and 7 (lines 12, 100, 278, 386, 396) | head via `roadmaps show` | B4.2 “Steenrod algebra, transgression and Adams convergence” (mod 2); B4.7 “Odd-prime operations and simple systems” contains “For every odd prime p construct the HF_p Adams tower … strong convergence”; B4.8 “Odd-primary SO and Spin comparison” consumes B4.7. Correct. |
| TangentialBordism §B4 item 8 (line 90, unchanged) | same | B4.8 is the right owner of freeness over the exterior algebra of Milnor primitives. Correct. |
| KTheoryFiniteLocalFields §4.5 “complete cyclic resolution and odd-order Tate ring” (lines 193, 228) | head via `roadmaps show` | §4.5 “Tate cochains, products and the filtered Tate spectrum” compares the HM complete-resolution cochain model with Mathlib's `tateCohomology` and states Ĥ*(C_r,k)=Λ_k(u)⊗k[t,t⁻¹], \|u\|=1, \|t\|=2, for C_r of odd order acting trivially on a commutative k with r=0 in k. The README's hypotheses (odd order, trivial action, r=0 in k, at r=p, k=𝔽_p) are exactly these. Correct. |
| `stacks-algebra` Tag 04GK (line 651) | cache line 19502, chapter page 415 | Lemma 153.7 (book numbering 10.153.7): for a henselian local ring (R,m,κ), S ↦ S/mS is an equivalence from finite étale R-algebras to finite étale κ-algebras. The README uses full faithfulness at R=ℤ_p, S=W(k). Correct. |

**Seeded sample, where it falls in the change.** Only §1.1 is both in the sample and changed: ns18 lines 5098–5113 (p.332) give Ĥ*(C_p;𝔽_p)=𝔽_p((t))⊗Λ(e), \|t\|=−2, \|e\|=−1, 𝔽_p((s)) at p=2 with \|s\|=−1, and the inverse multiplication action of 𝔽_p^× on t⁻¹e; the §1.1 statement and its new route agree with this. The other fourteen sampled targets are untouched by the diff; their locators were verified in the previous report and are not re-opened.

**Adversarial table.** Rows for untouched statements carry forward from the previous report (cited as “r8”); rows with values computed this round are for the changed passages.

| Statement | Instances | Values on each side / model excluded | Result | Change |
|---|---|---|---|---|
| 1.1 route (changed): groups from the two-term models | C₃ on 𝔽₃ trivial, even and odd models | N=3=0 and g−1=0, so ker/im = 𝔽₃/0 = 𝔽₃ in every degree; dimension 1 per degree as 𝔽₃[t^(±1)]⊗Λ(e) has (degrees −4,−3,−2,−1,0 carry t², t²·t⁻¹e… each one-dimensional) | Pass | none |
| 1.1 route (changed): b²=0 at odd p from `cup_gradedComm` | p=q=1, M=N=𝔽_p trivial, braiding of 𝔽_p⊗𝔽_p is the identity | b∪b = (−1)^1 b∪b, so 2b²=0 and b²=0 for p odd; e²=b²u⁻²=0 | Pass | none |
| 1.1 route (changed): p=2 | b∈Ĥ¹(C₂;𝔽₂), u=βb | sign (−1)^1=+1 in 𝔽₂, no relation; b²=Sq¹b=βb=u≠0; b·(b·u⁻¹)=u·u⁻¹=1, so s=b·u⁻¹ has degree −1 and is b⁻¹; ring 𝔽₂[s^(±1)] matches ns18 𝔽₂((s)) | Pass | none |
| 1.1 route (changed): Hℤ | C_p on ℤ trivial | even model ker(0)/im(p)=ℤ/p; odd model ker(p)/im(0)=0; Ĥ⁰(C₃;ℤ)=ℤ/3 and Ĥ⁻¹=0 | Pass | none |
| Tau Ceti contract Check (new, line 63) | C₃ on 𝔽₃ and on ℤ; models exchanged | 𝔽₃ in every degree; ℤ/3 even, 0 odd; exchanging gives Ĥ⁰=ker 3/im 0=0 against the true ℤ/3 | Pass | none |
| Tau Ceti contract Check (new, line 64) | bidegree (1,1), p odd and p=2 | −1≠1 at odd p forces b²=0; at p=2, −1=1 and b²=βb≠0 | Pass | none |
| 6.1 route (changed): integral Tate summands | C_p on ℤ, `periodicIso` m≡n mod 2 | ℤ/p in even degrees, 0 in odd; periodicIso identifies even with even, consistent with the two-term pieces with differential p (each quasi-isomorphic to a shifted 𝔽_p) | Pass | none |
| 4.8 bullet (changed): Stacks 04GK at R=ℤ_p, S=W(k) | k=𝔽₄; k=𝔽₂; negative control ℤ₃[ζ₃] | ℤ_p is complete hence henselian; W(𝔽₄) finite étale (previous bullet), Hom_{ℤ₂}(W(𝔽₄),W(𝔽₄)) ↔ Hom_{𝔽₂}(𝔽₄,𝔽₄): 2=2; at 𝔽₂: 1=1; ℤ₃[ζ₃] is not étale over ℤ₃ so the lemma does not apply and the counts 2 vs 3 differ, as the README's negative control says | Pass | none |
| TangentialBordism item numbers (changed) | p=2; p=3 | B4.2 supplies the mod-2 tower; B4.7 supplies the HF₃ tower and strong convergence; B4.8 consumes B4.7 | Pass | none (r8 R01 repaired) |
| Mathlib `tateCohomology` contract (new, line 40) | n=1; n=−2; n=0,−1 | `isoGroupCohomology 1`: Ĥ¹=H¹; `isoGroupHomology` at m=−2=−(1+1): Ĥ⁻²=H₁; degrees 0 and −1 are the norm kernel/cokernel, not claimed as either | Pass | none |
| Manifest | 12 entries | 12 cited (line 1108 now lists `stacks-algebra`); 11 have authors/title/year, 1 does not | Fail | R02 |
| Tau Ceti rigidity contract | elaborated signature | `Module.Finite K L` and `Module.Finite K M` at the pin; the README lists the first only | Fail | R01 |
| 1.2, 2.1–2.7, 3.1, 3.4, 4.1–4.7, 5.1–5.6, 6.2, 6.3, 7.2–7.5, 7 Examples, 8.1–8.3 | as in r8 | values as in the r8 table (untouched by this diff) | Pass (r8) | none |

**Remarks on untouched text (no change requested).** Layer 2 Dependencies (line 396) lists “TangentialBordism §B4 items 2 and 7” twice, once alone and once with BordismFormalGroups §F6.3, because two *Needs:* lines contribute it; harmless.

**Ownership and overlaps.** `overlaps.md` lists no open pull request changing this roadmap and no dropped or revision-only id; the citation check finds no unresolved cross-roadmap citation or Lean name. The change adds no construction another roadmap could own: it replaces a re-derivation by citations of pinned declarations and of KTheoryFiniteLocalFields §4.5.

**Declared gap `steenrod-finite-hopf-chain`.** Untouched by the diff; verified in the previous report.

## Not verifiable

- KTheoryFiniteLocalFields §4.5's boundary normalization ∂(ut⁻¹)=−1 cites HM03 Addendum 4.2.2, not in the cache; as in the previous report, this roadmap fixes its own basis (βe=1, line 193) and says explicitly that the supplier's generators are not used, so nothing depends on it.
- The Tau Ceti instances for the abstract field L=W(k)[1/p] were not checked (implementer plumbing, as before).
- TangentialBordism and KTheoryFiniteLocalFields have no checkout path in the brief; I read them through `roadmaps show` at their heads.

## Source issues

- none (the four ns18 issues of the previous report stand; this round's locator checks found no new ones).
