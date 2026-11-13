# GATE-HabiroNumberFields~3: answers to human review

One review (one point, F01) on `84e120a`. Repair commit: `2c1e0cbd` "HabiroNumberFields: review repairs (reduce Bloch classes through the local ring's Bloch group)". Only `TauCetiRoadmap/HabiroNumberFields/README.md` changed; `Suggested.lean` is unchanged.

## H01 (CBirkbeck) — applied differently

`TauCetiRoadmap/HabiroNumberFields/README.md` §1.11 (line 518) now defines reduction at 𝔮 through the localization O_(𝔮): ι:B(O_(𝔮))→B(F) and r:B(O_(𝔮))→B(k(𝔮)) are the maps K3BlochGroups §§3.4–3.5 induce from O_(𝔮)⊂F and from the residue homomorphism, and a class is reducible at 𝔮 when it lies in the image of P(O_(𝔮))→P(F). The old wording "reduction of admissible global representatives" (old line 526) is replaced by squares stated for every β∈B(O_(𝔮)), not by a map defined on that image. Reducing a chosen preimage does not give a well-defined map: over ℤ_(3), 2[2]+2[1/2] is a nonzero element of B(ℤ_(3)) that maps to 0 in P(ℚ) and to 4[−1]≠0 in P(𝔽₃)≅ℤ (new Check, line 535). For ℓ>2, the K₃ compatibility makes reduction modulo n depend only on ι(β), so the requested "membership in the image" model holds modulo n at every eligible prime. The 𝔽₂ contract is unchanged: at ℓ=2, P(O_(𝔮))=0.

**Claim verified.** At the head of K3BlochGroups' open pull request (`2cb125d3`), §3.4 defines P(A) for every commutative ring A, including the zero ring. It also gives a map P(A)→P(B) for every ring homomorphism, induced through the reduced presentation ℤ[W_A]/R₅. §3.5 defines B(A)=ker ∂ with induced maps and a boundary that commutes with them. K3BlochGroups is at line 139 of the merge order and HabiroNumberFields at line 330, so it is an admissible supplier.

**Why "applied differently".**
- The suggested wording "composed with the map from that local ring to the number field" cannot be a composite, because both maps start at the local ring. The repair therefore uses the pair of maps ι and r out of the local ring.
- Defining reduction on the image of ι by choosing a preimage needs the kernel of P(O_(𝔮))→P(F) to die in P(k(𝔮)). The ℤ_(3) element above shows that this fails:
  - P(ℤ_(3)) is free on the units ≡2 mod 3 (K3BlochGroups §3.4, Checks).
  - In P(ℚ), [x]+[x⁻¹] is killed by 2 (K3BlochGroups §3.6).
  - P(𝔽₃)≅ℤ on [−1] (K3BlochGroups §3.4, Checks).
  - The boundary is 2(2∧(−1))+2(2∧2)=0.
  - The image 4[−1] stays nonzero modulo every odd n>1.
- K3BlochGroups §4.22 (`bloch_dvr_equiv`) makes B(O_(𝔮))→B(F) an isomorphism only for residue fields with more than nine elements, and only under a stability hypothesis that no supplier proves. The eligible ℓ=5 (n=3) is outside that range, so the squares are stated on B(O_(𝔮)).
- At eligible ℓ>2, reduction modulo n is still well defined. The compatibility is now written out: b(ξ̄)=r(β) in B(k(𝔮))/n whenever b(ξ)=ι(β) in B(F)/n. Since Suslin's map b sends K₃(F) onto B(F), r(β) mod n depends only on ι(β).

