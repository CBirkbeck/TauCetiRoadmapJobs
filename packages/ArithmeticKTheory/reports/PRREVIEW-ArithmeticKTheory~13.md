# Review of ArithmeticKTheory (pull request #1418 at d682d86)

**Verdict:** accepted

This is an incremental re-review of the 21 lines changed since 51e8c9f. All of them are in `TauCetiRoadmap/ArithmeticKTheory/README.md`:
- the GeneralAlgebraicKTheory and KTheoryFiniteLocalFields supplier contracts;
- the *Needs:* lines of §§2.4, 3.3 and 5.5;
- the Layer 2 Dependencies.

`Suggested.lean` is unchanged, and nothing outside the folder changed. The one previous finding is repaired, and the repair introduces no new defect. The gate passes, the dependency check is clean, and `Suggested.lean` elaborates with `sorry` as its only warning.

No findings.

## Previous findings

- R01 — repaired: line 977 reads “GeneralAlgebraicKTheory §13.8c for K_n(𝔽_q)=0 at even n≥2”. The contracts (lines 304–306, 455–456) and the Layer 2 Dependencies (lines 991–992) now name §13.8c as owner. The §§3.3 and 5.5 *Needs:* lines are repointed too.

## Verified sound

### Gate, dependency check and Lean

- **Gate**, rerun on this head: `gate ArithmeticKTheory: set_option=0 blob=0 latex=0 tex=0 prnum=0 sorry-data=0 sorry-examples=0 residue=0 private-paths=0 imports=0 mathlib-subimports=0 no-import-mathlib=0 lean-lines=0 statement-hygiene=0 forbidden=0 dropped=0 readme-ids-missing=0 empty-sections=0 round-labels=0 long-fences=0 layer-ids=0 target-ids=0 depcheck=0 metadata=0 stray-files=0 dirty=0 outside-folder=0 source-material=0 OK`. This agrees with the worker's `gate.md`, which also records `build=0`.
- **Dependency check prescribed by the brief:** `depcheck: 237 roadmaps, 2309 edges, 0 problem(s)`. There is no UPWARD, CYCLE or moved line for this roadmap. The new supplier edge goes downward: GeneralAlgebraicKTheory is at position 17 of the merge order, KTheoryFiniteLocalFields at 90 and ArithmeticKTheory at 136.
- **Outside the folder:** `git diff --stat origin/main...HEAD -- . ':!TauCetiRoadmap/ArithmeticKTheory'` is empty. `git diff 51e8c9f HEAD --stat` touches only the README, so `Suggested.lean`, `lake-manifest.json` and the pins are unchanged.
- **Elaboration:** I ran `lake env lean` on a scratch copy of `Suggested.lean`, with `#check @name` appended for all six declarations.
  - Result: exit 0, and the only warnings are four `declaration uses 'sorry'` (lines 67, 73, 98, 115).
  - Every elaborated type agrees with `signatures.md`. `solomonTits` keeps `[FiniteDimensional K V]`, `2 ≤ Module.finrank K V` and `k ≠ Module.finrank K V - 2`. `integer_isLocalization_iff` and `…_of_torsion_classGroup` keep `[IsDedekindDomain R]` and `[IsFractionRing R F]`.
  - The `-number` entry of `signatures.md` is an artifact of the word “class-number” in the module docstring, as in earlier rounds.
- **One-tactic probe and headline theorems:** no Lean statement changed and the pins are the same, so the previous round's result still holds. `first | rfl | infer_instance | decide | norm_num | simp | aesop | simp_all` closes none of the four theorems.
  - Stated in `Suggested.lean`: `integer_isLocalization_iff`, `integer_isLocalization_of_torsion_classGroup`, `solomonTits` and `regularPrime_dividedBernoulli_num`.
  - The rest of the headline list is named in the module docstring as not statable, as before.

### Adversarial pass

