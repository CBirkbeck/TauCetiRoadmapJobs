# Review of ArithmeticKTheory (pull request #1418 at 51e8c9f)

**Verdict:** needs changes

Incremental re-review of the 45 lines changed since e79082a: README §2.4 (even-degree injectivity from n=2, new Checks and locators, new *Needs:* glosses) and the m=2 wording of Solomon–Tits in README §3.2 and the `solomonTits` docstring. Both findings of the previous review are repaired. One P3 finding remains, introduced by the repair of R02: the new gloss on the §2.4 *Needs:* line attributes the finite-field vanishing theorem to a roadmap that itself imports it.

The gate passes, the dependency check is clean, and `Suggested.lean` elaborates with `sorry` as the only warning.

## R01 (P3) — §2.4's *Needs:* line cites KTheoryFiniteLocalFields for K_n(𝔽_q)=0, a theorem GeneralAlgebraicKTheory §13.8c owns

**Location.** `TauCetiRoadmap/ArithmeticKTheory/README.md` line 974: “KTheoryFiniteLocalFields §§1.1–1.6 for K_n(𝔽_q)=0 at even n≥2”. The same attribution is implicit in the Layer 2 Dependencies at lines 987–988 and in the contract at line 453 (“Sections 1.1–1.6 supply normalized finite-field K-groups”).

**Claim.** The vanishing of K_n(𝔽_q) in positive even degrees, the whole input of the injectivity argument, is supplied by KTheoryFiniteLocalFields §§1.1–1.6.