**Edits (old → new).**
- Line 9, scope: added "K3BlochGroups §§3.4–3.5 own the pre-Bloch and Bloch groups of a commutative ring with their maps under ring homomorphisms".
- Line 53, supplier contract: "§§3.12–3.16, …" → "§§3.4–3.5, §§3.12–3.16, …", consuming P(A), B(A) and their ring-homomorphism maps. "the rational-curve and valuation specializations" → "the rational-curve specialization": §3.12's valuation lemma is rational and only about boundaries, so it never supplied a map of Bloch groups.
- Line 518, §1.11: the reduction definition, the squares on B(O_(𝔮)) with K3BlochGroups §3.16 carrying both sides to the old convention, and the explicit K₃ compatibility. The source locator notes that on symbols [u] with u and 1−u units at 𝔮, r is CGZ's termwise reduction (CGZ line 1126). *Needs:* gains K3BlochGroups §§3.4–3.5 and 3.16.
- Lines 526–527, laws:
  - The squares for ℓ>2 are restated on B(O_(𝔮)).
  - At ℓ=2, P(O_(𝔮))=0, because every unit u has 1−u∈𝔮O_(𝔮).
  - New law: every class of B(F) is reducible at all but finitely many 𝔮. §1.13 needs this because it works over "all but finitely many" eligible primes.
- Line 535: the new ℤ_(3) Check.
- Line 554, §1.13: "regulator reduction maps … from B(F₀)/n" → "regulator and Chern reduction squares … from the reducible classes of B(F₀)/n".
- Line 1242, consumers: K3BlochGroups §§3.4–3.5 added to the list of foundational inputs.

**Pattern search.** I checked every other use of "reduction" in the README:
- §1.12 "Its reduction" of eta now reads through §1.11, and is well defined modulo n at eligible ℓ>2.
- The 𝔽₂ exceptional contract (lines 15, 55, 520, 531, 543) stays as the review asks.
- No other passage reduces Bloch representatives.

**Ownership.** `roadmaps grep` for Bloch groups together with residue field, local ring, localization or reduction finds no roadmap on main or at the open heads that owns a reduction of number-field Bloch classes at a prime. The new text constructs nothing: it combines K3BlochGroups' maps and states squares that were already targets here.

### Adversarial pass on the added and changed statements

| statement | instances tried | values computed | result | change |
|---|---|---|---|---|
| Every preimage in P(O_(𝔮)) of a class of B(F) lies in B(O_(𝔮)) | Fˣ=O_(𝔮)ˣ×π^ℤ; Qₛ of a direct sum | Qₛ(A⊕Z)=Qₛ(A)⊕Qₛ(Z)⊕(A⊗Z), with τ preserving the summands, so Qₛ(O_(𝔮))→Qₛ(F) is split injective; ∂β↦∂ξ=0 forces ∂β=0 | holds | justification added to the law |
| Every class of B(F) is reducible at all but finitely many 𝔮 | c=[2]+[−1] over ℚ; 𝔮=2,3,5 | at 3: 2,−1∈W, r(c)=2[−1]; at 5: r(c)=[2]+[4]=[2]=2[3]≠0 in P(𝔽₅)≅ℤ/6; at 2: W_(ℤ_(2))=∅, so c reduces only if c=0 | holds (excluded set {2}) | none |
| ℓ=2 ⇒ P(O_(𝔮))=0 | residue field 𝔽₂ | ū=1 for every unit u, so 1−u∈𝔮; every generator is killed (matches K3BlochGroups §4.22 Check for ℤ_(2)) | holds | none |
| Choosing a preimage is not well defined in general | β=2[2]+2[1/2] over ℤ_(3) | ∂β=2(2∧(−1))+2(2∧2)=0+0; ι(β)=2([2]+[1/2])=0 in P(ℚ); r(β)=4[−1]; 4≢0 mod odd n>1 | negative control | new Check |
| K₃ compatibility ⇒ r(β) mod n depends only on ι(β) | β,β′ with ι(β)≡ι(β′) mod n | pick ξ with b(ξ)=ι(β) (b onto B(F), K3BlochGroups §4.20); then r(β)=b(ξ̄)=r(β′) | holds for ℓ>2 | none |
| The compatibility is false at 𝔽₃, so it is restricted to ℓ>2 | the ℤ_(3) β, ξ=0 | b(0̄)=0≠4[−1]=r(β); 𝔽₃ is outside b's q≥4 domain; ℓ=3≡−1 mod n would need n∣4 | the restriction is needed and costs nothing | none |
| Compatibility at an eligible prime | ℚ, n=3, ℓ=5 | b(ξ)=c lifts to [2]+[−1]; r=[2]=2[3], order 3 in B(𝔽₅)≅ℤ/3; on 3-parts, K₃(ℤ)→K₃(𝔽₅) is an isomorphism (5 generates (ℤ/9)ˣ) | consistent | none |
| Kernel elements of ι at ℓ=5 die in P(𝔽₅) | 2⟨u⟩ and [x]+[1−x]−[y]−[1−y] with u,x,y∈W_(ℤ_(5)) | 2⟨ū⟩=0 and c is independent of the point in P(𝔽₅) (\|𝔽₅\|≥4) | consistent | none |
| §3.16 old-convention transport | k(𝔮)=𝔽_ℓ, ℓ≥5; F infinite; n odd | κ is an isomorphism after ⊗ℤ/n (odd n) for \|field\|≥4 | holds | none |
| r agrees with CGZ's termwise projective reduction on admissible symbols | [u] with u,1−u units at 𝔮 | projective reduction gives ū∉{0,1,∞}; r[u]=[ū] (CGZ line 1126) | holds | locator added |