| Statement | Instances | Values computed on each side | Result |
| --- | --- | --- | --- |
| GeneralAlgebraicKTheory contract, §13.8c clause (lines 304–306, changed) | q=2, 4, 5; the boundary i=0 | q=2: K₀=ℤ, K₁=ℤ/(2−1)=0=𝔽₂^×, K₂=0, K₃=ℤ/3. q=4: K₁=ℤ/3=𝔽₄^×, K₄=0. q=5: K₃=ℤ/24, K₄=0. At i=0 the formula would give K₀=0 and K₋₁=ℤ/0=ℤ, both wrong. The clause restricts to i≥1 and states K₀=ℤ separately, as the supplier and K-book IV.1.13 do. | Pass |
| “the vanishing used by §§2.4, 3.3 and 5.5” (line 306, changed) | each named section | §2.4: ⊕K_n(k(v))=0 for n even ≥2 gives injectivity. §3.3: the same vanishing gives injectivity for positive even n. §5.5: in 0→K_(2i)(k)/N→K_(2i)(k;ℤ/N)→K_(2i−1)(k)[N]→0, K_(2i)(k)=0 gives the isomorphism used there. All three use it. | Pass |
| KTheoryFiniteLocalFields contract (lines 455–456, changed) | what §§1.1–1.6 actually supply; a transfer witness | At its head the supplier's own contract (README line 71) names GeneralAlgebraicKTheory §13.8c as owner of `finiteFieldKGroups`. Its §1.2 builds `bott ω`, §1.4 the normalized odd classes, and §1.5 `finiteFieldRes`/`finiteFieldTransfer`. For 𝔽₂⊂𝔽₄ in degree 3, res is multiplication by (4²−1)/(2²−1)=5 from ℤ/3 to ℤ/15, and tr∘res=2. | Pass |
| §2.4 *Needs:* (lines 977–979, changed) | n=0, 2, 4; Check 2's odd group | Even n=2i≥2 is exactly §13.8c's i≥1. n=2: K₂(𝔽_p)=0. n=4: K₄(𝔽₂)=K₄(𝔽₅)=0. n=0 is correctly excluded, since K₀(𝔽_q)=ℤ≠0. Check 2's K₃(𝔽₂)=ℤ/3=ℤ/(2²−1) is the same theorem at i=2. | Pass |
| Layer 2 Dependencies (lines 990–993, changed) | the finite-field entry against the §§2.1–2.4 *Needs:* lines | The finite-field entry names the owner, §13.8c, and the normalizing supplier, matching line 977. The two suppliers are in the right order (17 < 90). | Pass |
| §3.3 *Needs:* (lines 1399–1401, changed) | F=ℚ: S=∅⊂T={2}, n=2, 3; S=∅⊂T={3}, n=4 | T={2}, n=2: residues K₁(𝔽₂)=0 and K₂(𝔽₂)=0, so K₂(ℤ)≅K₂(ℤ[1/2]). n=3: K₃(𝔽₂)=ℤ/3→K₃(ℤ)→K₃(ℤ[1/2])→K₂(𝔽₂)=0, so the map is onto with kernel of order dividing 3; the README asserts no kernel vanishing. T={3}, n=4: 0→K₄(ℤ)→K₄(ℤ[1/3])→K₃(𝔽₃)=ℤ/8, so the cokernel has order at most 8. The residue groups are torsion, so they vanish after ⊗ℚ, consistent with the rational equivalence. “Finiteness and even vanishing” is exactly what is used. | Pass |
| §5.5 *Needs:* (lines 2347–2348, changed) | (q,ℓ,i)=(7,3,1), (5,2,2), (19,3,1) | N=ℓ^(v_ℓ(qⁱ−1)) in each case. (7,3,1): N=3, (ℤ/6)[3]=ℤ/3. (5,2,2): N=8, (ℤ/24)[8]=ℤ/8=ℤ/gcd(8,24), as KTheoryFiniteLocalFields §1.6 gives, with 4∣N in the dyadic case. (19,3,1): N=9, (ℤ/18)[9]=ℤ/9. In each case K_(2i)(𝔽_q)=0 makes the Bockstein an isomorphism. | Pass |
| §2.4 statement, Checks; §3.2 / `solomonTits` | carried from the previous report (r12), untouched by the diff | ℤ, ℤ[1/p], O_(F,S) with S infinite, 𝔽_q[t], a field; n=1, 3; V=𝔽₂², ℚ², 𝔽₂³, ∅ (values as in r12) | Pass |
| `integer_isLocalization_iff` | carried from r12 | R a field; ℤ with S={(2)}, M=⟨2⟩, ⟨6⟩; 0∈M | Pass |
| `…of_torsion_classGroup` | carried from r12 | ℤ[√−5], S={𝔭}, 𝔭²=(2); S=Spec¹ | Pass |
| `regularPrime_dividedBernoulli_num` | carried from r12 | p=2: 1/6, −1/60, 1/126, −1/120; (5,5): 1/66; (7,6): −691/16380; p=37 fails the hypothesis | Pass |
| §§1.3, 3.2 duality, 3.4, 4.2, 4.4, 5.1, 5.3, 5.4, 6.3–6.6, 6.12, 6.15, 8.2, 8.7–8.9 | carried from r12, untouched | as in r12's table | Pass |

### Seeded sample within the changed passages

The diff touches two targets of the seeded sample: §3.3 and §5.5 (their *Needs:* lines). I checked their locators again:

| Target | Locator, cache line | Result |
| --- | --- | --- |
| 3.3 | kbook V.6.1, line 24317: the localization sequence for a central multiplicative set in a noetherian ring; printed p. 406 (footer at line 24373) | ✓ |
| 3.3 | kbook IV.1.13, lines 15636–15640: K_n(𝔽_q) is ℤ/(qⁱ−1) for n=2i−1 and 0 for even n≥1; p. 269 (footers at lines 15600 and 15665) | ✓ |
| 3.3 | kbook IV.6.3–6.3.2, lines 18731–18756: functoriality of K-groups along exact functors; p. 320 (footers at lines 18726 and 18788) | ✓ |
| 3.3 | kbook V.6.6.3–6.6.4, lines 24596–24624: transfer compatibility of the Dedekind localization sequences; p. 410 (footers at lines 24580 and 24644) | ✓ |
| 5.5 | kbook VI.2.5, line 28599: summand ℤ/w_i in K_(2i−1)(F), nonexceptional at 2, and the integrally closed ring version; p. 473 (footers at lines 28588 and 28660) | ✓ |
| 5.5 | kbook Remark VI.2.5.1 and Theorem VI.2.6, lines 28683 and 28697; p. 474 | ✓ |
| 5.5 | kbook VI.1.5 and Corollary VI.1.5.2, lines 28208 and 28239; pp. 466–467 (footer at line 28229) | ✓ |
| 5.5 | handbook §5.4, lines 590–624: Kahn maps and their compatibility with the Harris–Segal map; p. 153 | ✓ |
| 5.5 | handbook Theorem 73, lines 1285–1312: K_(2i−1)(O_S)≅ℤ^(r₂)⊕ℤ/w_i for totally imaginary F | ✓ (remark below) |

The other sampled targets (§§3.5, 5.1, 6.2, 6.8, 6.9, 6.11, 6.12, 6.15, 7.4, 8.2, 8.4, 8.9, 8.10) are outside the changed passages, so this incremental review did not reopen them. The README flags no locator as unverified.

### Cross-roadmap citations resolved at the open heads

- **GeneralAlgebraicKTheory (#1212, head 43e9df6), README line 3027, §13.8c:** states K₀(F_q)=ℤ, K₂ᵢ(F_q)=0 and K₂ᵢ₋₁(F_q)≃ℤ/(qⁱ−1) for i≥1. Its Checks give K₄(F₂)=0 with K₃(F₂)=ℤ/3, and K₃(F₅)=ℤ/24 with K₄(F₅)=0. The new contract clause matches it exactly.
- **KTheoryFiniteLocalFields (#1281, head 3c5b201):**
  - README line 71 consumes §13.8c's `finiteFieldKGroups`.
  - §1.2 (line 230) gives the Bott classes, §1.4 (line 254) the normalized classes, and §1.5 (line 267) `finiteFieldRes`/`finiteFieldTransfer`.
  - The new contract wording, “normalize … supplied by GeneralAlgebraicKTheory §13.8c and supply the Bott classes and finite-field transfers”, describes these sections accurately.
- **Consumers of the touched sections:**
  - Polylogarithms (#1424) README lines 102, 110 and 827 and BorelRegulators (#1461) README lines 284 and 702 cite §§3.3–3.4.
  - EllipticKTheory (#1489) README line 1057 cites §§2.1, 2.4 and 3.4.
  - Only *Needs:* lines changed, so no consumer is affected.
- **`roadmaps resolve`:** the single lead, `VanishingCycles.etaleTateTwists`, is the planned name in EtaleCohomologyFoundations F.0.3, as in earlier rounds. It is untouched.
- **`overlaps.md`:** no other pull request changes this roadmap, and no cited id is dropped. The change adds no object; it replaces a supplier attribution with the owner's section, which removes a second apparent owner of the finite-field groups.

### Declared gaps

The diff does not touch them. As recorded in r12, both slugs (`connective-c2-homotopy-orbit-spectral-sequence`, `number-ring-witt-signature`) match between `design/plan.json` and the README contracts.

### Remarks on text the change did not alter (no change requested)

- The §5.5 locator “handbook Theorem 73, pp. 167–169” is wider than needed. Theorem 73 and its proof lie on p. 169 (page header at line 1270, proof ends at line 1312). Pages 167–168 hold Theorems 67 and 70, which its proof uses for the odd torsion.
- Layer 2's Dependencies do not repeat some suppliers that the §§2.1–2.2 *Needs:* lines list: StableHomotopyKTheory §§7.1–7.7 and 7.28, GeneralAlgebraicKTheory §§7.4–7.8 and 8.13, and Tau Ceti `Set.unitValuation`. The dependency check reads the *Needs:* lines and finds these edges in order.
- The new §2.4 entry “KTheoryFiniteLocalFields §§1.1–1.6 for its normalized classes and transfers” is not used by §2.4's own argument, which needs only the §13.8c groups. Under the unused-hypothesis rule this is a note, not a finding: KTheoryFiniteLocalFields already precedes this roadmap, so no order changes.

## Not verifiable

- §3.3's Quillen locator (LNM 341, Theorem 1, Remark (2), pp. 179–180) and §5.5's Harris–Segal (§3, pp. 20–33) and Mitchell (pp. 185–186) locators are under manifest keys recorded as waived (`quillen`, `harris-segal`, `mitchell`), so I did not read them.
- Sources cited only outside the changed passages were not reopened in this round.

## Source issues

- none