**Witness.** KTheoryFiniteLocalFields at its open head (#1281) states in its own supplier contracts, README line 71, that GeneralAlgebraicKTheory §13.8c supplies `finiteFieldKGroups`: K₀=ℤ, K₂ᵢ=0, K₂ᵢ₋₁≅ℤ/(qⁱ−1) for i≥1; its Layer 1 is titled “finite fields over the supplied Brauer–Quillen comparison” and uses the vanishing as given (§1.1, “when positive even and negative homotopy vanish, in particular for K(𝔽q)”). GeneralAlgebraicKTheory at #1212, README line 3027, §13.8c, proves exactly K₂ᵢ(𝔽_q)=0 and K₂ᵢ₋₁(𝔽_q)≅ℤ/(qⁱ−1). This roadmap's GeneralAlgebraicKTheory contract (lines 299–309) does not list §13.8c, so the theorem §2.4 rests on has no contract with its owner here.

**Repair.**
- Line 974: write “GeneralAlgebraicKTheory §13.8c for K_n(𝔽_q)=0 at even n≥2 (`finiteFieldKGroups`); KTheoryFiniteLocalFields §§1.1–1.6 for its normalized classes and transfers;”.
- Lines 987–988: “finite-field K-groups from GeneralAlgebraicKTheory §13.8c, normalized in KTheoryFiniteLocalFields §§1.1–1.6”.
- Line 301, in the GeneralAlgebraicKTheory contract, add: “§13.8c supplies the finite-field groups K₀(𝔽_q)=ℤ, K_(2i)(𝔽_q)=0 and K_(2i−1)(𝔽_q)≅ℤ/(qⁱ−1) for i≥1.”
- Line 453: “Sections 1.1–1.6 normalize the finite-field K-groups supplied by GeneralAlgebraicKTheory §13.8c and supply the Bott classes”.

**Tested.** GeneralAlgebraicKTheory §13.8c's own Checks give K₄(𝔽₂)=0 with K₃(𝔽₂)=ℤ/3, K₄(𝔽₄)=0, and K₃(𝔽₅)=ℤ/24 with K₄(𝔽₅)=0: these are the values the two new §2.4 Checks use (K₂(𝔽_p)=0 for all p; K₃(𝔽₂)=ℤ/3=ℤ/(2²−1)). The merge order places GeneralAlgebraicKTheory (position 17) before KTheoryFiniteLocalFields (90) and this roadmap (136), so the repointed citation is downward.

## Previous findings

- R01 — repaired: README lines 1072–1077 now say that for m≥3 the degree-zero case gives nonemptiness and connectedness, and that at m=2 the building is the discrete set of lines, the statement concerns positive degrees only, the empty simplicial set also satisfies it, and nonemptiness is the separate fact that V has a line. The `solomonTits` docstring (`Suggested.lean` lines 92–97) says the same; the theorem statement is unchanged.
- R02 — repaired: README lines 951–954 now prove injectivity for every even n≥2 over any Dedekind domain with finite residue fields, from K_n(k(v))=0 in positive even degrees; lines 954–958 make the number-field n=2 case the comparison with K2SymbolsBrauer §12.2 and name the extra cases covered (arbitrary S, smooth affine curves over finite fields); the locator adds IV.1.13, p. 269; two Checks are added; the *Needs:* line reads “only for the degree-two comparison”. The new gloss on the KTheoryFiniteLocalFields citation is R01 above.

## Verified sound

### Gate, dependency check and Lean

- **Gate**, rerun on this head: `gate ArithmeticKTheory: set_option=0 blob=0 latex=0 tex=0 prnum=0 sorry-data=0 sorry-examples=0 residue=0 private-paths=0 imports=0 mathlib-subimports=0 no-import-mathlib=0 lean-lines=0 statement-hygiene=0 forbidden=0 dropped=0 readme-ids-missing=0 empty-sections=0 round-labels=0 long-fences=0 layer-ids=0 target-ids=0 depcheck=0 metadata=0 stray-files=0 dirty=0 outside-folder=0 source-material=0 OK`.
- **Dependency check prescribed by the brief:** `depcheck: 239 roadmaps, 2320 edges, 0 problem(s)`; no UPWARD, CYCLE or moved line for this roadmap.
- **Outside the folder:** `git diff --stat origin/main...HEAD -- . ':!TauCetiRoadmap/ArithmeticKTheory'` is empty. The pins are unchanged (`lake-manifest.json` not in the diff).
- **Elaboration:** `lake env lean` on a scratch copy of `Suggested.lean` with `#check @name` appended for all six declarations: exactly four `declaration uses 'sorry'` warnings (lines 67, 73, 98, 115), exit 0. Every elaborated type keeps its binders and agrees with `signatures.md`; `solomonTits` still carries `[FiniteDimensional K V]`, `2 ≤ Module.finrank K V` and `k ≠ Module.finrank K V - 2`. The `-number` entry of `signatures.md` and its “line 123” parse error are artifacts of the word “class-number” in the module docstring, as in the previous round.
- **One-tactic probe:** no Lean statement changed since e79082a (the diff touches only the `solomonTits` docstring), so the previous round's result stands: `first | rfl | infer_instance | decide | norm_num | simp | aesop | simp_all` closes none of the four theorems.
- **Headline theorems:** unchanged since the previous review. Stated: `integer_isLocalization_iff`, `integer_isLocalization_of_torsion_classGroup`, `solomonTits`, `regularPrime_dividedBernoulli_num`. Named in the docstring as not statable, with the missing carrier: finite generation and ranks, Soulé, the Harris–Segal summand, the odd and even tables, wild kernels, Bott descent, K₄(ℤ)=0, H₃(K(ℤ)), the order ratio, the even orders, the Vandiver table, the tame kernels, hermitian finiteness, the arithmetic CW model, the three Aut(P)-module theorems of §3.2, Borel's comparison, π₄(S)⊗ℤ[1/2] and the Adams–Novikov E₂-term.

### Adversarial pass

| Statement | Instances | Values computed on each side | Result |
| --- | --- | --- | --- |
| §2.4 even injectivity (changed) | R=ℤ, n=2; R=ℤ[1/p], n=2; R=O_(F,S) with S infinite; R=𝔽_q[t]; R a field | ℤ, n=2: residue groups K₂(𝔽_p)=0 for all p, so 0→K₂(ℤ)=ℤ/2→K₂(ℚ), and {−1,−1}≠0 in K₂(ℚ). ℤ[1/p]: residue fields 𝔽_ℓ, ℓ≠p, same vanishing. O_(F,S), S infinite: still Dedekind with residue fields O_F/𝔭, 𝔭∉S, finite; K2SymbolsBrauer §12.2 needs S finite, so the general clause is the only route there. 𝔽_q[t]: residue fields 𝔽_(q^d), finite; covered, as the text says. A field: no primes, the map is the identity, injective. | Pass |
| §2.4 odd surjectivity and the n=1 boundary (changed) | n=3; n=1 | n=3: residue groups K₂(k(v))=0 (even, positive), so K₃(R)→K₃(K) onto. n=1: K₀(k(v))=ℤ≠0; K₁(ℤ)={±1}, K₁(ℚ)=ℚ^×, cokernel ⊕_p ℤ. | Pass |
| §2.4 Check 2 (new) | p=2, 3, 5 | K₃(𝔽_p)=ℤ/(p²−1) by IV.1.13 at n=3=2·2−1: ℤ/3, ℤ/8, ℤ/24, all nonzero, so no injectivity at odd n from this sequence. “Positive even” is needed: K₀(𝔽_q)=ℤ. | Pass |
| §2.4 *Needs:* attribution (new gloss) | the owner of K_(2i)(𝔽_q)=0 | KTheoryFiniteLocalFields #1281 README line 71 imports it from GeneralAlgebraicKTheory §13.8c; this README's GAKT contract lacks §13.8c. | R01 |
| §3.2 / `solomonTits` at m=2 (changed wording) | V=𝔽₂², V=ℚ², ∅ | Nonzero proper subspaces are the lines, pairwise incomparable, so the nerve is discrete: 3 points over 𝔽₂, infinitely many over ℚ. k≠m−2=0 leaves k≥1, where H_k(discrete)=0=H_k(pt) and H_k(∅)=0=H_k(pt) too, so ∅ satisfies the statement; dim V=2≥1 gives a line, so the building is nonempty, exactly as the new text says. Reduced H₀=ℤ² over 𝔽₂ sits in degree m−2=0, consistent with the “basic laws” bullet. | Pass |
| §3.2 / `solomonTits` at m≥3 (changed wording) | V=𝔽₂³ | k=0: 14 vertices, 21 edges, connected, ℤ≅ℤ; the seven-line antichain fails (ℤ⁷→ℤ) and so does ∅ (0→ℤ), so degree zero does force nonemptiness and connectedness for m≥3 as the text says. | Pass |
| `integer_isLocalization_iff` | carried from the previous report | R a field; ℤ with S={(2)}, M=⟨2⟩, ⟨6⟩; 0∈M (previous report, same values). | Pass |
| `…of_torsion_classGroup` | carried from the previous report | ℤ[√−5], S={𝔭}, 𝔭²=(2); S=Spec¹ (previous report). | Pass |
| `regularPrime_dividedBernoulli_num` | carried from the previous report | p=2: 1/6, −1/60, 1/126, −1/120; (5,5): 1/66; (7,6): −691/16380; p=37 fails the hypothesis (previous report). | Pass |
| §§1.3, 3.2 duality, 3.4, 4.2, 4.4, 5.1, 5.3, 5.4, 6.3–6.6, 6.12, 6.15, 8.2, 8.7–8.9 | carried from the previous report, untouched by the diff | as in the previous report's table | Pass |

### Sources opened this round

| Target | Locator, cache line | Result |
| --- | --- | --- |
| 2.4, new locator | kbook IV.1.13, lines 15636–15640: K_n(𝔽_q)=ℤ/(qⁱ−1) for n=2i−1 and 0 for even n≥1; printed page 269 (footers at lines 15600 and 15665) | ✓ |
| 2.4 | kbook V.6.6, lines 24533–24544, p. 409: the Dedekind localization sequence in all degrees; lines 24572–24579: the finite-residue-field case 0→K₂(R)→K₂(F)→⊕(R/p)^×→SK₁(R)→1 | ✓ |
| 2.4 Check 1 | kbook III.6.5.1, lines 13575–13582, printed p. 236 (footers 13548, 13623): K₂(ℤ)↪K₂(ℚ) split by (r,s)_∞ | ✓ |
| 2.4 | kbook V.6.8, pp. 412–413: unchanged locator, verified in the previous round | carried |
| 3.2 | putman-studenmund §1, p. 3; kahn §4.3.1, p. 17: unchanged locators, verified in the previous round | carried |

### Cross-roadmap citations resolved at the open heads

- K2SymbolsBrauer (#1302) README lines 2648, 2678, 2692: §12.1 defines the subgroup unramified outside S; §12.2 states, for a number field and finite S, exactness of 0→K₂(O_(F,S))→K₂(F)→⊕_(𝔭∉S)k(𝔭)^×→0 with image the subgroup unramified outside S; §12.3 is the case S=∅. The README's sentence at lines 954–957 matches, including the finiteness of S.
- KTheoryFiniteLocalFields (#1281) README lines 211–300: §§1.1–1.6 exist; §1.5 states the restriction and transfer formulas on K_(2i−1)(𝔽_q) (citing IV.1.13, p. 269) and §1.6 states K_(2i)(𝔽̄_p)=0 with K_n(𝔽_q)≅K_n(𝔽̄_p)^Gal for n≥1. Its contract line 71 names GeneralAlgebraicKTheory §13.8c as the supplier of the integral groups (R01).
- GeneralAlgebraicKTheory (#1212) README line 3027, §13.8c: K₀(𝔽_q)=ℤ, K_(2i)(𝔽_q)=0, K_(2i−1)(𝔽_q)≅ℤ/(qⁱ−1).
- Consumers of §2.4: EllipticKTheory (#1489) README lines 1057 and 1090 cite ArithmeticKTheory §§2.1, 2.4, 3.4 for number-field K₂, which the generalized §2.4 still covers; K3BlochGroups (#1430) does not cite §2.4. `solomonTits` is cited within this README at lines 1266, 1278 and 1336 with the m≥2 statement, unaffected by the m=2 wording.
- `roadmaps resolve`: the single lead `VanishingCycles.etaleTateTwists` is the planned name of EtaleCohomologyFoundations F.0.3 on main, as in the previous round.
- `overlaps.md`: no other pull request changes this roadmap and no cited id is dropped; the closest roadmaps (KTheoryFiniteLocalFields, CyclotomicClassGroupsAndStickelberger, K3BlochGroups, K2SymbolsBrauerPartII, EllipticKTheory) were checked for the objects of the changed passages: none states Dedekind even-degree injectivity in all degrees or the Tits building.

### Declared gaps

Unchanged since the previous review: both slugs in `design/plan.json` match the README contracts, and neither supplier has closed its gap at its open head.

## Not verifiable

- As in the previous review: Bass–Tate, Groenewegen's preprint, Grayson LNM 966, Quillen's Seattle notes, Harris–Segal, Mitchell and Serre are waived or uncertified and were not read; the changed passages do not cite them.
- Sources outside the changed passages (fgv, hermitian, ravenel, rognes-k4, rognes-weibel, handbook, sharifi, ribet, caputo, banaszak, wildkernel, hutchinson, thomason, borel) were not reopened this round.

## Source issues

- none