### Lean signatures

`Suggested.lean` is unchanged. I compared its six elaborated types (`signatures.md`, generated at the pinned libraries) with the README statements in §§1.1–1.3:
- `cyclicDilog` and `cyclicHypergeom` have the stated bodies and generality: a commutative ring and a field respectively.
- `cyclicDilog_quasiPeriodicity` has 0<n, primitive ζ and s≤n.
- `cyclicDilog_one_pow_twentyFour` has 0<n, primitive ζ and n≠0 in K.
- `cyclicHypergeom_shift` has xⁿ,yⁿ≠1 and the hypersurface condition.
- `kms` has n invertible, x,y,z≠0, X,Y≠1, X≠Y and the hypersurface condition.

No binders were lost, and nothing changed, so I ran no separate `#check` file beyond the build. The pinned Mathlib and Tau Ceti have no Bloch-group carrier (no match for "bloch"), so the reduction targets stay README-only, as the docstring already says.

## Build

`lake build TauCetiRoadmap.HabiroNumberFields.Suggested`: `Build completed successfully (8976 jobs).` There are four `declaration uses 'sorry'` warnings, at lines 43, 50, 62 and 71.

## Gate

`gate HabiroNumberFields: set_option=0 blob=0 latex=0 tex=0 prnum=0 sorry-data=0 sorry-examples=0 residue=0 private-paths=0 imports=0 mathlib-subimports=0 no-import-mathlib=0 lean-lines=0 statement-hygiene=0 forbidden=0 dropped=0 readme-ids-missing=0 empty-sections=0 round-labels=0 long-fences=0 layer-ids=0 target-ids=0 depcheck=0 metadata=0 stray-files=0 dirty=0 outside-folder=0 source-material=0 OK`

## Dependency direction

`depcheck: 222 roadmaps, 1971 edges, 0 problem(s)`. There are no UPWARD, CYCLE or `moved:` lines. The only new citations are of K3BlochGroups (§§3.4–3.5, 3.16), which is already a supplier and comes earlier in the merge order. No supplier moves down.

## Sources

No new sources were fetched. I used CGZ line 1126 (§4.3, termwise reduction) and CGZ lines 1197–1226 (Lemma 5.1), both from the cached v3 text. The K3BlochGroups facts are cited by section at its open head. `needs-references.toml` was not written.

## Untrusted text

The review contains no instructions beyond its mathematical request. Nothing suspicious was found.
